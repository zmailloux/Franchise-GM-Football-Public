---
id: schemes
title: Schemes & Scheme Fit
nav: 4
section: Players
status: live
icon: 🧠
tagline: >
  How your coordinators' schemes reshape your roster's value, your lineup, and how your team plays on Sundays
related:
  - archetypes
  - roster-management
sources:
  - docs/schemes-status.md
  - docs/team-ovr-scheme-and-roster-fit.md
  - DESIGN.md#C
  - sim/balance/schemes.yaml
  - sim/lib/src/sim/personnel.dart
---

## What a scheme is {live}

Every team runs a **scheme** — an offensive style and a defensive style, plus a few dials for how it plays. It's not cosmetic: it decides which positions your team leans on, which players get the ball, how your `OVR` is calculated, and how your games unfold. You'll find it under **Office ▸ Coaches ▸ Scheme**.

Your **offensive coordinator owns the offensive scheme, your defensive coordinator owns the defensive scheme** — the team runs each coordinator's system for the length of his contract, and your head coach's own style is a perk when it happens to match. There's no scheme picker in normal play: you change what your team runs by changing [coordinators](#staff), and the roster refits only gradually over the following years.

There are six offensive schemes and six defensive schemes, broken down below.

:::screenshot The scheme screen
Office ▸ Coaches ▸ Scheme — your offensive and defensive identity, the coordinators who own each, and the team dials.
:::

:::note Scheme vs. weekly gameplan
Your scheme is the season-long identity. The **weekly gameplan** you set before each game — run lean, passing aggression, tempo, blitz, coverage shell — nudges one game around that baseline without changing it. This page is about the scheme.
:::

## The six offensive schemes {live}

