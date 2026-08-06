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
  - sim/balance/injury.yaml
  - sim/lib/src/models/staff_role.dart
  - docs/org-quality.md
  - DESIGN.md#B
---

## Your seven-person staff

Every team employs the same seven-role staff. Each staffer is a rated person with his own skills, style and contract — and each role touches a different part of your franchise:

| Role | What he owns |
|---|---|
| **Head Coach** | The in-game calls — playcalling aggression, blitz frequency and the coverage shell (Cover 1, Cover 2, Tampa 2, Cover 3, Quarters) — plus game management, motivation and discipline. He also covers a vacant coordinator's system, and his personal style adds a fit perk when it matches a coordinator's |
| **Offensive Coordinator** | The **offensive scheme** and the RB approach — the team runs his system for the length of his contract |
| **Defensive Coordinator** | The **defensive scheme**: the front the team lines up in and whether it plays man or zone |
| **Special Teams Coach** | The kicking game |
| **Offensive Scout** | Your read on every offensive draft prospect |
| **Defensive Scout** | Your read on every defensive draft prospect |
| **Team Doctor** | How often your players get hurt, how fast they come back, and how much damage a serious injury leaves behind |

Each coach's own styles are printed on his staff profile — the same rows for a candidate in the market as for the man you employ — so you can read the system a hire brings before you sign him. Coaches also carry a merged overall of their own, rolled up from their coaching skills the same way a player's `OVR` rolls up from his attributes, so the market can rank a head-coach candidate the way it ranks a free-agent tackle.

:::screenshot The staff screen
image: staff.jpg
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

## What your team doctor is worth

He is the one staffer who never touches a snap and still decides how much of your roster you get to
play. Three ratings, all real:

| Rating | What it does |
|---|---|
| **Injury Prevention** | How often your players go down in the first place |
| **Rehab Speed** | How quickly the ones who do go down come back |
| **Re-Injury Protection** | How much lasting fragility a serious injury leaves behind |

The spread is wide on purpose. **The best medical staff in the league sees roughly half as many
injuries as the worst**, and gets hurt players back meaningfully sooner. A doctor near the league
average is neutral — he neither helps nor hurts — so the ones that matter are the genuinely great and
the genuinely awful.

Two things follow from that. A cheap doctor is a real cost, not a saving: you pay for him in snaps
your best players don't take. And Re-Injury Protection compounds quietly — a bad medical staff turns
one serious knee injury into a player who keeps breaking down for the rest of his career, because a
severe injury permanently raises how fragile he is and good aftercare blunts that.

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
image: league-news.jpg
:::

## Reading your staff as a system

The staff screen is worth a season-start audit: a head coach whose style matches his coordinator's scheme adds a small fit bonus to every preferred-archetype player; a coordinator in a contract year is a scheme change waiting to happen; and a bottom-quartile scout is quietly costing you a round of draft accuracy. The staff is a small roster — run it like one.
