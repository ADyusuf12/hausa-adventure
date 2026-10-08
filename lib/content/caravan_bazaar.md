---
id: "caravan-bazaar"
title: "The Northern Trans-Saharan Camp"
era: "mythic-origins"
location: "Daura Market Outskirts"
sources:
  - "kano-chronicles-records"
verified: true
---

# Scene: The Outpost of Salt and Iron

At the edge of the market square, long-distance caravans from the north rest under vast indigo awnings. The scent of camels, crushed peppercorns, and heavy blocks of Saharan salt fills the air.

A seasoned trader resting on leather cushions notices your sword. "You look like someone preparing to face the monster in the stone," he grunts, running a hand over a display of tempered daggers. "The local iron is soft. I have a blade forged across the sand dunes that can pierce any scales—if you have the social backing to make the trade worth my time."

## Choices

### choice_id: buy_foreign_blade

- **Text:** "Use your rising influence with the marketplace elders to guarantee the trader tax exemption in exchange for the blade."
- **Conditions:**
  - `has_reputation`: {"daura_elders": 5}
- **Risk Level:** "low"
- **Effects:**
  - `receive_item`: "tempered-northern-blade"
- **Goto:** "daura-prologue-001"

### choice_id: ask_caravan_scouts

- **Text:** "Hire their desert trackers to survey the subterranean exits of the well for alternate entry points."
- **Risk Level:** "high"
- **Roll Type:** "cowrie_stealth"
- **Success Route:** "well-back-channels"
- **Failure Route:** "serpent-curse-prologue"

### choice_id: attend_guild_consortium

- **Text:** "The trader mentions that the major guild lords gather tonight in the Consortium Hall. Ask for passage to attend their closed council."
- **Risk Level:** "low"
- **Goto:** "merchant-consortium-hall"
