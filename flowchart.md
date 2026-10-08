graph TD
%% ==========================================
%% COLOR CLASS DEFINITIONS
%% ==========================================
classDef startHub fill:#b45309,stroke:#f59e0b,stroke-width:3px,color:#fff;
classDef boriPath fill:#0f766e,stroke:#14b8a6,stroke-width:2px,color:#fff;
classDef martialPath fill:#991b1b,stroke:#ef4444,stroke-width:2px,color:#fff;
classDef elderPath fill:#1e3a8a,stroke:#3b82f6,stroke-width:2px,color:#fff;
classDef dangerZone fill:#581c87,stroke:#c084fc,stroke-width:2px,color:#fff;
classDef endState fill:#111827,stroke:#10b981,stroke-width:4px,color:#fff;

    %% ==========================================
    %% DOMAIN ORGANIZATIONAL SUBGRAPHS
    %% ==========================================

    subgraph Origin [The Central Bottleneck]
        START["🎒 daura-prologue-001<br>(The Well of Kusugu)"]:::startHub
    end

    subgraph SpiritualDomain [The Bori & Ancestral Network]
        DH["🔮 diviner-hut-prologue<br>(The Smoldering Hearth)"]:::boriPath
        BS["🌳 bori-shrine<br>(The Taboo Sanctuary)"]:::boriPath
        SGC["☁️ sacred-grove-canopy<br>(The Whispering Leaves)"]:::boriPath
        SHS["🛡️ spirit-hardened-state<br>(The Shield of the Soil)"]:::boriPath
        SFC["🔥 spirit-forge-communion<br>(The Drowned Chambers)"]:::boriPath
    end

    subgraph CommercialDomain [The Marketplace & Artisans Sector]
        CB["🐫 caravan-bazaar<br>(The Northern Camp)"]:::elderPath
        WGW["🪡 weavers-guild-ward<br>(The Indigo Pits)"]:::elderPath
        WBC["🦎 well-back-channels<br>(Subterranean Vaults)"]:::elderPath
        NGS["👑 noble-garment-state<br>(Vestments of Honor)"]:::elderPath
        MCH["💼 merchant-consortium-hall<br>(The Conclave of Trade)"]:::elderPath
    end

    subgraph MartialDomain [The Frontier & Iron Foundry]
        MSS["⚔️ market-square-standoff<br>(The Drawn Blades)"]:::martialPath
        DOF["🌾 daura-outer-farms<br>(The Edge of Savannah)"]:::martialPath
        GBF["🏹 granary-border-fort<br>(Watchtowers of Earth)"]:::martialPath
        ISQ["🔥 iron-smelters-quarter<br>(The Roaring Furnaces)"]:::martialPath
        CBR["🔨 custom-blade-reformed<br>(The Tempered Edge)"]:::martialPath
        VLS["🛡️ vanguard-loyal-state<br>(Sworn on Iron)"]:::martialPath
        FMC["⚒️ forge-masters-consecration<br>(The Furnace Oath)"]:::martialPath
    end

    subgraph CitadelDomain [The Intrigues of the Court]
        DPG["🏰 daura-palace-gates<br>(The Royal Threshold)"]:::elderPath
        PG["🌸 palace-gardens<br>(The Inner Courtyard)"]:::elderPath
        PWP["👥 palace-whispers-prologue<br>(Shadows under Colonnade)"]:::elderPath
        MC["👵 magajiya-chambers<br>(Court of Queen Mother)"]:::elderPath
        PAH["👑 palace-audience-hall<br>(Presence of the Queen)"]:::endState
    end

    subgraph DetentionDomain [The Palace Subterranean Retribution]
        PD["⛓️ palace-dungeon<br>(The Sunless Cells)"]:::dangerZone
        TIW["🔥 torture-interrogation-ward<br>(The Marshal's Chamber)"]:::dangerZone
        DEP["🗝️ dungeon-escape-prologue<br>(The Unlocked Grate)"]:::dangerZone
    end

    subgraph Endings [Historical Ledger Terminal States]
        E_EXILE["🧿 bori-exile-endpoint<br>(The Sage of Shrines)"]:::endState
        E_COURT["📜 daura-council-prologue<br>(The Grand Vizier Decree)"]:::endState
        E_ARMY["🛡️ vanguard-ascension-endpoint<br>(The Iron Sovereign)"]:::endState
    end

    %% ==========================================
    %% FLOW AND INTERACTION CONNECTIONS
    %% ==========================================

    %% Hub Branching Options
    START -->|unless_item: sacred-charm| DH[cite: 28]
    START -->|Approach Caravans| CB[cite: 28]
    START -->|Visit Weavers| WGW[cite: 28]
    START -->|has_item: sacred-charm<br>Roll Combat Success| SD["🐉 serpent-defeated"]:::startHub[cite: 28]
    START -->|Roll Combat Fail| SCP["❌ serpent-curse-prologue"]:::dangerZone[cite: 28]

    %% Failsafe Loop
    SCP -->|lick_wounds| START

    %% Spiritual Logic Connections
    DH -->|claim_charm: +5 Elders| START
    DH -->|ask_bori_secrets: Roll Wisdom Success| BS
    DH -->|Roll Wisdom Fail| SCP

    BS -->|take_herbal_wash: Get Charm| START[cite: 22]
    BS -->|accept_possession: Roll Wisdom Success| SGC[cite: 22]
    BS -->|Roll Wisdom Fail| SCP[cite: 22]

    SGC -->|claim_ancestral_oath: Roll Wisdom Success| E_EXILE
    SGC -->|Roll Wisdom Fail| SCP
    SGC -->|descend_with_power| SHS

    SHS -->|Empowered Confrontation| SD

    %% Commercial Logic Connections
    WBC -->|steal_sacred_mud: Get Charm| START
    WBC -->|ambush_serpent: Roll Combat Success| SD
    WBC -->|Roll Combat Fail| SCP

    WGW -->|negotiate_guild_protection: req 10 Elders| CB
    WGW -->|smuggle_guild_textiles: Roll Stealth Success| NGS
    WGW -->|Roll Stealth Fail| MSS

    NGS -->|Walk Proud Checkpoint| DPG

    %% Resolution Path Options Split
    SD -->|claim_glory_diplomat: +10 Elders| DPG
    SD -->|claim_glory_warlord: +15 Army| DPG

    %% Martial Logic Connections
    MSS -->|fight_out_of_bazaar: Roll Combat Success| ISQ
    MSS -->|rally_the_market_crowd: Roll Presence Success| DOF
    MSS -->|Any Failure State| PD

    DOF -->|forage_medicinal_roots: Get Charm| START[cite: 26]
    DOF -->|train_the_vanguard: Roll Presence Success| GBF[cite: 26]
    DOF -->|Roll Presence Fail| MSS[cite: 26]

    GBF -->|secure_grain_corridor: Roll Combat Success| E_ARMY
    GBF -->|Roll Combat Fail| MSS

    VLS -->|confront_the_palace: +20 Army| DPG

    ISQ -->|exchange_market_secrets: req 10 Elders| START
    ISQ -->|reinforce_iron_blade: Roll Combat Success| CBR
    ISQ -->|seek_deeper_forge_lore| FMC
    ISQ -->|Roll Combat Fail| START

    FMC -->|swear_iron_consecration: Roll Wisdom Success| SFC
    FMC -->|learn_tempering_secrets: Get master-forged-blade| MCH
    FMC -->|Roll Wisdom Fail| START

    SFC -->|accept_spirit_binding: Roll Wisdom Success| SHS
    SFC -->|negotiate_partial_compact: Get bori-marked-sigil| VLS
    SFC -->|Roll Wisdom Fail| SCP

    CBR -->|sweep_well_with_blade| SD[cite: 24]

    CB -->|buy_foreign_blade: req 5 Elders| START[cite: 23]
    CB -->|ask_caravan_scouts: Roll Stealth Success| WBC[cite: 23]
    CB -->|attend_guild_consortium| MCH
    CB -->|Roll Stealth Fail| SCP[cite: 23]

    MCH -->|formal_challenge_marshals: req 12 Elders, Roll Presence Success| NGS
    MCH -->|coerce_caravan_safety: req master-forged-blade, Roll Combat Success| E_ARMY
    MCH -->|Roll Presence/Combat Fail| MSS

    %% Citadel Intrigue Connections
    DPG -->|invoke_reputation: req 10 Elders| PAH[cite: 27]
    DPG -->|leverage_the_vanguard: Roll Presence Success| PAH[cite: 27]
    DPG -->|sneak_past: Roll Stealth Success| PG[cite: 27]
    DPG -->|Any Threshold Failure| PD[cite: 27]

    PG -->|eavesdrop_chambers| PWP
    PG -->|confront_magajiya| MC

    PWP -->|leverage_elders: +15 Elders| DPG
    PWP -->|confront_advisors: +10 Army, +10 Court| PAH

    MC -->|pledge_to_magajiya: +20 Elders| PAH
    MC -->|ask_for_political_talisman: Roll Presence Success| PAH
    MC -->|Roll Presence Fail| PD

    %% Prison Escape Mechanics Loop
    PD -->|bribe_guard: requires sacred-charm| DEP
    PD -->|channel_stones: Roll Stealth Success| DEP
    PD -->|Roll Stealth Fail| TIW

    TIW -->|sign_well_decree: +10 Court, -15 Elders| DPG
    TIW -->|incite_labor_riot: Roll Presence Success| DEP
    TIW -->|Roll Presence Fail| E_EXILE

    DEP -->|rally_blacksmiths: +15 Army| DPG
    DEP -->|seek_elders_sanctuary: +10 Elders| DPG

    %% Endgame Resolution
    PAH -->|accept_royal_boon: +20 Court| E_COURT
