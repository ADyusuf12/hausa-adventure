# app/models/choice.rb
class Choice < ApplicationRecord
  belongs_to :room

  def available_to?(player)
    return true if conditions_json.blank?

    normalized_conditions = Array(conditions_json)

    normalized_conditions.each do |condition|
      # Scenario A: Structured dictionary map representation
      if condition.is_a?(Hash)
        if item_req = condition["has_item"]
          return false unless player.has_item?(item_req)
        end

        if item_blocked = condition["unless_item"]
          return false if player.has_item?(item_blocked)
        end

        # Faction Reputation Check
        if rep_req = condition["has_reputation"]
          rep_req.each do |faction, required_score|
            return false if player.reputation_for(faction) < required_score.to_i
          end
        end

      # Scenario B: Flat string fallback representation
      elsif condition.is_a?(String)
        # Strip out markdown formatting artifacts and squeeze out internal spaces for comparison
        clean_cond = condition.gsub(/[\`\'\"\s]/, "")

        if clean_cond.start_with?("-")
          clean_cond = clean_cond[1..-1] # Strip leading list dashes if present
        end

        # Positive condition check
        if clean_cond.include?("has_item:")
          item_req = clean_cond.split("has_item:").last.strip
          return false unless player.has_item?(item_req)
        end

        # Negative condition check
        if clean_cond.include?("unless_item:")
          item_blocked = clean_cond.split("unless_item:").last.strip
          return false if player.has_item?(item_blocked)
        end

        # String fallback for reputation check (e.g. "has_reputation:{daura_elders:15}")
        if clean_cond.include?("has_reputation:")
          # Extract the inside of the hash brackets or colon string
          raw_rep = clean_cond.split("has_reputation:").last.gsub(/[\{\}]/, "")
          faction_part, score_part = raw_rep.split(":")
          if faction_part.present? && score_part.present?
            return false if player.reputation_for(faction_part.strip) < score_part.to_i
          end
        end
      end
    end

    true
  end
end
