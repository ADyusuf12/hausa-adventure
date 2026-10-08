---
id: "dungeon-escape-prologue"
title: "Escape from the Depths"
era: "mythic-origins"
location: "Beneath Daura Palace"
---

# Scene: The Unlocked Grate

The guard's eyes widen at the sight of the gleaming charm. Greed overcomes his loyalty to the palace marshals; he snatches the talisman, slides the heavy iron key into your lock, and gestures toward a low structural drainage canal running along the foundation wall.

You slip out into the damp dark, navigating through the ancient clay channels until you arrive at a subterranean vault where palace laborers and blacklisted blacksmiths meet in secret. They recognize you as the hero of the well and whisper of a rebellion forming against the marshals.

## Choices

### choice_id: rally_blacksmiths

- **Text:** "Rally the underground ironsmiths to forge weapons and join your hidden army."
- **Risk Level:** "high"
- **Effects:**
  - `reputation`: {"daura_army": 15}
- **Goto:** "daura-palace-gates"

### choice_id: seek_elders_sanctuary

- **Text:** "Escape the palace perimeter completely and ask the city elders to broker a formal royal pardon."
- **Risk Level:** "low"
- **Effects:**
  - `reputation`: {"daura_elders": 10}
- **Goto:** "daura-palace-gates"
