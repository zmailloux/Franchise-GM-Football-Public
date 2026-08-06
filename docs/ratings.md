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

1. **Raw attributes** — a few dozen basic skill scores, each `0`–`99`: how fast he runs, how hard he hits, how accurately he throws.
2. **Role composites** — a small catalog of blended scores that each answer one football question: *how good is this player at rushing the passer? at getting open? at protecting the quarterback?*
3. **Overall (`OVR`)** — a single `0`–`99` number that blends only the composites that matter for that player's position.

The important thing to know up front: **the same role composites that produce the `OVR` you see also decide what happens on the field.** There is one shared set of numbers. When the sim asks "did the pass rush win this rep?" it reads the exact pass-rush score that fed into that defensive lineman's `OVR`. That is why a high rating actually shows up in games instead of being cosmetic — and why the ratings scale is calibrated against real football rather than against itself.

:::example What the gap between a great and a bad quarterback looks like
Line up a near-`99` passer and a `~60` passer and the completion rates land where they should: clearly elite versus clearly bad, with the league average sitting between them — and nobody completing `97%` of his throws. Those bands are what the game is tuned to hit every season, and they fall out of the same accuracy scores that set both quarterbacks' `OVR`.
:::

## Raw attributes — the building blocks

Raw attributes come in two flavors. **Universal** ones apply to everybody: raw athletic tools — `speed`, `acceleration`, `agility`, `strength`, `jumping` — plus the mental side — `awareness`, `vision`, and `decisions` — plus `toughness`, which is how fast he heals and how likely an injury is to nag rather than how often he gets hurt in the first place. Every position carries these.

