---
id: "diviner-hut-prologue"
title: "The Diviner's Sanctuary"
era: "mythic-origins"
location: "Daura Marketplace"
verified: true
---

# Scene: The Smoldering Hearth

You step inside the dim, cool interior of the diviner's hut, away from the blinding glare of the Daura sun. Fragrant smoke from burning locust bean pods twists lazily toward the thatched ceiling.

The elder looks up from his woven mat, his eyes tracking your iron sword. "You seek the well," he states simply, nodding. "Many go. Few return without spiritual protection. Take this talisman—woven from ancestral threads. It will shield your spirit when Sarki turns his gaze upon you."

## Choices

### choice_id: claim_charm_and_return

- **Text:** "Accept the sacred charm, thank the elder, and make your way back to the Well of Kusugu."
- **Risk Level:** "low"
- **Effects:**
  - `receive_item`: "sacred-charm"
  - `reputation`: {"daura_elders": 5}
- **Goto:** "daura-prologue-001"

### choice_id: ask_bori_secrets

- **Text:** "Refuse the baseline charm and ask the Mai Dubu to teach you the specific rhythmic invocation of the Bori spirits."
- **Risk Level:** "high"
- **Roll Type:** "cowrie_wisdom"
- **Success Route:** "bori-shrine"
- **Failure Route:** "serpent-curse-prologue"
