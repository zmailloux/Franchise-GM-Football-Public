---
id: ratings
title: Player Stats & Ratings
nav: 2
section: Players
status: live
icon: 📊
tagline: >
  How raw attributes stack into role scores and a single position-aware overall — the same numbers the sim plays out on the field
related:
  - archetypes
  - development
  - out-of-position
sources:
  - docs/overview/stats-that-matter.md
  - DESIGN.md#Q
  - DESIGN.md#X
  - sim/lib/src/sim/composites.dart
  - sim/lib/src/ovr/ovr.dart
  - sim/lib/src/models/positions.dart
  - sim/balance/targets.yaml
  - sim/lib/src/balance/talent_targets.dart
---

## The rating model in three layers

Every player's `OVR` is built from the bottom up, in three layers:

1. **Raw attributes** — a couple of dozen basic skill scores, each `0`–`99`: how fast he runs, how hard he hits, how accurately he throws.
2. **Role composites** — a small catalog of blended scores that each answer one football question: *how good is this player at rushing the passer? at getting open? at protecting the quarterback?*
3. **Overall (`OVR`)** — a single `0`–`99` number that blends only the composites that matter for that player's position.

The important thing to know up front: **the same role composites that produce the `OVR` you see also decide what happens on the field.** There is one shared set of numbers. When the sim asks "did the pass rush win this rep?" it reads the exact pass-rush score that fed into that defensive lineman's `OVR`. That is why a high rating actually shows up in games instead of being cosmetic — and why the ratings scale is calibrated against real football rather than against itself.

:::example What the gap between a great and a bad quarterback looks like
Line up a near-`99` passer and a `~60` passer and the completion rates land where they should: clearly elite versus clearly bad, with the league average sitting between them — and nobody completing `97%` of his throws. Those bands are what the game is tuned to hit every season, and they fall out of the same accuracy scores that set both quarterbacks' `OVR`.
:::

## Raw attributes — the building blocks

Raw attributes come in two flavors. **Universal** ones apply to everybody: raw athletic tools — `speed`, `agility`, `burst`, `strength`, `jumping` — plus the mental side — `intelligence`, `vision`, and `decisions`. Every position carries these.

**Position-specific** attributes only exist where they make sense. A quarterback carries short-, medium- and deep-throw `accuracy` and throwing on the run; a receiver carries `catching` and `route-running`; a lineman carries `pass-blocking` and `run-blocking`; a defender carries `block-shedding`, `tackling`, `ball-strip`, and man- and zone-`coverage`; a kicker or punter carries `kick-accuracy`. A quarterback simply has no coverage score to speak of, and the model knows the difference between "not applicable" and "rated zero."

Raw attributes also have realistic floors. Even the worst starter in the league isn't hopeless at the hard-to-fake skills — a real passer can throw, a real cornerback can cover — while linemen and specialists are allowed to post genuinely poor athletic numbers, because in football they do.

## Role composites — the middle layer

The composite catalog is the heart of the system: a handful of readable role scores, each a fixed weighted blend of raw attributes on the same `0`–`99` scale. Pass rush leans mostly on shedding blocks and explosiveness, with strength and agility behind them. Getting open leans on route running first, then burst and straight-line speed. Deep accuracy is almost entirely the deep-throw arm, with a little decision-making. Each blend is fixed, so the score is a predictable read on the raw numbers below it.

The full catalog, and the one football question each score answers:

| Composite | The question it answers |
|---|---|
| Short / medium / deep accuracy | Can he make each throw? |
| Pocket presence | Does he survive pressure? |
| Playmaking | Does he avoid the killer interception? |
| Getting open | Can he separate from coverage? |
| Hands | Does he catch what hits them? |
| Yards after catch | What happens after the grab? |
| Base run | What does he do when he hits the hole? |
| Ball security | Does he fumble? |
| Pass protection | Does he keep the pocket clean? |
| Run blocking | Does he move bodies? |
| Pass rush | Can he get home? |
| Run stopping | Does he shed and fill? |
| Man coverage · Zone coverage | Can he cover, each way? |
| Ball skills | Does he take the ball away? |
| Tackling | Does he finish the play? |

Two wrinkles worth knowing. A running back's **base run** score is the one composite that doesn't feed anybody's `OVR` — it exists purely to decide what happens when he hits the hole, so a back's rating and his actual carry-by-carry running are not quite the same measurement. And when you line a player up somewhere he doesn't belong, the penalty lands on these composite scores rather than being bolted on afterwards — see [Playing Out of Position](#out-of-position).

:::screenshot A player card
One player's card: raw attributes on the left, his role composites and `OVR` rolled up on the right.
:::

## The 15 positions and their groups

