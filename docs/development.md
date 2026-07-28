---
id: development
title: Player Growth & Aging
nav: 5
section: Players
status: live
icon: 📈
tagline: >
  How players climb toward their potential, peak, and fade — and what you can and can't see coming
related:
  - ratings
  - draft
  - scouting
sources:
  - DESIGN.md#A
  - DESIGN.md#M
  - docs/overview/dormant-features.md
  - sim/lib/src/dev/player_dev.dart
  - sim/lib/src/dev/player_dev_tuning.dart
  - app/lib/data/growth_display.dart
---

## The arc of a career

Every player on your roster is somewhere on a curve. Young players climb toward their ceiling, hold near a peak for a while, then slide down the back side as age catches up. That whole arc is baked in before the player ever suits up for you — each player carries his own **personal progression track** covering the rest of his career, season by season.

You never see that track directly. Underneath, the game walks it forward every offseason, nudging each of his `0–99` skill ratings up or down, and only then recomputes his `OVR` from those ratings. Growth and decline are never applied to `OVR` directly — they happen at the [rating](#ratings) level and bubble up, which is why a fading veteran loses `speed` before he loses anything else.

Two different indicators sit on the surface, and they're easy to confuse. The **±N badge** beside a player's `OVR` is the *observed* change since this season started — history. The small **growth arrow** is a *forecast*: next season's projected move, bucketed into mild, clear or steep so you never get an exact number. The arrow is truthful about direction and rough size; only the bucketing hides anything. By default you see arrows on **your own team only**, and Settings lets you widen that to the whole league or turn them off entirely.

| Phase | What the curve looks like | What you'll notice |
|---|---|---|
| Ascent | Positive deltas, biggest for the youngest players | Green trend arrows, an `OVR` ring that ticks up each offseason |
| Peak / plateau | Deltas near zero for a stretch | Ratings hold; a prime you want to build around |
| Decline | Deltas turn negative, steepening with age | Red arrows, physical ratings (`speed`, `burst`) fading first |

:::screenshot Growth arrows on the roster
The roster list with the ±N badges (what already happened) and growth arrows (the forecast) side by side.
:::

Positions age differently. On top of each player's own curve, every position carries a **decline-onset age**; once a player passes his, he sheds a little extra every year, and the penalty grows with each year past it — so a fading player fades faster the longer you hold him. The onsets are real football ages: running backs start down in their late twenties, quarterbacks hold well into their thirties, kickers and punters longest of all. A mid-20s back can already be almost entirely on the downslope while a passer the same age is still climbing. Plan re-signings around the curve, not just the current number.

Durability follows the same clock. From about age `30` a player's injury-proneness ratchets permanently upward every few seasons — it never comes back down, and it isn't reflected in his `OVR` at all. That's the quiet reason a `33`-year-old star is a worse bet than his rating says.

## Growth types and the hidden curve

There's no single "early bloomer" or "late developer" label stamped on a player. Instead, each player's individual track *is* his growth type: some front-load their gains and are close to their ceiling by their early 20s; others keep inching upward deep into their 20s before plateauing. Two players with the same current `OVR` can be headed to very different places.

Because the curve is fixed per player, two things follow. First, a breakout isn't random luck painted on afterward — it's the ascent portion of a track finally showing up in the box score. Second, while a player is still climbing he is **capped at his true potential**: a good year can carry him a point or two past it, but not further. Once he's past his prime that cap stops applying, so a late-career player can sit above an old ceiling — he just won't be climbing to get there.

Growth also **respects who a player is**. When a season's gains land on his ratings, the skills that define his current [archetype](#archetypes) grow together, so a speed rusher gets better at being a speed rusher instead of quietly morphing into a run-stopper. Archetype changes through development alone are vanishingly rare — the player you drafted for a role stays that player as he improves.

## Potential you can't fully see

Every player has a **true potential** — essentially the highest `OVR` his track will ever reach if development goes to plan. That true number is hidden. What the game shows you is a **scouted estimate**, and the quality of that estimate depends on your scouting: a sharp front office reads a prospect close to the truth, a weak one can be badly fooled in either direction.

:::note Why the potential you see can be wrong
The displayed potential is a *blurred* reading of the real one, and the blur is deliberate. A player labeled a future star can top out below the label, and a modest projection can be hiding a real gem. Treat scouted potential as an opinion with error bars, not a promise.
:::

How that fog is produced, how good scouts tighten it, and how the draft interview and combine sharpen a read are all covered on the [Scouting](#scouting) page. Here it's enough to know: the ceiling number on a player card is an estimate, and estimates miss.

## Dev traits: boom, bust, and the fast track {live}

On top of the raw curve, each player carries a **development trait** — one of five tiers, from lowest to highest: **Hidden, Normal, Star, Superstar, X-Factor**. The trait isn't part of the curve; it's a thumb on the scale applied every season on top of it. A high tier adds a small persistent push upward, so a Superstar reliably reaches his ceiling while a Hidden settles below his. It also widens the swing: an X-Factor's season-to-season results scatter far more than a Hidden player's. The trait is never shown to you as a label — you read it off the growth arrows and the scouts' potential estimate.

Most of the league is **Normal**. Hidden and Star are each reasonably common; Superstar is uncommon and X-Factor genuinely rare.

Those pushes look tiny, and over one season they are. Over the life of a rookie contract and beyond they're worth several `OVR` points against a Normal peer on the same curve — potential permitting, most of the gap between a good starter and a star.

Age widens the swing on its own, independently of tier. Young players carry extra **boom/bust volatility**, settling down as they age. That's why a high-upside 21-year-old can either rocket past expectations or stall for a year, and why a 29-year-old rarely surprises you in either direction.

## What moves the needle

The dominant force in development is **age** — where a player sits on his own curve. That's always live, and it's most of the story. Coaching adds a real, modest push on top; two further influences are designed in but currently switched off:

- **Age and the personal curve** — live, and the primary driver of every rise and fall.
- **Coaching** {live} — a well-coached franchise genuinely develops its players a little faster, and a badly coached one a little slower. The effect is deliberately modest and capped each season — a nudge on the curve, not a rewrite — but it compounds across years, which is part of why sustained [staffs](#staff) matter. An average staff is neutral.
- **Playing time and usage** {built-off} — the design has benchwarmers developing slower than players getting real snaps, but that throttle is parked and isn't affecting development today.
- **Organization quality** {built-off} — the idea that a well-run franchise develops its young players faster is built and measured, but ships off. So a prospect develops the same on a model franchise and a dysfunctional one.

:::tip Read the arrow, not just the number
A young, cheap player trending up is worth more to your future than a slightly higher-`OVR` veteran trending down — and the market usually prices the current number, not the direction. Buy the curve, not the snapshot.
:::

Mood sits alongside all this and does **not** touch the growth curve. What it does touch is availability and money: unhappy stars really do escalate to trade requests, renegotiation demands and holdouts, and that machinery is live in a new game. The one part still switched off by default is mood nudging *on-field* effectiveness — that's an opt-in setting. See [Morale, Health & Your Roster](#roster-management) for how mood plays out and [Contracts](#contracts) for what a demand costs you.

## Decline and retirement

The back half of the arc is the mirror of the front: negative deltas eat into ratings, the physical tools go first, and effective `OVR` drifts down. Eventually a player reaches the end. Retirements are resolved at the close of a season, driven by age, accumulated decline and a banged-up injury history rather than by any single cutoff. An old, worn player one bad season from the scrap heap may simply walk away in the offseason.

That makes the timing of your roster moves a real decision: extend a declining veteran a year too long and you're paying peak money for downslope production — or worse, for a player who retires out from under the contract. The [How a Season Works](#season-flow) page walks through where retirement and offseason aging land in the yearly sequence, and [Player Stats & Ratings](#ratings) explains how the underlying skills roll up into the `OVR` you see move.
