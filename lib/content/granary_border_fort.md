---
id: "daura-outer-farms"
title: "The Millet Fields of Daura"
era: "mythic-origins"
location: "Daura Perimeter"
---

# Scene: The Edge of the Savannah

Beyond the city’s defensive clay walls lie sprawling fields of tall grain, broken only by massive baobab trees[cite: 26]. Here, local farmers and outer guards work side-by-side, ever watchful for foreign raiders or wild beasts[cite: 26].

A platoon of young guardsmen is practicing spear formations in the clearing[cite: 26]. They recognize you from the well standoff and pause their drills, watching to see if your legendary skills match the market rumors[cite: 26].

## Choices

### choice_id: train_the_vanguard

- **Text:** "Step into the square and teach the young recruits tactical defensive maneuvers."[cite: 26]
- **Risk Level:** "medium"[cite: 26]
- **Roll Type:** "cowrie_presence"[cite: 26]
- **Success Route:** "granary-border-fort"
- **Failure Route:** "market-square-standoff"[cite: 26]

### choice_id: forage_medicinal_roots

- **Text:** "Avoid the guards entirely; search the base of the baobabs for wild curative roots to counter venom."[cite: 26]
- **Risk Level:** "low"[cite: 26]
- **Effects:**
  - `receive_item`: "sacred-charm"[cite: 26]
- **Goto:** "daura-prologue-001"[cite: 26]
