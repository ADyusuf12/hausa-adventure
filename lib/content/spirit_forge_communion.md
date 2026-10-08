---
id: "spirit-forge-communion"
title: "The Descent to the Bori Wellspring"
era: "mythic-origins"
location: "Sacred Grove - Underground Sanctum"
sources:
  - "bori-historical-liturgical-fragments"
  - "pre-islamic-hausa-spiritual-rites"
verified: true
---

# Scene: The Drowned Chambers

The Mai Dubu leads you down a hidden stairwell carved into living stone, descending past the grove into a subterranean chamber where cold water pools gather. The air tastes of copper and ancient moss. Clay vessels line the walls, each containing the preserved remains of ritual offerings—iron implements, charred cloth, calcified bones arranged in geometric precision.

In the center, a figure manifests. Not solid. Not entirely there. The entity speaks in a voice layered with whispers—an ancient Bori, a guardian of the foundational pacts between Daura's lineages and the spirits of stone, soil, and forge fire.

"One seeks the furnace oath but brings the doubter's blood. The spirits test not your arm, but your willingness to surrender the borders between flesh and the eternal. Will you drink deeper?"

## Choices

### choice_id: accept_spirit_binding

- **Text:** "Drink the sacred unguent mixed with crushed charcoal from the forge, allowing the Bori spirit to enter your blood as a protective possession."
- **Risk Level:** "high"
- **Roll Type:** "cowrie_wisdom"
- **Success Route:** "spirit-hardened-state"
- **Failure Route:** "serpent-curse-prologue"

### choice_id: negotiate_partial_compact

- **Text:** "Reject full possession but propose instead a binding contract: you offer iron and blood sacrifice quarterly in exchange for the spirit's tactical aid in combat."
- **Conditions:**
  - `has_item`: "sacred-charm"
- **Risk Level:** "medium"
- **Effects:**
  - `receive_item`: "bori-marked-sigil"
  - `reputation`: {"daura_elders": 7}
- **Goto:** "vanguard-loyal-state"
