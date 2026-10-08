---
id: "palace-dungeon"
title: "The Sunless Cells"
era: "mythic-origins"
location: "Beneath Daura Palace"
---

# Scene: The Sunless Cells

A sudden rustle of dry leaves betrayed your position. Before you could spring out of the brush, a heavy iron spear shaft barred your path, and three more guards closed in around you from the shadows.

"A snake-slayer or not, no one sneaks into the palace grounds under the cover of night," the captain growls.

You have been stripped of your weapons and thrown into a damp, stone cell beneath the palace foundations. The distant sounds of marketplace celebrations mock your confinement. You'll need to find a way to secure your freedom.

## Choices

### choice_id: bribe_guard

- **Text:** "Call out to the cell guard and offer to trade your Sacred Charm for an unlocked door."
- **Conditions:**
  - `has_item`: "sacred-charm"
- **Risk Level:** "low"
- **Goto:** "dungeon-escape-prologue"

### choice_id: channel_stones

- **Text:** "Feel through the pitch-black silt along the floor to find a loosened structural iron bracing to shimmy the lock."
- **Risk Level:** "high"
- **Roll Type:** "cowrie_stealth"
- **Success Route:** "dungeon-escape-prologue"
- **Failure Route:** "torture-interrogation-ward"
