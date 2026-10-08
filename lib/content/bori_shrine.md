---
id: "bori-shrine"
title: "The Grove of the Spirits"
era: "mythic-origins"
location: "Daura Outskirts"
sources:
  - "bori-historical-liturgical-fragments"
verified: true
---

# Scene: The Taboo Sanctuary

The Mai Dubu leads you past the edge of the farmlands to a secluded ring of ancient tamarind trees. This is a sanctuary of the Bori—the old spiritual framework of the Hausa states before the written scrolls arrived.

Clay vessels containing liquid herbal extractions lie nested between the roots. The diviner strikes a small iron rod against a bronze bowl, filling the silent grove with a piercing vibration. "If you wish to match Sarki," he whispers, "you must let the ancient protective forces of the soil occupy your mind."

## Choices

### choice_id: accept_possession_ritual

- **Text:** "Submit to the intense Bori ritual, drinking the herbal draught to harden your spirit against corruption."
- **Risk Level:** "high"
- **Roll Type:** "cowrie_wisdom"
- **Success Route:** "sacred-grove-canopy"
- **Failure Route:** "serpent-curse-prologue"

### choice_id: take_herbal_wash

- **Text:** "Declining the deep spirit rite, simply wash your iron blade in the sacred liquid to temporarily coat its edges."
- **Risk Level:** "low"
- **Effects:**
  - `receive_item`: "sacred-charm"
- **Goto:** "daura-prologue-001"
