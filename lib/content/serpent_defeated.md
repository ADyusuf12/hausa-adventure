---
id: "serpent-defeated"
title: "Sarki's Defeat"
era: "mythic-origins"
location: "Daura Well"
sources:
  - "bayajidda-oral-collection"
verified: true
---

# Scene: The Well Reclaimed

With a decisive strike, your iron blade cuts through the humid dark. Sarki thrashes, sending old well-water spraying against the ancient stone blocks, before retreating deep into the dark subterranean channels below.

The curse is lifted. The water belongs to the people of Daura once more.

As you catch your breath, the local elders and eager young trackers rush forward from the marketplace, astonished by your bravery. "You have freed us," their leader whispers, bowing low.

## Choices

### choice_id: claim_glory_diplomat

- **Text:** "Accept the blessings of the elders, dedicating your victory to the continuity of Daura's ancestral lineage."
- **Risk Level:** "low"
- **Effects:**
  - `reputation`: {"daura_elders": 10, "daura_court": 5}
- **Goto:** "daura-palace-gates"

### choice_id: claim_glory_warlord

- **Text:** "Raise your bloodied blade to the crowd, commanding the young men of the market to arm themselves and march behind you as a vanguard."
- **Risk Level:** "low"
- **Effects:**
  - `reputation`: {"daura_army": 15}
- **Goto:** "daura-palace-gates"
