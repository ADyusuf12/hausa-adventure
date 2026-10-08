---
id: "weavers-guild-ward"
title: "The Weaver's Guild Ward"
era: "mythic-origins"
location: "Daura Artisans Sector"
sources:
  - "hausa-textile-dyeing-archive"
verified: true
---

# Scene: The Indigo Pits

You enter the vibrant, bustling open-air courtyards of the master weavers and textile dyers. Deep clay cylinders sunk into the ground are filled with dark, fermenting indigo liquors, their pungent, sweet scent thick in the hot air.

The Guild Matriarch stands over a line of rich, hand-woven indigo cloths. She looks you over. "The hero who made the well run free," she says thoughtfully. "The palace wants to tax our looms out of existence. Help us smuggle our finest ceremonial vestments out past the market marshals, and we will clothe you in the official attire of a recognized Daura noble."

## Choices

### choice_id: smuggle_guild_textiles

- **Text:** "Conceal the prized indigo wraps inside a northern salt merchant's empty bags and run the checkpoint."
- **Risk Level:** "medium"
- **Roll Type:** "cowrie_stealth"
- **Success Route:** "noble-garment-state"
- **Failure Route:** "market-square-standoff"

### choice_id: negotiate_guild_protection

- **Text:** "Use your current standing with the city elders to broker an official protection pact for the dyers' pits right now."
- **Conditions:**
  - `has_reputation`: {"daura_elders": 10}
- **Risk Level:** "low"
- **Effects:**
  - `receive_item`: "sacred-charm"
  - `reputation`: {"daura_elders": 5}
- **Goto:** "caravan-bazaar"
