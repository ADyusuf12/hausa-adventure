# app/services/content_importer.rb
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
    room.update!(
      title: metadata["title"],
      description_md: scene_text.strip,
      metadata_json: metadata.except("id", "title")
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
      lines = block.strip.split("\n")
      identifier = lines.shift.strip # Extracts choice identifier cleanly

      data = {
        "Text" => "Continue...",
        "Risk Level" => "low",
        "Goto" => room.slug,
        "Conditions" => {},
        "Effects" => {}
      }

      # Process lines inside this specific choice block context
      lines.each do |line|
        clean_line = line.strip.gsub(/^[\*\-\s]+/, "") # Wipes bullet point markers out
        next if clean_line.blank?

        if clean_line.include?(":")
          key_part, val_part = clean_line.split(":", 2)

          # Strips out markdown bolding flags (**), backticks, and asterisks cleanly from the key strings
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
            when "conditions"
            begin
              data["Conditions"] = YAML.safe_load(val_part.strip) || {}
            rescue => _e
              data["Conditions"] = {}
            end
          end
        end
      end

      # Parse out complex nested block dictionary formatting styles like our custom inline reputation rules
      if effect_match = block.match(/(?:effects):\s*\n([\s\S]*?)(?=\n\s*\*|\n\s*###|\z)/i)
        begin
          data["Effects"] = YAML.safe_load(effect_match[1]) || {}
        rescue => _e
          data["Effects"] = {}
        end
      end

      # Commit securely to our relational database schema
      room.choices.create!(
        choice_identifier: identifier,
        text: data["Text"],
        target_room_slug: data["Goto"],
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