There are `15` positions, in nine groups. A position's rating leans only on the composites that matter for its job — the "flavor" column below.

| Group | Positions | What the rating leans on |
|---|---|---|
| Quarterback | QB | Accuracy by depth, pocket presence, playmaking |
| Running back | RB | Base running, ball security, yards-after-catch, some blocking/receiving |
| Pass catchers | WR, TE | Getting open, hands, yards-after-catch (TE adds blocking) |
| Offensive line | OT, OG, C | Pass protection, run blocking |
| Interior line | DT, DE | Pass rush, run stopping, tackling |
| Edge rushers | EDGE | Pass rush, run stopping, tackling — plus coverage on a rush-or-drop body |
| Linebackers | LB | Run stopping, tackling, coverage, ball skills |
| Defensive backs | CB, S | Man coverage, zone coverage, ball skills, tackling |
| Specialists | K, P | Kicking accuracy |

:::note One pool per job on the defensive front
`DE` is the base, run-setting end. **`EDGE`** is the single pass-rush pool — whether he lines up with a hand down or standing up depends on the front you run, not on the body. **`LB`** is every off-ball linebacker. So an edge rusher is never stuck behind a scheme label, and a coverage backer is never asked to be a rusher on paper.
:::

Kickers and punters are the thin spot in the model: they carry a **kicking-accuracy** skill and nothing else of their own, so there is no separate leg-strength number to tell a booming leg from a precise one. That is why every kicker is just a `Kicker` and every punter a `Punter` on the [Archetypes](#archetypes) page.

## Overall rating (OVR)

`OVR` is a weighted blend of a position's own composites, plus a per-position baseline, rounded and capped `0`–`99`. Because each composite is itself a fixed blend of raw attributes, the rating stays a straight, predictable read on the raw scores — nudge a number up and you can see where it went.

A position draws only on **its own** composites, plus two universal ones: all-around athleticism and football acumen. Everything unrelated counts for exactly zero. A quarterback's `OVR` never sees coverage or tackling; a cornerback's never sees throwing accuracy.

That masking is deliberate. It buys football-sane attribution — a quarterback's number moves when his accuracy moves, never because of some phantom blocking score. And because the recipe is fixed, the game computes `OVR` the same way for imported veterans, players you edit, and generated rookies, so everybody sits on one scale.

### What the 0–99 scale feels like

Higher is better, and the curve is steep at the top. An `~80`-overall player is a run-of-the-mill starter — solid, unremarkable. The elite tier begins around `90`. `99` is the ceiling.

| Rating | What that is |
|---|---|
| `90`+ | Elite — roughly three per team, league-wide |
| `85`+ | Stars and top starters |
| `80`+ | Genuine starter quality |
| `75`+ | Fringe starters and good depth |
| `70`+ | Playable — most of an active 53-man roster |

The league is deliberately held to a fixed talent pyramid, so those labels mean the same thing in season 1 and season 40. The game actively defends it: if a decade of development would have flooded the league with `90`s, growth gets trimmed until the shape holds. What that means for you is that a `92` is always genuinely rare, and hoarding one is always worth something. What a rating *costs* is a separate story — see [Contracts](#contracts).

How your own players' ratings change over time is covered in [Player Growth & Aging](#development), and the archetype labels that flavor a player's build live in [Archetypes](#archetypes). What a player actually *did* — as opposed to what he can do — is the box score, and every column in it is spelled out in the [Stat Glossary](#stat-glossary).

## What OVR leaves out — the hidden edges

`OVR` is a deliberately narrow "how good is he at his job" number. Several things a player brings never enter it, yet still shape games and careers.

:::note Hidden edges
Some traits stay out of the number on purpose:
- **Stamina** doesn't raise `OVR`, but it governs how a player wears down within a game — fresh legs in the fourth quarter are a real edge.
- **Discipline** never touches `OVR`, but it drives how often a player draws penalties.
- **Injury-proneness** is a durability axis, not a skill — it's about availability, not talent, so it's kept separate.
- A blocker's first-step release is tracked too, but stays clear of the rating — it's matchup color, not job quality.
:::

The takeaway: two players with the same `OVR` can play very differently. One might tire late, jump offside, or miss games — none of which the overall would ever tell you.

## Team overall

The same per-player ratings roll up into a team `OVR` (`0`–`100`), split into offense and defense. It takes the best rating at each lineup slot and weights each slot by how much it swings games — quarterback and the front seven carry the most. Crucially it is **scheme-aware**: the same roster posts a different team number under a different scheme, because a scheme decides which skills it leans on. The full story — scheme fit, how the weighting works, and roster construction — lives in [Schemes & Scheme Fit](#schemes).
