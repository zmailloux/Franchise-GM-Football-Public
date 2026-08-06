---
id: draft
title: The Draft
nav: 11
section: Building the roster
status: live
icon: 🎓
tagline: >
  Where next year's roster comes from — how classes are built, how draft day plays out, and why potential is never a promise
related:
  - scouting
  - contracts
sources:
  - DESIGN.md#O
  - docs/draft-position-distribution.md
  - docs/college-distribution.md
  - sim/lib/src/draft/draft_class_tuning.dart
  - sim/lib/src/league/draft_trade.dart
---

## How the draft is built

The draft is the cheapest way to add real talent to your roster, and once your league has been running a few seasons it is the *only* source of genuinely young players. The first few classes ship with the game's seed data; after those run out — and to top up any year that comes up thin — every rookie pool is generated from scratch, season after season, forever. The game keeps the next few classes minted ahead of you at all times, which is what the scouting board reads.

The structure mirrors the real thing: **seven rounds**, **224 picks**, running worst-team-first within each round, so the clubs that struggled last season choose ahead of the clubs that thrived. You hold one pick per round to start, but that inventory is fluid — you can trade picks away for players, pick up extra picks the same way, and swap picks on draft day itself (more below).

The prospect pool is deeper than the pick count: a hundred or so prospects go undrafted every year and wash into the undrafted free-agent pile, where the occasional gem still hides. That gap is deliberate — it keeps the late rounds and the undrafted pile worth scouting instead of a formality.

## What a class looks like

Every prospect is manufactured to feel like a real draft entrant. Each one gets a position, a hidden true ceiling, a current (raw, rookie-level) ability well below that ceiling, an age between **21 and 23**, an archetype, a college, a full set of skill grades, a **simulated college stat line** with an injury history, and combine measurables. None of it is placeholder — the college season is real generated history you can read, and the combine numbers correlate with the player's physical ratings, so a blazing forty actually means something.

The position mix is fitted against two decades of real NFL drafts. The draft is defense-heavy, the trenches eat about a third of all picks combined, and quarterback is the scarcest non-specialist spot on the board — which is exactly why a franchise passer is so hard to come by.

| Position group | Real NFL, avg drafted/yr | Share of the board |
|---|---:|---:|
| Defensive backs | 50.3 | 20.1% |
| Defensive line | 45.1 | 18.1% |
| Offensive line | 42.9 | 17.2% |
| Wide receiver | 32.5 | 13.0% |
| Linebacker | 30.3 | 12.1% |
| Running back | 22.2 | 8.9% |
| Tight end | 15.0 | 6.0% |
| Quarterback | 11.7 | 4.7% |

Those are baselines, and each year wobbles around them. The shares hold across a whole class rather than within a single round — early rounds skew toward premium positions, later rounds fill out depth, the same way real drafts do.

The **talent spread** inside a class is a bell curve with a fat, unreliable top. Most ceilings land in solid-starter territory; a true blue chip is a once-a-class event. And blue chips arrive **raw but high-ceiling** — a player who will one day be elite almost never *starts* elite. A prospect who looks finished on draft day gets his rating pulled back and the trimmed points handed to him as room to grow instead. No drafted prospect is a pure camp body, either: a rookie can be raw, but he can play.

How raw he is, and how much runway he has, comes from his development type:

| Prospect type | How common | Room to grow | How long it takes |
|---|---|---|---|
| Polished | The plurality of a class | Almost none — he is what he is | A few seasons |
| Normal | About a third | Modest | A few seasons |
| Project | Uncommon | Large | Most of a rookie contract and then some |
| Boom-or-bust | Rare | Enormous, and unreliable | Longest of all |

