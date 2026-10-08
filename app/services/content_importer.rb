require "yaml"

class ContentImporter
  def self.import_file(file_path)
    raw_content = File.read(file_path)

    unless raw_content.start_with?("---")
      raise "Invalid content format: Missing frontmatter metadata boundary."
    end

    parts = raw_content.split("---", 3)
    metadata = YAML.safe_load(parts[1])
    body_content = parts[2].strip

    # Isolate the main scene narrative text from the choice definitions
    scene_text, choices_text = body_content.split("## Choices", 2)

    room = Room.find_or_initialize_by(slug: metadata["id"])

    # Check for an explicit frontmatter image key, or build a clean default fallback name
    assigned_image = metadata["illustration"] || "illustrations/#{metadata['id']}.png"

    room.update!(
      title: metadata["title"],
      description_md: scene_text.strip,
      image_filename: assigned_image,
      metadata_json: metadata.except("id", "title", "illustration") # Keeps metadata clean!
    )

    # Clear out existing choices to ensure clean database tracking updates
    room.choices.destroy_all

    if choices_text.present?
      parse_choices(room, choices_text)
    end

    room
  end

  private

  def self.parse_choices(room, text)
    # Split out choice blocks cleanly by dividing at each choice_id heading block
    blocks = text.split(/### choice_id:\s*/)
    blocks.shift # Remove anything before the first choice block definition

    blocks.each do |block|
      lines = block.split("\n")
      identifier = lines.shift.strip # Extracts choice identifier cleanly

      data = {
        "Text" => "Continue...",
        "Risk Level" => "low",
        "Goto" => room.slug,
        "Conditions" => [],
        "Effects" => {}
      }

      current_mode = :standard
      collected_conditions = []
      collected_effects = []

      lines.each do |line|
        raw_line = line.dup
        stripped = line.strip
        next if stripped.blank?

        # Normalize line to robustly verify block headers
        normalized = stripped.downcase.gsub(/[\*\_\`\:]/, "")

        if normalized.start_with?("- conditions") || normalized.start_with?("conditions")
          current_mode = stripped.include?("[]") || stripped.include?("{}") ? :standard : :conditions
          next
        end

        if normalized.start_with?("- effects") || normalized.start_with?("effects")
          current_mode = stripped.include?("[]") || stripped.include?("{}") ? :standard : :effects
          next
        end

        # Escape sub-modes cleanly if we hit a standard top-level property line
        if stripped.start_with?("-") && stripped.include?(":") && !raw_line.start_with?(" ", "\t")
          current_mode = :standard
        end

        # Route elements to isolated structural block collections
        case current_mode
        when :conditions
          collected_conditions << line
          next
        when :effects
          collected_effects << line
          next
        end

        # Parse standard flat fallback keys on the main block body
        clean_line = stripped.gsub(/^[\*\-\s]+/, "")
        if clean_line.include?(":")
          key_part, val_part = clean_line.split(":", 2)
          key = key_part.gsub(/[\*\`\_\s]/, "").downcase
          val = val_part.strip.gsub(/^[\s"\*\-]+|[\s"\*\-]+$/, "").strip

          case key
          when "text"
            data["Text"] = val
          when "risklevel"
            data["Risk Level"] = val
          when "goto"
            data["Goto"] = val
          when "rolltype"
            data["Roll Type"] = val
          when "successroute"
            data["Success Route"] = val
          when "failureroute"
            data["Failure Route"] = val
          end
        end
      end

      # Compile Isolated Sub-Mode Condition Blocks
      if collected_conditions.any?
        begin
          # Strip styling backticks out to maintain standard YAML readability
          raw_yaml = collected_conditions.map { |l| l.gsub("`", "") }.join("\n")
          parsed = YAML.safe_load(raw_yaml)

          # Convert standard array lists or mapped hashes into an integrated collection
          data["Conditions"] = parsed.is_a?(Hash) ? [parsed] : Array(parsed)
        rescue => e
          Rails.logger.error "❌ [Importer] Failed to parse Conditions for choice [#{identifier}]: #{e.message}"
          data["Conditions"] = []
        end
      end

      # Compile Isolated Sub-Mode Effect Blocks
      if collected_effects.any?
        begin
          raw_yaml = collected_effects.map { |l| l.gsub("`", "") }.join("\n")
          parsed = YAML.safe_load(raw_yaml)

          if parsed.is_a?(Array)
            # Squash unified layout array elements into a single combined hash map
            parsed.each do |item|
              data["Effects"] = data["Effects"].merge(item) if item.is_a?(Hash)
            end
          elsif parsed.is_a?(Hash)
            data["Effects"] = data["Effects"].merge(parsed)
          end
        rescue => e
          Rails.logger.error "❌ [Importer] Failed to parse Effects for choice [#{identifier}]: #{e.message}"
        end
      end

      # Ensure combat checks resolve target_room_slug correctly to the success endpoint
      final_goto_slug = data["Goto"]
      if data["Roll Type"].present? && final_goto_slug == room.slug
        final_goto_slug = data["Success Route"] || data["Goto"]
      end

      # Persist the clean structural data maps down to ActiveRecord records
      room.choices.create!(
        choice_identifier: identifier,
        text: data["Text"],
        target_room_slug: final_goto_slug,
        risk_level: data["Risk Level"],
        roll_type: data["Roll Type"],
        success_slug: data["Success Route"],
        failure_slug: data["Failure Route"],
        conditions_json: data["Conditions"],
        effects_json: data["Effects"]
      )
    end
  end
end