Each offensive style leans a certain way on run versus pass and rewards specific player archetypes (the catalog lives on the [Archetypes](#archetypes) page). Across a league the run-pass spread lands inside a real-NFL band — no scheme is a gimmick.

| Scheme | Roster it asks for | Lean | Rewards | Poor fit |
|---|---|---|---|---|
| **Ground & Pound** | 2 TE · 2 WR · 1 RB | Run-heaviest | `Game Manager` · `Power Back` · `Workhorse` · `Blocker` · `H-Back` · `Mauler` | `Deep Threat` · `Receiving Back` |
| **Read Option** | 2 RB · 2 WR · 1 TE | Run-heavy | `Dual-Threat` · `Power Back` · `Workhorse` · `H-Back` · `Mauler` · `Zone Blocker` | `Gunslinger` |
| **Pro Set** | 3 WR · 1 TE · 1 RB | Balanced, run-tilted | `Pocket Passer` · `Game Manager` · `Workhorse` · `Two-Way` | — |
| **Quick Game** | 3 WR · 1 TE · 1 RB | Balanced, pass-tilted | `Pocket Passer` · `Improviser` · `Slot` · `Possession` · `Route Runner` · `Receiving Back` · `Two-Way` · `Zone Blocker` | `Deep Threat` |
| **Run & Shoot** | 5 WR · 1 TE · 1 RB | Pass-heavy | `Dual-Threat` · `Gunslinger` · `Deep Threat` · `Slot` · `Receiving Back` · `Elusive Back` · `Seam Threat` | `Blocker` · `Mauler` |
| **Vertical** | 4 WR · 1 TE · 1 RB | Pass-heaviest | `Gunslinger` · `Pocket Passer` · `Deep Threat` · `Slot` · `Route Runner` · `Seam Threat` · `Pass Protector` | `Power Back` · `Blocker` |

Every scheme also wants a quarterback and five linemen; the table lists the skill positions where schemes actually differ.

That roster column is a **demand list, not a lineup**, which is why the counts run past eleven — and every scheme still wants a tight end, even the four- and five-wide looks. Beyond the run-pass split, pass-tilted schemes throw **deeper with more explosive-play variance**, while Ground & Pound leans on short play-action and inside runs. Archetype then overrides the scheme for individual usage: a `Receiving Back` draws targets even in a run-first scheme, and a `Blocker` tight end runs fewer routes even in a passing one.

## The six defensive schemes {live}

Your defensive style is a **front** (4-3, 3-4 or Hybrid) crossed with a **coverage character** (Man or Zone) — six schemes, each with its own identity and its own shopping list of [archetypes](#archetypes):

| Scheme | Its identity | Wants most | Poor fit |
|---|---|---|---|
| **4-3 Man** | Four-man line, corners travel and press | `Press Man` CB · `Speed Rusher` EDGE · `3-Tech` DT · `Box` S · `Thumper` + `Coverage` LB | `Zone` CB |
| **4-3 Zone** | Four-man line, everyone reads the quarterback | `Zone` CB · `Free Safety` · `Coverage` LB · `Nose Tackle` DT | `Press Man` CB |
| **3-4 Man** | Three-man line, two stand-up rushers, press behind it | `Speed Rusher` + `Power Rusher` EDGE · `Press Man` CB · `Run Anchor` DE · `Nose Tackle` DT · `Thumper` LB | `Zone` CB |
| **3-4 Zone** | Three-man line, rushers who can drop, disguise everywhere | `Coverage` EDGE · `Coverage` LB · `Zone` CB · `Run Anchor` DE · `Nose Tackle` DT | `Press Man` CB |
| **Hybrid Man** | Alternates both fronts, matchup-hunting man coverage | `Press Man` + `Slot` CB · `Hybrid` + `Box` S · `Power Rusher` + `Speed Rusher` EDGE · `Thumper` LB | — |
| **Hybrid Zone** | Alternates both fronts, zone disguise | `Zone` + `Slot` CB · `Hybrid` + `Free Safety` S · `Coverage` LB · `Coverage` EDGE | `Press Man` CB |

The front decides the shape of your front seven and where the bodies come from:

| Front | Base box | Nickel (default, most snaps) | Rush comes from |
|---|---|---|---|
| **4-3** | DE1 · DT2 · EDGE1 · LB3 · CB2 · S2 | DT2 · **EDGE2** · LB2 · **CB3** · S2 — the base end and a linebacker come off for a second rusher and the slot corner | 4-man line, both `EDGE`s lead |
| **3-4** | DE2 · DT1 · EDGE2 · LB2 · CB2 · S2 | DE2 · EDGE2 · LB2 · CB3 · S1 — a safety comes off for the slot corner | 3-man line, the two `EDGE`s lead |
| **Hybrid** | alternates the 4-3 and 3-4 boxes | whichever box is on the field; nickel default either way | whichever box is on the field |

Every scheme also has a **dime** package (six defensive backs, one linebacker) for obvious passing downs, and a **goal-line** package for short yardage — filled from whichever cornerbacks and safeties fit best, not a fixed split.

The front decides *who* your sacks come from — both fronts lean on the same `EDGE` pool, since a hand-down 4-3 end and a stand-up 3-4 rusher are the same body in a different stance. So the real difference between fronts is felt in the interior and off-ball linebacker counts, not in who rushes.

Coverage sets your interception profile. **Man** trails the receiver and plays tighter underneath, giving up fewer picks. **Zone** reads the quarterback and jumps throws, producing more of them — and inside Zone your defensive coordinator plays a specific shell (Cover 2, Tampa 2, Cover 3, Quarters), each rewarding a different rare body: a rangy cover linebacker for Tampa 2, a pair of do-everything safeties for Quarters. You can see — and set — a coordinator's shell in his staff profile. Coverage is only as strong as your defensive backs' and linebackers' fit for it: man wants man-coverage corners, zone wants zone specialists and a field-reading linebacker.

:::note One pool per job
**`DE`** is only the base, run-setting end — he plays every down in a 3-4 but comes off for a second rusher in a 4-3's nickel package. **`EDGE`** is the single pass-rush pool across both fronts, and **`LB`** covers every off-ball linebacker job. See [Player Stats & Ratings](#ratings) and [Archetypes](#archetypes).
:::

## The defensive fit bonus {live}

Building the roster your defensive scheme asks for pays a real, bounded on-field reward. Each week the game checks how well your fielded eleven fill the scheme's **role slots** — a 4-3 Man's rush `EDGE`, a Zone shell's rangy `Free Safety`, and so on — and pays a bonus into your defensive unit grades, concentrated on the units that scheme's identity leans on.

It's a **carrot, never a stick**: an unfilled slot just forgoes its share. Nobody is ever penalized, and a mismatched roster plays exactly as its talent deserves. The size is deliberate too — a fully built roster is worth about as much as a good weekly gameplan edge, and far less than raw talent. Commitment is felt; it never beats ability.

## What actually lines up each snap {live}

Your scheme is the look you play **most**, not the only one: personnel changes snap to snap on both sides, and it changes what your team is good at on that snap.

On offense you field a **grouping**, named the football way — backs first, then tight ends, receivers making up the rest of the five skill players. Ground & Pound lives in two-tight-end `12` personnel, Read Option keeps two backs on the field, the Pro Set and Quick Game families are `11`-personnel offenses, and the spread family goes four-wide often. Situation tilts the draw hard, but never overrides identity.

That has teeth. An extra tight end or a lead back is another blocker and **helps your run game**; going empty with no tight end **costs** you there. Heavy personnel also dilutes your passing, since the receiving grade averages whoever is actually on the field. Nobody gets a free bonus — the effect is measured against the league-average mix, so heavy blocks better than light without making every offense better.

The defense answers you: three receivers pull a **nickel** defensive back on, four pull a **dime**, heavy personnel in short yardage brings out the **goal-line** group, and third-and-long bumps the package up a step by itself.

:::note Which defender comes off
The fronts answer a nickel differently. A **4-3** makes **two** swaps — the base-package `DE` comes off for a second `EDGE` rusher, and a linebacker comes off for the slot corner. A **3-4** is already a seven-man front, so it keeps its whole front seven and pulls a **safety** instead. That's why a 3-4 keeps two linebackers on the field on the great majority of its snaps while a 4-3 almost never does, and a Hybrid sits between them. Only on a genuine passing down (dime) does a 3-4 finally take a linebacker off too.
:::

Because a scheme plays several looks, the bodies it needs to **carry** are the union across all of them, not the eleven in its base box — call it twelve to thirteen defenders to cover eleven slots. That flows straight into what the game tells you your roster is missing, what the AI bids on, and how your [draft](#draft) board is ranked.

## Scheme fit — how well your roster matches {live}

**Scheme fit** is a per-player multiplier for how well a player's archetype suits the scheme he plays in. His [rating](#ratings) comes from his attributes; fit sits on top. A preferred archetype gets a real bump, a poor-fit archetype a real cut, and a coach whose own style matches the system adds a little more on top — more if he's a gifted play designer, less if he isn't. Only the coaches who own that side of the ball count: your offensive coordinator's opinion about defense is never read.

On offense, **fit tilts who gets the ball, not who starts or how good your team is.** Your depth chart is still ordered by pure `OVR`, so fit decides *which* receiver is the alpha — a `Deep Threat` in a Vertical scheme soaks up looks; the same player in Ground & Pound gets fewer. That's deliberate: fit shapes the box score and your *style*, staying near-neutral on raw team strength, so a good roster is good in any scheme. On defense the same usage tilt applies — plus the bounded [fit bonus](#schemes--the-defensive-fit-bonus) above.

If you disagree with an automatic call, you can **pin a player to a lineup slot** from the depth screen. A pin is honored even when it's a poor fit — the game hands the slot to your guy, takes it out of the automatic assignment, and lets the rest of the lineup sort itself around him.

**Team `OVR` is scheme-aware**, though. It weights each position by the slots your scheme fields, top starter mattering most and depth falling off fast, so the same roster reads a **different number under a different scheme** — a Vertical team's four wideouts make receiver depth worth far more than a two-wide scheme would, and quarterback carries the heaviest weight of any position. A great staff that fits the scheme is worth real wins over a terrible one — see [Coaches, Scouts & the Organization](#staff).

The team-level dials, all owned by the head coach:

| Dial | Values | What it changes |
|---|---|---|
| **RB approach** | Lead Back · Committee · Bellcow | How concentrated the carries are — a Bellcow takes most of them, a Committee splits them widely |
| **Playcalling** | Cautious · Balanced · Aggressive | Fourth-down aggression is a genuine probability model, plus two-point tries and shot-play priors |
| **Blitz frequency** | Low · Medium · High | Base pressure rate, traded against completions allowed when coverage is exposed |

## Playing the fit game as GM {live}

Two levers, pulling against each other. **Hire a coach whose scheme already fits your roster** — the fastest path; a receiver-heavy roster wants a Vertical or Run & Shoot coach, a mauling line and a power back want Ground & Pound. The **"Coaches Aligned"** check tells you whether your head coach, coordinator and system agree. Or **re-tool the roster to fit the coach**, which is slower and pricier since his scheme is locked for his contract — you rebuild around it through the [draft](#draft), [free agency](#free-agency) and [trades](#trades), and it takes a few seasons.

:::screenshot Roster fit at a glance
The roster screen's scheme-fit column: who your system loves, who it wastes.
:::

Either way, players have to *learn* the system. A man who has never seen your playbook gives up part of his fit edge and claws it back week by week; training camp gives everyone a one-time floor, and smart players under a good play-designer learn faster. Familiarity carries **partial credit for a similar system** — Ground & Pound and Read Option are cousins, as are Pro Set and Quick Game, and Run & Shoot and Vertical. On defense you're credited separately for knowing the coverage and the front. A familiarity chip in free agency shows how much of a head start a target would have; the AI prices it in too.

So a scheme change costs you a season of comfort on top of the roster refit — and costs less if the new system is a cousin of the old one.

:::warn One realism booster is still switched off
Individual receiver-versus-cornerback matchups — a shutdown corner erasing your No. 1 receiver — are **still averaged across the coverage unit** {built-off} rather than resolved one-on-one. It's built and awaiting a balance pass. And there's no *extra* penalty for running a five-wide scheme without five good receivers: thin groups hurt you through the personnel you actually field, but nothing punishes the mismatch on top of that.
:::
