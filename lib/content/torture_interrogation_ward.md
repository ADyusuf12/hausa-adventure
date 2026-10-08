---
id: "torture-interrogation-ward"
title: "The Marshal's Interrogation Chamber"
era: "mythic-origins"
location: "Beneath Daura Palace"
---

# Scene: The Iron Pillars

Your mechanical tinkering with the lock-pin rings out too loudly. Heavy wooden doors fly open, and the Palace Marshal's brute interrogators drag you into an adjacent room illuminated by oil lanterns.

A high-ranking court noble stands by the wall. "You have agitated the marketplace and broken our treaty with the northern caravans," he notes coldly. "Sign this scroll assigning your claim over the Well of Kusugu directly to the Queen's personal treasury, or rot here forever."

## Choices

### choice_id: sign_well_decree

- **Text:** "Affix your thumbprint to the scroll, relinquishing your popular claims in exchange for immediate release to the city gates."
- **Risk Level:** "low"
- **Effects:**
  - `reputation`: {"daura_elders": 10, "daura_elders": -15}
- **Goto:** "daura-palace-gates"

### choice_id: incite_labor_riot

- **Text:** "Spit on the parchment scroll and loudly shout the sacred names of the Bori spirits, inciting the enslaved underground laborers to riot."
- **Risk Level:** "high"
- **Roll Type:** "cowrie_presence"
- **Success Route:** "dungeon-escape-prologue"
- **Failure Route:** "bori-exile-endpoint"
