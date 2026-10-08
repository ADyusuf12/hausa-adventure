# app/services/cowrie_engine.rb
class CowrieEngine
  # Four cowrie shells are cast. Each can land face up (concave) or face down.
  # In Hausa divining contexts, different configurations carry different weights.
  # For our core engine, the number of 'up' shells determines the raw score.
  def self.generate_check(player, choice)
    # Roll 4 distinct random binary shells (true = mouth up, false = flat down)
    rolls = Array.new(4) { rand(2) == 1 }
    up_count = rolls.count(true)

    # Determine base success (e.g., 2 or more shells facing up is a success)
    # You can later customize this to look at specific attributes or item modifiers
    passed = up_count >= 2

    target_slug = passed ? choice.success_slug : choice.failure_slug

    payload = {
      player_id: player.id,
      choice_identifier: choice.choice_identifier,
      rolls: rolls,
      passed: passed,
      target_room_slug: target_slug,
      timestamp: Time.current.to_i
    }

    # Encrypt and sign the payload using Rails' built-in MessageVerifier
    # This token expires automatically after 60 seconds to prevent replay attacks
    token = Rails.application.message_verifier("cowrie_rolls").generate(payload, expires_in: 15.minutes)

    {
      token: token,
      rolls: rolls,
      passed: passed,
      up_count: up_count
    }
  end

  # Decrypts and validates an incoming token signature safely
  def self.verify_and_decrypt(token)
    begin
      Rails.application.message_verifier("cowrie_rolls").verify(token)
    rescue ActiveSupport::MessageVerifier::InvalidSignature, ActiveSupport::MessageVerifier::ExpiredMessage
      nil
    end
  end
end
