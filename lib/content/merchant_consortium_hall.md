---
id: "merchant-consortium-hall"
title: "The Conclave of Trade Guilds"
era: "mythic-origins"
location: "Daura Market Quarter - Consortium Hall"
sources:
  - "kano-chronicles-records"
  - "daura-trade-negotiation-scrolls"
verified: true
---

# Scene: The Hall of Silent Negotiation

Deep within the market quarter, behind a fortified adobe entrance guarded by merchant-soldiers, lies the Consortium Hall. Here, guild masters from across the savannah settle disputes over tariffs, slave routes, and salt monopolies.

The Chief Negotiator, a wizened woman adorned in layered indigo wraps, addresses a council of ten. Her voice is quiet but carries absolute authority. "The outer garrisons have seized three merchant caravans this moon cycle, claiming new 'protection taxes.' We need someone with proven combat reputation to publicly challenge this overreach—or quietly ensure those marshals have more urgent concerns."

She studies you with ancient eyes. "Which approach serves the Daura economy better?"

## Choices

### choice_id: formal_challenge_marshals

- **Text:** "Demand a public hearing before the Sarki's judges, presenting evidence of excessive taxation and corruption among the garrison commanders."
- **Conditions:**
  - `has_reputation`: {"daura_elders": 12}
- **Risk Level:** "medium"
- **Roll Type:** "cowrie_presence"
- **Success Route:** "noble-garment-state"
- **Failure Route:** "market-square-standoff"

### choice_id: coerce_caravan_safety

- **Text:** "Offer to personally escort the next merchant convoy past the garrison checkpoints, intimidating corrupt marshals through sheer martial presence."
- **Conditions:**
  - `has_item`: "master-forged-blade"
- **Risk Level:** "high"
- **Roll Type:** "cowrie_combat"
- **Success Route:** "vanguard-ascension-endpoint"
- **Failure Route:** "torture-interrogation-ward"

### choice_id: rouse_guild_whisperers

- **Text:** "Circulate a carefully planted whisper among the consortium: expose a minor marshal scandal and watch the council's temper."
- **Risk Level:** "low"
- **Roll Type:** "cowrie_presence"
- **Success Route:** "noble-garment-state"
- **Failure Route:** "market-square-standoff"
- **Effects:**
  - `reputation`: {"daura_elders": 6}
