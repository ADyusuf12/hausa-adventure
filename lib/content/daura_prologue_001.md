---
id: "daura-prologue-001"
title: "The Serpent at Kusugu"
era: "mythic-origins"
location: "Daura"
sources:
  - "bayajidda-oral-collection"
  - "daura-chronicle-1870"
verified: true
tags:
  - "historical"
  - "folklore"
  - "combat"
---

# Scene: The Well of Kusugu

You stand before the ancient stone perimeter of the Kusugu well. The air here tastes faintly of iron, dry dust, and old, hidden things. Below, the dark water conceals Sarki, the great serpent spirit who permits the people of Daura to draw water only once a week.

Your journey has led you to this choice. The future of the state hinges on your next move.

## Choices

### choice_id: consult_diviner

- **Text:** "Seek out the local elder and diviner near the marketplace to read the cosmic signs."
- **Conditions:**
  - `unless_item`: "sacred-charm"
- **Risk Level:** "low"
- **Goto:** "diviner-hut-prologue"

### choice_id: face_serpent

- **Text:** "Draw your iron blade, step past the threshold of the well, and confront Sarki directly."
- **Conditions:**
  - `has_item`: "sacred-charm"
- **Risk Level:** "high"
- **Roll Type:** "cowrie_combat"
- **Success Route:** "serpent-defeated"
- **Failure Route:** "serpent-curse-prologue"

### choice_id: trade_with_caravan

- **Text:** "Approach the dynamic Tuareg caravan masters setting up tents nearby to see if they possess foreign weapons."
- **Risk Level:** "low"
- **Goto:** "caravan-bazaar"

### choice_id: visit_weavers

- **Text:** "Head down the corridor of the artisans into the Weaver's Guild Ward to seek local faction backing."
- **Risk Level:** "low"
- **Goto:** "weavers-guild-ward"
