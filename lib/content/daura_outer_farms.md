---
id: "daura-outer-farms"
title: "The Millet Fields of Daura"
era: "mythic-origins"
location: "Daura Perimeter"
---

# Scene: The Edge of the Savannah

Beyond the city’s defensive clay walls lie sprawling fields of tall grain, broken only by massive baobab trees. Here, local farmers and outer guards work side-by-side, ever watchful for foreign raiders or wild beasts.

A platoon of young guardsmen is practicing spear formations in the clearing. They recognize you from the well standoff and pause their drills, watching to see if your legendary skills match the market rumors.

## Choices

### choice_id: train_the_vanguard

- **Text:** "Step into the square and teach the young recruits tactical defensive maneuvers."
- **Risk Level:** "medium"
- **Roll Type:** "cowrie_presence"
- **Success Route:** "granary-border-fort"
- **Failure Route:** "market-square-standoff"

### choice_id: forage_medicinal_roots

- **Text:** "Avoid the guards entirely; search the base of the baobabs for wild curative roots to counter venom."
- **Risk Level:** "low"
- **Effects:**
  - `receive_item`: "sacred-charm"
- **Goto:** "daura-prologue-001"
