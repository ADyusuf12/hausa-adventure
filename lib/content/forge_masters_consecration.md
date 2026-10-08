---
id: "forge-masters-consecration"
title: "The Furnace Oath of the Blacksmiths"
era: "mythic-origins"
location: "Daura Industrial Ward - Deep Foundry"
sources:
  - "hausa-metallurgy-historical-survey"
  - "ritual-iron-working-traditions"
verified: true
---

# Scene: The Inner Kiln

The Chief Blacksmith escorts you past the roaring public furnaces into a shadowed chamber. Here, in the stone heart of the foundry, older masters gather around a blast furnace burning so hot that the clay walls glow faintly red. The air tastes of iron oxide and ancient oath-taking.

"Your blade has merit," the eldest smith says, his voice low. "But steel is only half the craft. The furnace remembers the hands that shaped it, and those hands must be consecrated—marked by the old pacts between fire-workers and the spirits that dwell in molten stone."

He gestures to a ritual anvil, its surface carved with geometric patterns worn smooth by centuries. "Will you take the oath that binds a craftsman to his forge?"

## Choices

### choice_id: swear_iron_consecration

- **Text:** "Place your hand upon the consecration anvil and speak the oath in the old Hausa tongue, binding yourself to the furnace spirits' covenant."
- **Risk Level:** "high"
- **Roll Type:** "cowrie_wisdom"
- **Success Route:** "spirit-forge-communion"
- **Failure Route:** "daura-prologue-001"

### choice_id: learn_tempering_secrets

- **Text:** "Ask to apprentice under the eldest smith for one full moon cycle, learning the precise temperature curves where iron becomes unbreakable steel."
- **Risk Level:** "medium"
- **Effects:**
  - `receive_item`: "master-forged-blade"
  - `reputation`: {"daura_elders": 8}
- **Goto:** "merchant-consortium-hall"
