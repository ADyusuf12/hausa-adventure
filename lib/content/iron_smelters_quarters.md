---
id: "iron-smelters-quarter"
title: "The Kilns of the Blacksmiths"
era: "mythic-origins"
location: "Daura Industrial Ward"
sources:
  - "hausa-metallurgy-historical-survey"
verified: true
---

# Scene: The Roaring Furnaces

Outside the palace walls lies the soot-stained quarter of the master ironsmiths. Tall clay blast furnaces roar into the evening sky, fueled by charcoal and bellows driven by heavily muscled young apprentices.

The Chief Blacksmith, his skin glistening with sweat, inspects your sword blade with a critical scowl. "A decent edge, but basic," he grunts. "Sarki’s hide is thick. If you want a weapon that truly bites deep, you need the secret techniques of the foundry."

## Choices

### choice_id: reinforce_iron_blade

- **Text:** "Work the bellows yourself, earning their professional respect to forge a reinforced cross-guard."
- **Risk Level:** "medium"
- **Roll Type:** "cowrie_combat"
- **Success Route:** "custom-blade-reformed"
- **Failure Route:** "daura-prologue-001"

### choice_id: exchange_market_secrets

- **Text:** "Tell them about the mineral deposits discovered by the market traders in exchange for quick steel tempering."
- **Conditions:**
  - `has_reputation`: {"daura_elders": 10}
- **Risk Level:** "low"
- **Effects:**
  - `receive_item`: "sacred-charm"
- **Goto:** "daura-prologue-001"

### choice_id: seek_deeper_forge_lore

- **Text:** "Ask the Chief Blacksmith to reveal the deeper mysteries of the forge and the spiritual pacts between craftsmen and furnace spirits."
- **Risk Level:** "high"
- **Goto:** "forge-masters-consecration"
