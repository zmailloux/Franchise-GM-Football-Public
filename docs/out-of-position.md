---
id: out-of-position
title: Playing Out of Position
nav: 6
section: Players
status: live
icon: 🔀
tagline: >
  Fielding a player off his natural spot — how far is too far, what it costs him, and when it's worth it
related:
  - ratings
  - roster-management
sources:
  - docs/out-of-position-rework.md
  - docs/mechanics/ratings/position-flex.md
  - sim/lib/src/ovr/flex_tuning.dart
---

## What "out of position" means

You can take one of **your own** players and line him up somewhere that isn't his listed position — a guard at tackle, a running back at receiver, a safety at linebacker. You never control players on the field; this just fields him at a different spot in your depth chart.

The important thing to understand up front: **it's meant to be a patch, not a free upgrade.** A player is worse at a borrowed position than a natural is, and both his shown rating *and* his actual on-field results reflect that. There's no way to "convert" a player permanently or dodge the cost.

This is a **user-only tool.** The AI-run teams never flex their players; they always field naturals or sign for the hole. So everything on this page only ever affects *your* roster.

## Near moves vs far moves

Positions sit on a kinship map. Some are close cousins — a corner and a safety do overlapping jobs, so a corner slid to safety barely notices. Others are distant: a defensive tackle asked to play defensive end is doing a genuinely different job, and it shows. The game only lets you move a player along a legal edge on that map, so you can't drop a kicker in at receiver — there's no path between them.

Every legal move carries two things baked in:

- A **base penalty** — the typical rating hit for an average player making that move. Small for cousin positions, large for distant ones.
- A **minimum drop** — a floor. However versatile the player, he ends up at least this far below his natural rating (one exception, below). This is the crutch that stops a great player from being just as good everywhere.

So a shuffle along the offensive line costs a few points; turning a tackle into a defensive end costs a lot.

## What it costs

When you field a player off-position, the game re-scores his existing physical and skill attributes as if he played the new spot — using only the attributes that matter *there* — and then subtracts the familiarity penalty. That penalized number is what you see on his card **and** what the sim uses on the field. They never disagree, so his box score always matches his card.

The penalty itself is softened by how versatile he is, and slashed if he happens to have a knack for that exact spot. But the result can never beat his natural rating minus the move's minimum drop.

In practice: a very good running back moved to receiver plays like a middling receiver, not a second star. That's the whole point.

## Versatility and the hidden knack

Two things soften the blow, and they're worth knowing before you plan a move.

**Versatility** is a visible rating on every player, and **most players have almost none of it** — a genuine utility man is rare, and nobody is *generated* as a true do-anything piece. A highly versatile player pays meaningfully less of the base penalty, but versatility can never erase the move entirely: the minimum drop still applies. It also **grows only by actually playing out of position**, a little each game, and never fades — and that grind is the only way a player climbs past what generation allows. Rotate a lineman around the front for a season or two and he slowly becomes a real utility piece.

**The hidden knack** is rarer and stronger. A small share of players are secretly excellent at one *specific* nearby position — the athlete who was miscast coming out of college. It isn't spread evenly: defensive backs are the likeliest to carry one, since corners and safeties really do swap, and linemen on both sides the least likely. A player with a knack for the exact spot you're moving him to pays only a fraction of the penalty *and* skips the minimum-drop floor. He usually lands a few points below his natural rating — and once in a great while at or **above** it. You won't see this listed on a normal card; you discover it by trying the move and watching the number come out far better than expected.

:::tip Read the picker
When you pick a new spot for a player, the game shows you the **penalized** rating he'd actually play at — not his natural one. Trust that number. If it comes out surprisingly high, you may have stumbled onto a hidden knack.
:::

:::screenshot The position picker
Moving a player: each legal spot with the penalized rating he'd actually play at there.
:::

## Which moves are legal, and how far they reach

| Move | Distance | Notes |
|---|---|---|
| Corner ↔ Safety | Near | The most fluid pair in the game |
| Guard ↔ Tackle, Guard ↔ Center | Near | Sliding one spot on the line |
| Kicker ↔ Punter | Near | |
| End ↔ Edge rusher | Near | Stance neighbors — they share a spot on the line |
| Tackle ↔ Center | Medium | Skipping a spot on the line |
| Linebacker ↔ Safety | Medium | The big-nickel move, both directions |
| Tight end → Tackle or Guard | Medium | One-way, and a real hit |
| Edge rusher ↔ Linebacker | Medium | Standing a rusher up off the ball, or sending a backer |
| Running back ↔ Receiver | Medium | A very good back becomes a middling receiver |
| Receiver ↔ Tight end | Medium | A notable hit either direction |
| Defensive tackle ↔ End | Far | A genuinely different job |
| Skill player → Quarterback | Far | Emergency only; see below |

Some moves are deliberately **not** legal: a running back and a tight end can't cover for each other directly — that flexing runs through receiver instead — and tight end to the offensive line is one-way. The front-seven moves follow the position map: a defensive end is a step from the edge-rusher pool, an edge rusher a step from the off-ball linebackers, and a linebacker a step from the safeties. There's no legal straight line from a hand-in-the-dirt end to an off-ball backer.

**Turning a skill player into a quarterback** is a special, one-way case. A back, receiver or tight end can line up at quarterback, but he throws from a set of hidden, deliberately low passing attributes generated when he was created — real numbers run through the real quarterback model, not a fudge. He always lands far below his own natural rating. Emergency-only, or the occasional gadget wrinkle.

## When it's actually worth it

Given the cost, out-of-position play earns its keep in a few specific situations:

- **Injury and depth patches.** Your third safety goes down and your fourth is unplayable — sliding a corner over on a cheap move may field a better player than the natural backup for a week or two. Injuries and next-man-up are in [Morale, Health & Your Roster](#roster-management).
- **Genuine hybrid athletes.** A highly versatile player, especially a hidden-knack one, can hold a spot at close to natural level — and his versatility climbs the more you use him there.
- **Roster and package crunch.** Your defense needs twelve or thirteen bodies to fill eleven slots across its sub-packages, so a corner who can cover safety snaps saves you a roster spot you'd otherwise spend on a pure backup. See [Schemes & Scheme Fit](#schemes) for which packages your defense lives in.

What it is **not** good for is squeezing extra starters out of your stars. Moving a great player off his position almost always makes him worse, by design. For why some athletes re-score better at a new spot than others, see [Archetypes](#archetypes).

## What it does to the player

Playing a man out of position isn't free off the field either. His **contract ask blends toward wherever he actually lined up.** The game tracks the mix of positions he's played since he last signed, and his next ask is a proportional blend of those positions' pay scales. A running back who spent most of his games at receiver will ask for something close to receiver money.

That counter **resets every time he signs**, so you can't swap him back to his cheap position right before talks to dodge the raise — the season's worth of receiver reps still counts. This is the real long-term cost of using a player out of position: field him there enough and you'll pay him partly like the position he's been playing. What that does to your cap sheet is [Contracts](#contracts).

He'll tell you so, too. Every player carries a short **DEMANDS** line on his contract tab explaining *why* he wants what he wants, and the position blend is one of the reasons it can give ("I've been lining up at receiver all year"). It names the driver but never the dollar figure — that appears only once you open negotiations, where a fuller version of the quote shows up. It sits alongside the other things that shape an ask: production against his rating, what his personality cares about, loyalty and tenure, his age and his window to win. Those same motives drive mood and holdouts — see [Morale, Health & Your Roster](#roster-management--what-your-players-want).
