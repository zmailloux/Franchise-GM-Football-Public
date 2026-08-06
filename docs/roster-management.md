---
id: roster-management
title: Morale, Health & Your Roster
nav: 13
section: Building the roster
status: live
icon: 🏥
tagline: >
  Keeping your 53 healthy and deep — the practice squad, injured reserve, depth charts, and what your players want
related:
  - contracts
  - free-agency
  - development
sources:
  - docs/practice-squad-ir.md
  - DESIGN.md#M
  - DESIGN.md#P
  - docs/holdouts-and-expectations.md
  - sim/lib/src/league/practice_squad.dart
  - sim/lib/src/models/settings.dart
  - sim/lib/src/mood/desire_tuning.dart
---

## Your roster, in three buckets

Your franchise carries players in three places: the **active roster** (the 53 who can play this Sunday), the **practice squad** (fringe talent you can call up), and **injured reserve** (hurt players parked to free a slot). Only active players count against your 53-man limit, your team rating, and your game-day lineup.

| Bucket | Size | Counts vs 53? | Cap hit | Who belongs here |
|---|---|---|---|---|
| Active roster | up to **53** (floor **44**) | yes | full salary | everyone who plays |
| Practice squad | up to **16** | no | flat **$250k** (under 3 yrs exp) / **$400k** (3+ yrs) | young fringe talent, developmental bodies |
| Injured reserve | no cap on count | no | full salary still counts | anyone out **2+ weeks** with an injury |

