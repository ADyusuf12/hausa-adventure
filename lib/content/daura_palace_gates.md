---
id: "daura-palace-gates"
title: "The Gates of the Queen"
era: "mythic-origins"
location: "Daura Palace"
---

# Scene: The Royal Threshold

The massive wooden gates of Queen Daurama's palace loom over you, flanked by disciplined royal guards holding polished spears. Word of your victory at the Kusugu well travels fast, but the guards stand firm, eyeing you with a mixture of awe and caution.

## Choices

### choice_id: invoke_reputation

- **Text:** "Announce your deed and demand an audience with the Queen based on your favor with the Elders."
- **Conditions:**
  - `has_reputation`: {"daura_elders": 10}
- **Risk Level:** "low"
- **Goto:** "palace-audience-hall"

### choice_id: sneak_past

- **Text:** "Slip past the shadow of the perimeter wall while the guards are distracted by the town square celebrations."
- **Risk Level:** "high"
- **Roll Type:** "cowrie_stealth"
- **Success Route:** "palace-gardens"
- **Failure Route:** "palace-dungeon"

### choice_id: leverage_the_vanguard

- **Text:** "Order the armed young market trackers rallying behind you to display their weapons, forcing the gates open through soft intimidation."
- **Conditions:**
  - `has_reputation`: {"daura_army": 10}
- **Risk Level:** "medium"
- **Roll Type:** "cowrie_presence"
- **Success Route:** "palace-audience-hall"
- **Failure Route:** "palace-dungeon"