A boom-or-bust prospect often starts low enough to go undrafted entirely and then grows into the classic undrafted-gem starter. The middle rounds hide treasure on purpose too: a real share of eventual stars enters the pool priced like a day-two or day-three pick, waiting for the scouting department that spots them. What happens to any of them after you pick is covered under [Player Growth & Aging](#development).

## Loaded years and down years

Class strength is not fixed. Every season's pool is rolled with two independent levers: how good the class is on average, and how many true blue-chips sit at the very top. A year can be a "loaded class" or a "down year," and those two things move separately — you can get a deep, solid class with no superstar, or a thin class carried by one or two headliners.

On top of the global shift, **each position group has its own year-to-year swing**. One draft is deep at receiver and thin at tackle; the next is a run on edge rushers with no franchise quarterback in sight. This is what makes trading up or reaching feel situational: in a loaded quarterback year you can wait, in a barren one you pay a premium.

:::note Booms are borrowed, not minted
Great classes and weak classes even out over the long haul. Each year's roll is partly detrended against its neighbors, so a boom is *borrowed* from the years around it rather than created from nothing. Over a decades-long franchise the incoming talent stays realistic — the league never inflates or collapses because a few loaded drafts stacked up. You feel the year-to-year texture without the league slowly breaking.
:::

## Mock drafts during the season

:::screenshot A mock first round, mid-season
image: mock-draft.jpg
:::

You don't have to wait for April to see where the board is heading. Three times a year the **League Office publishes a mock draft** of next season's class — after week 7, after week 14, and once the season ends. Each is a frozen three-round, 96-pick projection: the slot order from the standings as they stand, the picks routed through whatever trades have already moved them, and every club taking the player its needs and the public read point it at.

Each edition arrives as a **message on your phone** and opens straight onto the board; they also live under LEAGUE ▸ DRAFT as `MOCK #1`, `#2` and `#3`, and any row drills into that prospect's page. The earliest mock is the loosest guess and each one tightens, so the value is in the drift: a name climbing across all three is a name you'll be bidding against, and the third one is close to the real thing without ever being a script.

## Draft day

:::screenshot On the clock
Your pick: the AVAILABLE board with scout stars, the recommended prospect, and the live TRADE tab.
:::

When the draft runs, you watch the board tick down as every other team makes its selections. The AI clubs pick for real — weighing their own roster needs against their own scouting reads — so weak-scouting teams genuinely misjudge players, reach, and let steals slide. When your slot comes up, the clock stops and hands you the board: an **AVAILABLE** list of everyone still on it, a **PICKED** log of who has gone where, an **UPCOMING** view of the pick order and team needs, and a live **TRADE** tab.

The PICKED log is worth reading as you go. Every completed pick carries the drafting team's own **scout stars** (how much *they* liked him) next to a separate **media grade** on the pick itself. The grade starts from a solid **B** — most picks are fine picks — then moves for **value versus slot** (a steal late grades high, a reach early grades low) and for **need** (filling a glaring hole earns credit), with a little pundit noise on top. So a club can love a player and still get panned for where it took him, and two outlets' worth of jitter means the same pick isn't always graded identically.

On the clock you can trade instead of pick. Rivals float **trade-back offers** — you send your slot, they send a package of later or future picks and pick immediately. You'll see plenty of interest in the early rounds and it tapers off as the draft wears on, until nobody bothers in the seventh.

Packages are small and priced at near-equal capital, tilted slightly toward the team moving down. In the first three rounds at least one offer on the table will also include a **real veteran** at one of your listed needs, so moving down can be a way to fill a hole today rather than only stockpiling picks. You can **shop the pick** to pull a fresh set of offers, and you can **counter** any offer: demand extra picks, drop ones you don't want, or throw in a pick of your own, then watch the rival re-run its verdict live. The value math behind all of it is the same currency used everywhere else — see [Trades](#trades) for how pick value is calculated.

You are never forced to draft blind on need alone: the board also highlights a single **recommended** prospect while you're on the clock, blending your team's need with your scouts' read on the player. It's advice, not an order — and because it reads through *your* scouts, a weak scouting department gives you weaker advice.

## Rookie contracts

Drafted players sign slotted rookie deals automatically — you don't negotiate them the way you do free agents. The scale follows the real NFL's: **where a player is picked sets what he costs**, and steeply. A top-five pick is a real cap commitment, not just a lottery ticket, while a late first-rounder costs a fraction of that and a day-three pick is close to free. Money is spread evenly over four years, and guarantees fall away by round — a first-rounder's deal is fully guaranteed, day-two picks about half, day-three barely at all.

For his first four seasons a rookie is also exempt from asking you to reopen his deal, no matter how far he outplays it, and first-round picks carry a **fifth-year option** you can exercise before that clock runs out. Cheap, cost-controlled, and the whole reason the draft is such good roster value. The full mechanics — length, guarantees, the option price, and what happens when the deal runs out — live on the [Contracts](#contracts) page.

## The hit-or-miss reality

Here is the honest part: **potential is a guess, not a guarantee.** The ceiling the game tracks internally is never shown to you before the pick — not as a number, not anywhere. What you see instead are your scouts' fogged reads, expressed as stars, and those reads can be wrong in both directions. A genuinely great prospect can slip because nobody spotted him; an over-hyped one can go early to the whole league and then never grow into the player everyone expected. Busts and steals are baked into the class itself, not bad luck laid on top.

That uncertainty is the point of the pre-draft grind, and it belongs to a different room of the guide: how scouting quality sharpens (or blurs) your reads, how the two star ratings differ, and how interviews expose a prospect's character all live on the [Scouting](#scouting) page. Where a rookie slots once he's yours is [Morale, Health & Your Roster](#roster-management).

Draft well and you're not buying a finished player. You're buying a bet.