**Position-specific** attributes only exist where they make sense. A quarterback carries short-, medium- and deep-throw `accuracy`, throwing on the run, and `pocket presence` — feeling the rush before it arrives, which is a different skill from escaping it once it does. A receiver carries `catching`, `route-running`, `catching in traffic` for the contested ball, and `release` for beating a jam at the line. A lineman carries `pass-blocking`, `run-blocking`, `impact blocking` — the block he makes in space, twelve yards downfield, that turns four yards into twenty — and `play recognition`. Every defender carries `block-shedding`, `tackling`, `hit power`, `pursuit` (angles and closing speed, as opposed to finishing) and `play recognition` (diagnosing the play at the snap); the ones who are asked to cover — edge rushers, linebackers and the secondary — add `press` (the jam, the mirror image of a receiver's release) plus man- and zone-`coverage`. Interior linemen and base ends carry no coverage score at all, because a nose tackle never covers anybody. A kicker carries `kick accuracy` **and `leg power`**; a punter adds `placement`. The model knows the difference between "not applicable" and "rated zero."

Two of those are worth calling out because they are the ones most games leave out. **Press and release are a matched pair** — the same moment at the line of scrimmage, scored from both sides, so a receiver who can beat a jam and a corner who can deliver one are actually contesting each other. And **leg power is separate from kick accuracy**, which is what lets an accurate kicker with an ordinary leg exist at all.

Raw attributes have realistic floors *and* realistic ceilings. Even the worst starter in the league isn't hopeless at the hard-to-fake skills — a real passer can throw, a real cornerback can cover — while linemen and specialists are allowed to post genuinely poor athletic numbers, because in football they do. In the other direction, a position can't post a number its job never produces: left tackles don't run 4.4s and safeties don't shed blocks like defensive tackles, so those numbers top out where the real ones do.

## Role composites — the middle layer

The composite catalog is the heart of the system: a handful of readable role scores, each a fixed weighted blend of raw attributes on the same `0`–`99` scale. Pass rush leans mostly on shedding blocks and explosiveness, with strength and agility behind them. Getting open leans on route running first, then burst and straight-line speed. Deep accuracy is almost entirely the deep-throw arm, with a little decision-making. Each blend is fixed, so the score is a predictable read on the raw numbers below it.

The full catalog, and the one football question each score answers:

| Composite | The question it answers |
|---|---|
| Short / medium / deep accuracy | Can he make each throw? |
| Pocket presence | Does he feel the rush before it arrives? |
| Escaping the rush | Once it does arrive, can he step up and get out? |
| Playmaking | Does he avoid the killer interception? |
| Scramble running | With the ball in his hands, is the quarterback a runner? |
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
| Pursuit | Does he get there, at the right angle? |
| Play recognition | Does he diagnose it at the snap? |
| Press · Release | Who wins the jam at the line? |
| Contested catch | Does he win the ball with a man on him? |
| Impact blocking | Does he make the block in space? |
| Kicking power · Kicking accuracy | How far, and how true? |
| Punt placement | Can he pin them inside the 20? |
| Returns | What does he do with a kick in his hands? |
| Takeaway return | Once the defense has it, can he run with it? |

Two wrinkles worth knowing. Not every score in the catalog feeds an `OVR`: a running back's **base run** has no counterpart in the rating model at all — it exists purely to decide what happens when he hits the hole — and a handful of others (the jam, the release, pursuit, play recognition, blocking in space, punt placement) are live on the field but deliberately kept out of the number. More on why, below. And when you line a player up somewhere he doesn't belong, the penalty lands on these composite scores rather than being bolted on afterwards — see [Playing Out of Position](#out-of-position).

:::screenshot A player card
image: player-card.jpg
:::

## The 15 positions and their groups

There are `15` positions, in nine groups. A position's rating leans only on the composites that matter for its job — the "flavor" column below.

| Group | Positions | What the rating leans on |
|---|---|---|
| Quarterback | QB | Accuracy by depth, playmaking, escaping the rush, ball security |
| Running back | RB | Power running, yards-after-catch, hands and routes, pass protection, ball security, returns |
| Pass catchers | WR, TE | Getting open, hands, yards-after-catch, ball security (WR adds returns; TE adds blocking and protection) |
| Offensive line | OT, OG, C | Pass protection, run blocking |
| Defensive line | DT, DE | Pass rush, run stopping, tackling |
| Edge rushers | EDGE | Pass rush, run stopping, tackling |
| Linebackers | LB | Run stopping, pass rush, tackling, man and zone coverage |
| Defensive backs | CB, S | Man coverage, zone coverage, ball skills, tackling (CB adds returns) |
| Specialists | K, P | Leg power and kicking accuracy |

:::note One pool per job on the defensive front
`DE` is the base, run-setting end. **`EDGE`** is the single pass-rush pool — whether he lines up with a hand down or standing up depends on the front you run, not on the body. **`LB`** is every off-ball linebacker. So an edge rusher is never stuck behind a scheme label, and a coverage backer is never asked to be a rusher on paper.
:::

:::warn A rush-or-drop edge is a scheme prize, not free rating
An `EDGE` genuinely can carry coverage skill — that is what makes the `Coverage` archetype real, and it is what a 3-4 Zone or Hybrid Zone shops for. It deliberately **does not count toward his `OVR`**. His headline number is a rusher's number, so a drop-capable edge looks ordinary on the roster list and pays off through [scheme fit](#schemes--the-defensive-fit-bonus) instead. If you run a zone front, that is a market inefficiency you can go shopping in.
:::

Kickers and punters used to be the thin spot in the model — one accuracy number doing the work of two, so a booming leg and a precise one were the same player. They now carry **leg power** alongside **kick accuracy**, and a punter carries **placement** on top of that. Both a kicker's and a punter's rating is his leg plus his accuracy. **Placement never counts toward the number** — it is a role skill, so the coffin-corner specialist has to be spotted rather than read off his `OVR`.

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
- **Injury-proneness** is a durability axis, not a skill — it's about availability, not talent, so it's kept separate. **Toughness** is its other half: how fast he heals and how likely an old injury is to nag. Neither one is in the rating.
- **A receiver's release** and **a defender's press** are the two sides of the jam at the line. Both are live every snap; neither is in either man's `OVR`.
- **Pursuit**, **play recognition**, **blocking in space** and a quarterback's **pocket presence** are all read on the field and all sit outside the rating.
:::

That last group is deliberate, and it is the single most useful thing on this page. The rule the game holds itself to is that a skill only raises a player's `OVR` — and therefore his price — if the rating model names it. So a genuinely great open-field blocker, a linebacker who diagnoses everything, or a corner who can actually deliver a jam is worth **more than his number says**, and costs what his number says. Those are the players you can steal.

The other takeaway: two players with the same `OVR` can play very differently. One might tire late, jump offside, or miss games — none of which the overall would ever tell you.

## Team overall

The same per-player ratings roll up into a team `OVR` (`0`–`100`), split into offense and defense. It fills each lineup slot your scheme fields with your best man there, and weights each slot by how much it swings games — quarterback carries far more than anything else, then the pass rush, then receiver and corner. Depth inside a group counts, but falls away fast: your `WR1` is worth roughly three times your `WR4`. Crucially it is **scheme-aware**: the same roster posts a different team number under a different scheme, because a scheme decides which skills it leans on. The full story — scheme fit, how the weighting works, and roster construction — lives in [Schemes & Scheme Fit](#schemes).
