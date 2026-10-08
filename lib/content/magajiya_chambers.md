---
id: "magajiya-chambers"
title: "The Court of the Queen Mother"
era: "mythic-origins"
location: "Daura Palace Inner Wing"
sources:
  - "daura-chronicle-1870"
verified: true
---

# Scene: The Unseen Authority

You step into a beautifully shaded courtyard where old royal women sit on woven mats, spinning cotton. At the center sits the Magajiya—the high priestess and Queen Mother, whose authority over the traditional state lineage rivals that of Queen Daurama herself.

She looks at you from behind a thin veil, her fingers playing with a handful of polished cowries. "The young warrior who conquered the well," she murmurs. "The court thinks you belong to them now. But the old customs of Daura require a different path."

## Choices

### choice_id: pledge_to_magajiya

- **Text:** "Bow to the Magajiya, promising to preserve the traditional shrines and rituals from external court interference."
- **Risk Level:** "low"
- **Effects:**
  - `reputation`: {"daura_elders": 20}
- **Goto:** "palace-audience-hall"

### choice_id: ask_for_political_talisman

- **Text:** "Ask for her official symbol of lineage authorization to protect you from the court’s marshals."
- **Risk Level:** "medium"
- **Roll Type:** "cowrie_presence"
- **Success Route:** "palace-audience-hall"
- **Failure Route:** "palace-dungeon"