:::warn Compliance is checked before every game
This isn't a once-a-year gate. Before **any** week your club is scheduled to play, your active roster must be at or under 53 **and** your cap spending at or under the limit. Fail either and the week won't advance until you fix it — cut, restructure, or move somebody to the practice squad. During the offseason you may carry more than 53 freely. Cutting and the dead money it leaves live in [Contracts](#contracts).
:::

## The practice squad

Your practice squad is up to **16** players who don't count against your 53 but are yours to develop and promote. It isn't optional and there's no setting for it — all 32 clubs run one, and the league is balanced around that. In-season, when an injury opens a hole, tapping your own squad should usually beat shopping the street — squads are carved from the **best willing fringe** in the league, and the in-season free-agent pool is deliberately worse than that. Shopping that pool is covered in [Free Agency & the Salary Cap](#free-agency). Each squad also has room for up to **two** deliberate exceptions: young, high-ceiling players (24 or under) allowed to sit above the usual quality band. Those are your development stashes — and poach bait by design.

:::screenshot The practice squad, with protections and elevations
image: practice-squad.jpg
:::

**Who will join.** Not everyone accepts a practice-squad deal. It's a fixed one-year, league-minimum contract, and willingness falls off sharply as a player gets better — a fringe starter is roughly a coin flip, and anyone clearly better than that refuses outright. Young players, unproven bodies, and anyone sitting unsigned a while are far more willing. Every offer shows an accept read — `LIKELY JOINS`, `CONVINCIBLE`, or `HARD SELL` — before you commit, and a small salary sweetener can tip a wavering player.

**Calling players up.** There are two ways onto your active roster:

- **Elevate** — a game-day call-up. You may elevate up to **2** squad players per game; they join that week's lineup and auto-revert to the squad afterward. Each player can be elevated at most **3 times per season** — after that, you must promote him to the 53 or he sits.
- **Promote** — a permanent move to the active roster. Needs a free 53 slot and cap room.

:::note The unified guarantee rule
The moment a practice-squad player first touches any 53-man roster — you elevate him, you promote him, or a rival poaches him — his one-year deal becomes **fully guaranteed** and starts **counting against that team's cap for the rest of the season**. Cut him later and the guarantee turns into dead money. One clean rule replaces the real NFL's tangle of weekly stipends and prorated poach guarantees, and it keeps elevation honest: calling a body up isn't free, so you won't spam it.
:::

**Poaching and protection.** Your squad isn't safe. Any rival with a real hole can **poach** one of your squad players straight onto their 53 (the guarantee rule then lands on them). Rivals are picky: they check their own squad first, and only reach outside for someone who is both genuinely playable and a clear upgrade on what they already have. To defend your best stashes, every team — you included — **protects 4** of its 16 at a time; a protected player cannot be claimed. Your protected set carries forward untouched unless you change it, and a new franchise opens with each team's four most poachable bodies already shielded. So hoarding an unusually high-rated player, unprotected, should feel risky. You can poach too: rival squad players show up in your free-agent view, badged with their current team.

At season's end all practice-squad deals expire to free agency, and squads rebuild after the draft.

## Injured reserve

When a player gets hurt for **2 or more weeks**, you can place him on injured reserve. That **frees his 53 slot** so you can sign or promote a replacement — but his salary still counts against your cap. He's locked away for at least **4 weeks** (longer if the injury itself runs longer), then can be **activated** back onto the active roster when you have a free slot.

The catch is a season budget: you get **8 activations per season**. Spend them greedily and you can strand a healthy player on IR with no way back until the offseason. At season's end everyone heals and every designation resets. The AI plays it simply: anything costing more than four weeks goes straight to IR, and shorter injuries get shelved only under real roster pressure.

:::tip When to reach for IR
IR pays off only if the freed slot is worth more than the flexibility of keeping the player active. If he'd be back in about the minimum four weeks and you're not desperate for the spot, holding him off IR keeps an activation in your pocket for a worse injury later.
:::

## Depth charts, personnel and rotation

:::screenshot Your starting eleven, by personnel grouping
image: depth-chart.jpg
:::

**Your roster is your depth chart.** Within each position group a player's vertical order *is* his role — top receiver is your `WR1`, next is `WR2`, and so on. You rank players against others at the same position. This is the single most important lever you have over who plays and who gets the ball, and the sim reads it directly.

**It drives the box score.** Who touches the ball is weighted by depth-chart slot, blended with scheme fit and rating — not by rating alone. It's a *weighting*, not a script: defenses, situation and the play-by-play still move the numbers. But naming a player your `WR1` genuinely shows up in his stat line. (Slotting a player somewhere he doesn't naturally play is its own trade-off — see [Out-of-Position Play](#out-of-position).)

**And when you disagree with the machine, you can pin.** The lineup normally fills itself from the depth chart, but any slot can be **pinned to a specific player** — the game honors your pin even when it's a worse fit, hands him the slot, and sorts the other ten around him. Unpin and the automatic assignment takes back over.

**The roster screen also shows what your scheme actually requires.** Each position group carries a required-starters count derived from the looks your [scheme](#schemes) really plays, and if injuries leave a group unable to fill its slots you're warned before kickoff — a nudge to promote, sign, or slide a body over before a backup's backup does it for you.

**You need more than eleven defenders.** The defense changes personnel snap to snap: base, nickel, dime, goal-line. Because those packages call for different bodies, a scheme's real requirement is **12–13 defenders to fill 11 slots**, and your lineup screen shows the extras as sub-package slots. Which bodies a package pulls follows real football — a nickel corner in an odd front replaces a *safety*, not an inside backer, which is why a 3-4 keeps two inside backers on the field for the large majority of its snaps while a 4-3 almost never does. Your scheme decides which packages you live in; see [Schemes & Scheme Fit](#schemes).

**Injuries and next-man-up.** Players carry stamina that drains as they rack up snaps and recovers on the bench, so a fresh backup can out-snap a gassed starter late in a half, and blowouts let you rest starters. When a starter goes down mid-game, the next player at that slot steps in for the rest of it. If a group is completely empty, the game borrows the nearest sensible body rather than fielding ten men — a missing linebacker is covered by a safety, then an edge defender; a missing tackle by a guard — but a borrowed body plays like what he is, not what you needed.

:::warn Resting a starter really does cost you
Rotation isn't just bookkeeping. Whoever is actually on the field for a snap is whose ratings the game grades that snap — so a rested starter is a rested starter, and his backup's numbers are the ones in play. Depth past your starters is a genuine strength question, not a paperwork one.
:::

## What your players want

Every player carries a hidden mood, surfaced as a three-state chip: **Happy**, **Content**, or **Unhappy**. It's built from seven things — team success, his usage, his contract, his loyalty, roster churn around him, his coaching, and his prestige — each weighted by his personality. Every player has a primary trait plus a secondary one at half strength, drawn from four: **Winner** (a title matters far more than a paycheck), **Fame** (spotlight and usage), **Money**, and **Loyal**. A Winner on a losing team and a Money player on a below-market deal are unhappy for completely different reasons.

Mood is not just flavor — it feeds his contract asks and, if it curdles, real trouble. A discontented player escalates through four states: **content**, privately **disgruntled**, a public **trade request**, and at the sharp end a **holdout**. Three situations open the door:

| Situation | What it takes |
|---|---|
| **Chasing a ring** | A star past his mid-twenties, no championship, on a team that hasn't contended in years |
| **The buried alpha** | A star skill player getting clearly less of the ball than his standing says he's owed |
| **Reopening the deal** | Off his rookie deal, a year or two left, and badly outplaying what you're paying him — checked at the season opener |

Once a gripe opens, its intensity climbs each week the cause goes unfixed and falls faster once you fix it. Winners and ambitious players simmer up quicker; loyal ones far slower. Public drama is deliberately scarce: your club runs at most **one active saga at a time** and starts at most **two per season** — everyone else who crosses the line stays privately disgruntled, still costing you at the negotiating table but never making news.

If it reaches a renegotiation demand you have three answers: **pay him**, **promise to revisit it** (which halves the pressure but doesn't clear it), or **ignore it**. An unresolved trade request also puts him on the trade block and makes him a target as the deadline nears. The dollars side of these demands is in [Free Agency & the Salary Cap](#free-agency); the rhythm of the season they ride is in [How a Season Works](#season-flow).

**How far it can go is a difficulty question.** On **Easy and Medium** the ladder stops at the public trade request — the modern hold-in, where he shows up, plays, and is loudly unhappy. Only **Hard** lets a player actually sit out, and Custom lets you set that ceiling wherever you want. A player who does sit is unavailable, is fined a slice of his salary each week (credited back to your cap), and gives in well before the season is out if nothing resolves.

The whole morale economy is also a switch. **PLAYER MOODS** under Settings ▸ Difficulty turns it off entirely — no mood shown anywhere, no effect on any decision — and it starts **off on Easy**. Holdouts and season goals hang beneath it as children: with moods off, neither one runs. Turning moods back on simply resumes; nothing was rewritten while it was off.

## Season goals {live}

On **Hard**, a handful of your players start each season with up to three goals of their own — a personal one ("rush for 1,150 yards", "lead my position group in snaps"), a team one ("reach the playoffs"), or a contract one. They're on the **GROWTH** tab of the player card, with live progress as the season runs, and they resolve when the year does. Hitting them lifts his mood; missing them drags it, weighted by what he cares about — a Winner feels a missed playoff berth, a Money player feels a missed contract goal.

They're a pressure system, so **Easy and Medium leave them off**, and you can switch them either way at any time under Settings ▸ Difficulty — they sit under PLAYER MOODS, so they need moods on to do anything. One thing to know: goals are handed out **when a season begins**, so turning them on mid-season won't give anyone goals until the next one starts. Turning them off hides them everywhere and stops them touching mood at all.

Two more pieces stay off unless you ask for them: **mood affecting on-field play** is an opt-in setting, and **league-wide sagas** — the same drama on all 32 rosters instead of just yours — are built but not switched on. {built-off}
