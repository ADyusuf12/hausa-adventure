---
id: "palace-whispers-prologue"
title: "The Palace Whispers"
era: "mythic-origins"
location: "Daura Palace Grounds"
---

# Scene: Shadows under the Colonnade

You flatten your back against the cool clay pillars outside the Queen’s private council chambers. Through the decorative wood screen, you hear the frantic voices of senior advisors discussing the power vacuum left by Sarki’s defeat.

"The one who controls the water controls the caravan routes," one councilor snarls. "If the hero allies with the city elders, the Queen's direct executive control over the outer markets is broken!"

You now possess highly sensitive knowledge regarding the political cracks splitting the royal court.

## Choices

### choice_id: leverage_elders

- **Text:** "Slip away to share this scheme with the market elders, fortifying their negotiation leverage against the court."
- **Risk Level:** "low"
- **Effects:**
  - `reputation`: {"daura_elders": 15}
- **Goto:** "daura-palace-gates"

### choice_id: confront_advisors

- **Text:** "Step directly into the chambers, offering to keep the court's secrets secure in exchange for direct command of the palace outer guard."
- **Risk Level:** "high"
- **Effects:**
  - `reputation`: {"daura_army": 10, "daura_elders": 10}
- **Goto:** "palace-audience-hall"
