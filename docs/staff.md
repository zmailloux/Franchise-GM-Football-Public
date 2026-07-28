---
id: staff
title: Coaches, Scouts & the Organization
nav: 14
section: Building the roster
status: live
icon: 📣
tagline: >
  The seven people who run your building — what each one actually moves, and the hidden organizational
  currents underneath the league
related:
  - schemes
  - scouting
  - development
sources:
  - docs/scheme-coaching-magnitudes.md
  - sim/balance/coaching.yaml
  - sim/balance/staff_hiring.yaml
  - sim/lib/src/models/staff_role.dart
  - docs/org-quality.md
  - DESIGN.md#B
---

## Your seven-person staff

Every team employs the same seven-role staff. Each staffer is a rated person with his own skills, style and contract — and each role touches a different part of your franchise:

| Role | What he owns |
|---|---|
| **Head Coach** | The team dials (RB approach, playcalling aggression, blitz frequency), game management, motivation and discipline — and his personal style adds a fit perk when it matches a coordinator's system |
| **Offensive Coordinator** | The **offensive scheme** — the team runs his system for the length of his contract |
| **Defensive Coordinator** | The **defensive scheme**, including the specific zone shell (Cover 2, Tampa 2, Cover 3, Quarters) — visible and editable in his staff profile |
| **Special Teams Coach** | The kicking game |
| **Offensive Scout** | Your read on every offensive draft prospect |
| **Defensive Scout** | Your read on every defensive draft prospect |
| **Team Doctor** | Injury recovery and rehab |

Coaches carry a merged overall of their own, rolled up from their coaching skills the same way a player's `OVR` rolls up from his attributes — so the market can rank a head-coach candidate the way it ranks a free-agent tackle.

:::screenshot The staff screen
Office ▸ Coaches — your seven staffers, their overalls, styles, and contract years remaining.
:::

## What coaching actually moves on the field

Coaching is not flavor text: each skill feeds a specific on-field channel, and the full spread is big — the same roster wins meaningfully more games under an elite coach than a terrible one, worth real wins across a season. Most clubs employ coaches near the league middle, where the effect is modest by design: an average coach is neutral, and it's the genuinely great or genuinely bad staff that moves your season. Coaching never outweighs the roster.

| Coaching channel | What it does on Sundays |
|---|---|
| **Run game** | Blocking quality on designed runs |
| **Pass defense** | The single biggest coaching channel — tightens completions allowed |
| **Playcalling** | Situational aggression: fourth downs, two-point tries, shot plays |
| **Play design** | Sharpens your scheme identity; also speeds how fast players learn the system |
| **Motivation** | A week-to-week edge in how ready the team plays — the second-biggest channel |
| **Discipline** | Fewer penalties |
| **Game management** | Fewer late-game blunders (botched clock, wasted timeouts) |
| **Kicking** | Field-goal and punt quality via the special-teams coach |

Two things worth knowing as a GM. A head coach's **playcalling trait is a real probability model** — an Aggressive coach genuinely goes for fourth downs far more often than a Cautious one, not just in flavor. And coaching **compounds**: a good staff also nudges your young players' [development](#development) year over year, which is how a well-coached franchise slowly out-grows an equally talented, badly coached one. The effect per season is modest and capped; the dynasty is built by keeping it running.

## Hiring, firing, and the offseason carousel

Staff contracts run down just like player deals, and the offseason has a staff phase: openings around the league fill from a market of free-agent coaches and scouts, and you shop the same pool. Candidates weigh your **appeal** — money on offer, the quality of your situation — so a losing club paying bottom dollar sees the good names sign elsewhere.

Three things to check before you hire:

1. **Scheme first.** A coordinator brings his system with him and your roster refits slowly — hiring a Vertical coordinator onto a Ground & Pound roster costs you seasons of [scheme fit](#schemes). The **Coaches Aligned** check tells you whether head coach and coordinators agree.
2. **The skills that pay.** Pass defense and motivation carry the most measured wins; play design speeds scheme learning after any system change.
3. **Scouts are a stealth pick.** Your two scouts *are* your draft board — see below.

:::note Coming to the league around you {built-off}
A fuller coaching carousel — hot-seat firings for underperforming AI coaches, success-keyed
retention, and clubs actively re-signing their own incumbents — is built and being balance-proven,
but switched off in this build. Today AI staffs turn over mainly as contracts expire.
:::

:::tip Changing schemes the cheap way
If you must change systems, hire into a **cousin scheme** — players keep partial familiarity credit
between related systems (Ground & Pound ↔ Read Option, Pro Set ↔ Quick Game, Run & Shoot ↔ Vertical),
so the learning tax is smaller.
:::

## Scouts: the quality of what you know

Draft [scouting](#scouting) runs through your two scouts — the offensive scout reads offensive prospects, the defensive scout reads defensive ones. A better scout means a tighter, less-biased projection on every prospect on his side of the ball; a weak one means wider misses in both directions. Hiring or firing a scout **re-rolls your whole department's read** on the class, which makes a scout upgrade one of the highest-leverage winter moves a rebuilding team can make.

## The organization underneath {live}

Beneath the people you hire, every AI franchise carries a hidden **organizational profile** — a quality of the building itself. It tilts how that front office behaves: some organizations systematically **overpay**, some **chase big names**, some run a **scout-first culture** that drafts better than it signs. Ownership changes and regime resets shift these eras over time, and the league's news feed surfaces the stories they create — the perennially dysfunctional club shopping every star, the quiet franchise that never misses in April.

You'll feel it as texture in every market: the same contract ask gets different answers from different buildings, and some teams stay good (or bad) for structural reasons, not luck.

:::note Your club is exempt
The organizational currents that push AI teams up and down **never touch your team**. Your franchise
rises or falls on your decisions alone — no hidden hand, in either direction.
:::

:::screenshot The league news feed
Regime changes, firings and organizational storylines surfacing in the news.
:::

## Reading your staff as a system

The staff screen is worth a season-start audit: a head coach whose style matches his coordinator's scheme adds a small fit bonus to every preferred-archetype player; a coordinator in a contract year is a scheme change waiting to happen; and a bottom-quartile scout is quietly costing you a round of draft accuracy. The staff is a small roster — run it like one.
