---
id: "palace-audience-hall"
title: "The Palace Audience Hall"
era: "mythic-origins"
location: "Daura Palace"
end_state: true
---

# Scene: The Presence of the Queen

The heavy doors swing wide, admitting you into a high-ceilinged chamber lined with pillars of polished clay. At the far end, seated on an elevated dais covered in rich woven textiles, sits Queen Daurama.

The elders who accompanied you speak highly of your triumph over Sarki. The Queen listens intently, her expression shifting from royal reserve to profound relief.

"You have shattered a curse that has bound our people for generations," Queen Daurama says, her voice echoing in the hall. "Your name will be remembered as long as the walls of Daura stand."

## Choices

### choice_id: accept_royal_boon

- **Text:** "Bow respectfully and accept the Queen's offer to join the royal council as a protector of the realm."
- **Effects:**
  - `reputation`: {"daura_elders": 20}
- **Goto:** "daura-council-prologue"
