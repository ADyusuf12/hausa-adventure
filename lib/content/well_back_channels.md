---
id: "well-back-channels"
title: "The Subterranean Vaults"
era: "mythic-origins"
location: "Beneath Kusugu Well"
---

# Scene: The Dry Channels

Guided by the caravan scouts' maps, you drop down an ancient, forgotten drainage shaft located half a mile from the main well hub. You find yourself navigating dark, cool limestone caverns directly beneath the town floor.

The sound of churning water echoes off the walls. Ahead, you can see the massive, coils of Sarki shifting in the dark, completely unaware of your presence from this rear passage.

## Choices

### choice_id: ambush_serpent

- **Text:** "Use the element of surprise to strike Sarki from behind before it can summon its spiritual curse."
- **Risk Level:** "medium"
- **Roll Type:** "cowrie_combat"
- **Success Route:** "serpent-defeated"
- **Failure Route:** "serpent-curse-prologue"

### choice_id: steal_sacred_mud

- **Text:** "Avoid combat entirely; quietly scrape the glowing, spiritually-charged clay from the well pool base and slip away."
- **Risk Level:** "low"
- **Effects:**
  - `receive_item`: "sacred-charm"
- **Goto:** "daura-prologue-001"
