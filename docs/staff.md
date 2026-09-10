---
id: staff
title: Coaches, Scouts & the Organization
nav: 15
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
  - sim/lib/src/models/assistant.dart
  - sim/lib/src/dev/coaching_dev.dart
  - docs/scheme-coaching-magnitudes.md
  - sim/balance/coaching.yaml
  - sim/balance/staff_hiring.yaml
  - sim/balance/injury.yaml
  - sim/lib/src/models/staff_role.dart
  - docs/org-quality.md
  - DESIGN.md#B
---

## Your seven-person staff

Every team employs the same seven-role staff. Each staffer is a rated person with their own skills, style and contract — and each role touches a different part of your franchise:

| Role | What the role owns |
|---|---|
| **Head Coach** | The in-game calls — playcalling aggression, blitz frequency and the coverage shell (Cover 1, Cover 2, Tampa 2, Cover 3, Quarters) — plus game management, motivation and discipline. A head coach also covers a vacant coordinator's system, and that personal style adds a fit perk when it matches a coordinator's |
| **Offensive Coordinator** | The **offensive scheme** and the RB approach — the team runs that system for the length of the contract |
| **Defensive Coordinator** | The **defensive scheme**: the front the team lines up in and whether it plays man or zone |
| **Special Teams Coach** | The whole kicking game — field goals, punts, and both sides of the return game (your returns run longer and opponents' shorter under a good one) |
| **Offensive Scout** | Your read on every offensive draft prospect |
| **Defensive Scout** | Your read on every defensive draft prospect |
| **Team Doctor** | How often your players get hurt, how fast they come back, and how much damage a serious injury leaves behind |

Release a coordinator (or your head coach) mid-season and his system stays in place exactly as it
was — the whole roster keeps playing it — until his replacement actually arrives. Sign or promote
someone new and the hire sheet tells you what changes and what it costs to install.

### The assistants under them

The seven are who you hire; they are not everyone in the building. Each coordinator carries a package
of **position coaches** you inherit alongside — QB, RB, receivers and offensive line under the
offensive coordinator; defensive line, linebackers and defensive backs under the defensive
coordinator; a special-teams assistant; and three administrative aides (assistant head coach, game
management, quality control) under the head coach.

They matter most in one place: [development](#development). The assistant who owns a young player's
position group drives the larger share of that player's Coaching grade — more than the club's overall
room does — until the player is around 30. So a coordinator hire is really a room hire, and a great
coordinator with a thin package is not the same thing as a great room.

Each coach's own styles are printed on the staff profile — the same rows for a candidate in the market as for the coach you employ — so you can read the system a hire brings before you sign. Coaches also carry a merged overall of their own, rolled up from their coaching skills the same way a player's `OVR` rolls up from his attributes, so the market can rank a head-coach candidate the way it ranks a free-agent tackle.

:::screenshot The staff screen
image: staff.jpg
:::

## What coaching actually moves on the field

Coaching is not flavor text: each skill feeds a specific on-field channel, and the full spread is big — the same roster wins meaningfully more games under an elite coach than a terrible one, worth real wins across a season. Most clubs employ coaches near the league middle, where the effect is modest by design: an average coach is neutral, and it's the genuinely great or genuinely bad staff that moves your season. Coaching never outweighs the roster.

| Coaching channel | What it does on Sundays |
|---|---|
| **Run game** | Blocking quality on designed runs |
| **Pass defense** | The single biggest coaching channel — tightens completions allowed |
| **Playcalling** | Fourth-down aggression — how often the coach goes for it rather than kicking. That decision only |
| **Play design** | Sharpens your scheme identity; also speeds how fast players learn the system |
| **Motivation** | A week-to-week edge in how ready the team plays — the second-biggest channel |
| **Discipline** | Fewer penalties |
| **Game management** | Fewer late-game blunders (botched clock, wasted timeouts) |
| **Kicking** | The special-teams coach's channel — field-goal and punt quality, plus the return game on both sides: an edge over the OTHER club's special-teams coach stretches your returns and shortens theirs |

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
average is neutral — neither helping nor hurting — so the ones that matter are the genuinely great and
the genuinely awful.

Two things follow from that. A cheap doctor is a real cost, not a saving: you pay for it in snaps
your best players don't take. And Re-Injury Protection compounds quietly — a bad medical staff turns
one serious knee injury into a player who keeps breaking down for the rest of his career, because a
severe injury permanently raises how fragile he is and good aftercare blunts that.

He also carries a **Type** and a **Specialty**, and both are real. The Type is a trade: a *Preventor*
keeps more players off the report but gets the hurt ones back a little slower, a *Healer* is the
reverse, and *Balanced* is second at both and best at neither. The Specialty is one of six injury
groups — **Head & Neck, Shoulder & Arm, Core & Ribs, Soft Tissue, Knee & Leg, Foot & Ankle**. Every
injury in the game falls in exactly one of them, and anything in that group comes back a little sooner
and is a little less likely to flare up again. It is a nudge, not a cure: the three ratings still do
most of the work, so never pick a doctor on specialty alone.

**Two of the hardest moments in a season now run through him.** When one of your players goes down
for the year, how long that actually costs him is your medical staff's call — an average staff means
what it always meant, out until next season, but a genuinely great one can get him back for a playoff
run. Nobody comes back from a torn knee in six weeks, so this is a real edge and not a cheat code.

And when a player is deciding whether to come back at all, your doctor is one of the voices in the
room. That decision used to be about nothing but his age. It now weighs what he actually tore, how
many serious injuries he has already survived, how good he still is, how tough he is — and the staff
looking after him. A great medical staff talks some players out of retiring. Not many, and not the
ones whose bodies are genuinely finished, but some — and those are usually the ones you most wanted
back.

Two things worth knowing as a GM. A head coach's **playcalling trait is a real probability model** — an Aggressive coach genuinely goes for fourth downs far more often than a Cautious one, not just in flavor. And coaching **compounds**: a good staff also nudges your young players' [development](#development) year over year, which is how a well-coached franchise slowly out-grows an equally talented, badly coached one. The effect per season is modest and capped; the dynasty is built by keeping it running.

## Hiring, firing, and the offseason carousel

Staff contracts run down just like player deals, and the offseason has a staff phase: openings around the league fill from a market of free-agent coaches and scouts, and you shop the same pool. Candidates weigh your **appeal** — money on offer, the quality of your situation — so a losing club paying bottom dollar sees the good names sign elsewhere.

Your staff is paid from its **own budget**, separate from the player salary cap — money you spend on
coaches never costs you a player. What that budget buys climbs steeply: an elite head coach can eat
more than half of it by himself, a merely good one costs a fraction of that, and there are always
serviceable bodies at the bottom of the market for pocket change. So the real decision is *where* to
concentrate — one great voice and six cheap hires is a legitimate build, and so is seven solid ones.

**Stars shake loose now.** An elite staffer decides whether your club is worth staying at: a star
coordinator on a losing team usually declines the extension and walks to the market at expiry, and
elite names refuse to sign up for a rebuild they don't believe in — so most offseasons put at least
one genuinely elite coach on the open market, and a winning club holds its stars more easily than a
cellar one. Two humanities survive that rule: a **loyal** star may stay through the bad years
anyway, and a **promotion always outranks standing** — an all-star coordinator — employed OR sitting in free agency — will take your head
coach chair even if you went 2-15, because it's their shot. Your own elite staff play by the same
rule, and a refusal sticks for the season: only a genuinely better offer reopens the conversation.

What a staffer **asks** is also personal, not just a market number. A greedy staffer simply prices
himself higher everywhere; a loyal one takes less to stay with the club they already work for — and
bills a rival trying to poach them off a staff; an ambitious one discounts a contender and wants a
premium to sign up for a rebuild. The offer screen says so in plain words whenever one of those is
moving the number in front of you.

**Promoting from inside is one move.** If your coordinator is the man you want in the head coach's chair, you don't have to fire the incumbent first and hope. PROMOTE is offered on the coordinator while the current head coach is still seated: the sheet names who gets let go, what his release costs you in dead charge, and what your budget looks like afterward, and you commit to both halves at once. If the promotion is refused, nothing happens — the firing rolls back with it.

**Poaching a rival's coordinator costs money now.** A coordinator in the last year of his deal used to be free to take: you paid his new salary and nothing else. Take one now and you also pay out the year he still owed his old club — a real charge against your staff budget, on top of the contract you're offering him. His old club still pays nothing either way. It doesn't close the door on a raid; it just stops the last-year coordinator being the cheapest head coach on the market.

Three things to check before you hire:

1. **Scheme first.** A coordinator brings a system along and your roster refits slowly — hiring a Vertical coordinator onto a Ground & Pound roster costs you seasons of [scheme fit](#schemes). The **Coaches Aligned** check tells you whether head coach and coordinators agree.
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

Draft [scouting](#scouting) runs through your two scouts — the offensive scout reads offensive prospects, the defensive scout reads defensive ones. A better scout means a tighter, less-biased projection on every prospect on that side of the ball; a weak one means wider misses in both directions. Hiring or firing a scout **re-rolls your whole department's read** on the class, which makes a scout upgrade one of the highest-leverage winter moves a rebuilding team can make.

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

The staff screen is worth a season-start audit: a head coach whose style matches the coordinator's scheme adds a small fit bonus to every preferred-archetype player; a coordinator in a contract year is a scheme change waiting to happen; and a bottom-quartile scout is quietly costing you a round of draft accuracy. The staff is a small roster — run it like one.
