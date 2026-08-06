---
id: season-flow
title: How a Season Works
nav: 1
section: Start here
status: live
icon: 📅
tagline: >
  The yearly franchise loop, offseason to champion, and what you actually do in each phase
related:
  - ratings
  - contracts
  - roster-management
sources:
  - docs/overview/README.md
  - docs/overview/engine-and-choreographer.md
  - docs/season-phase-machine.md
  - DESIGN.md#V
  - DESIGN.md#R
  - sim/lib/src/season/schedule.dart
  - sim/lib/src/season/playoffs.dart
  - sim/lib/src/sim/personnel.dart
  - sim/lib/src/game/fatigue.dart
---

## Welcome, GM

*Franchise GM: Football* is a single-player football GM game. You run one franchise — roster, salary cap, draft, trades, coaching staff, season — against 31 computer-run teams. You're the general manager, not a player and not the head coach on the field: you build the team, set the plan, and watch what your decisions produce.

Everything runs on your device — no server, no online league. A brand-new game loads a real-shaped league of 3,441 players plus coaches and scouts, and hands you the keys to one of its 32 clubs. From there time only moves when you move it, and every step reports back what happened.

## The year at a glance

A league year runs the same ordered loop every season. You advance it phase by phase; the other 31 teams run the same steps in the background at the same time.

| Stage | Phases in order | What it settles |
|---|---|---|
| Offseason | Contract aging → staff hiring → re-signings → cuts → free agency (3 waves) → a pre-draft trade window → the draft → the post-draft tail → training camp → cut to 53 & cap compliance | Who's on the team, and who's paid |
| Regular season | 18 weeks, 17 games each | Standings and playoff seeds |
| Playoffs | Wild Card → Divisional → Conference → the championship | Your finish, and the champion |
| Season end | Awards → retirements → career roll → stay-or-move → roll to next offseason | The book closes; the next year opens |

## The offseason, in order

The offseason is a fixed sequence of phases. You handle each one, get a report, and continue to the next.

- **Contract aging.** Every player and staff deal loses a year; deals that run out drop into the free-agent or hireable pool. You get a "what changed" recap first.
- **Staff hiring.** Hire and extend your head coach, coordinators, special-teams coach, scouts, and team doctor from a candidate pool. Rival teams chase the same names against their own budgets, so a coach you wait on may be gone. Who does what: [Coaches, Scouts & the Organization](#staff).
- **Re-signings, then cuts.** Two separate beats. First apply the franchise tag and make extension and re-sign offers to your expiring players; then cut your cap casualties. Teams may carry more than 53 through the offseason — the squeeze comes later. Cap math and offer mechanics: the [Contracts](#contracts) page.
- **Free agency, three waves.** The market opens in three tiers — "The Frenzy" (the top names), then "The Market," then "Bargains." You bid against the AI clubs in each wave, and your results from one wave are revealed as you enter the next. Full model: [Free Agency](#free-agency).
- **The pre-draft window.** The rival clubs trade picks and players among themselves before anyone is on the clock, so the board you sit down to isn't quite the one you left. Your own [trade](#trades) desk stays open throughout.
- **The draft.** An on-the-clock draft with prospect face cards. What you know about each prospect depends on your [Scouting](#scouting); pick mechanics are on the [Draft](#draft) page.
- **The post-draft tail.** The undrafted pool clears, clubs short of bodies fill out their rosters, the league's spending floor is applied to the AI teams, and next year's pick ledger rolls forward. Mostly bookkeeping, but it is where a lot of the league's depth actually gets signed.
- **Training camp.** A development beat between the draft and week 1. There is **no camp screen** — it runs through as part of the advance, and the user-facing beat you actually stop on is the cut-to-53 and compliance gate below.
- **Preseason games.** Three exhibition games are built into the calendar but are **switched off**, and there is no setting to turn them on. Nothing sits between camp and week 1 today.

:::warn Get legal before week 1
Right before the season opens, your team must be **compliant**: an active roster of **53 or fewer** (and at least **44**), no more than **16** on the [practice squad](#roster-management), and total salary under the cap. Outside any of those lines and you can't kick off until you fix it — release players, restructure a contract to lower this year's hit, or make a [trade](#trades). The AI teams resolve it automatically; you get a blocking screen until you're legal. The same check fires before every regular-season game, so a midseason signing that busts the cap stops your next kickoff too.

Two softer signals ride along: the roster screen shows a **required-starters count per position**, derived from your scheme's actual looks, and before kickoff the game **warns you** if injuries have left a position group too thin to field its slots. Merely thin is a warning — ignore it and a backup's backup plays. A scheme-required position with **no healthy body at all** is a hard block, exactly like busting the cap.
:::

## Playing the regular season

The regular season is an 18-week calendar in which every team plays 17 games and takes exactly one bye. Weeks 1–4 and 15–18 are always full 16-game slates; the byes fall in weeks 5–14, so those weeks carry a few games fewer. Your core action is to **advance the week** — the whole slate simulates at once, you experience your own game, and the rest resolve in the background.

Each game week has three beats.

**1. Planning.** Before kickoff you set a gameplan against this specific opponent: run style (inside / balanced / outside), pass aggression (safe / balanced / aggressive), tempo (slow / normal / hustle), blitz rate (low / medium / high) and coverage shell (press / balanced / soft). Each tilts the odds for that one game only. Above the levers sits an **opponent read**: each of their units drawn as a bar either side of the league average, green to the **WEAK** side with a hint on how to attack it, red to the **STRONG** side telling you to respect it. There's a recommended plan you can apply with one tap or override, and every AI team plans against you the same way. It's a strategic tilt, not play-by-play control.

**2. The game.** Watch it or sim it (below).

**3. Post-game resolution.** Standings recompute across all 32 teams, injuries and suspensions are drawn, moods and holdout pressure update, the trade market moves (until the deadline closes midseason), in-season free agency fires if an injury opened a hole you can't cover, and needs and projected draft slots refresh.

It all folds into a **Weekly Report**: your result and a league scoreboard, injuries (yours first, with who replaces them and how many weeks he'll miss), incoming [trade](#trades) offers as actionable cards, suspensions, league news, and your refreshed needs plus projected draft slot. Player storylines land here too — a big game can earn a young player a growth bump, or talk a brewing holdout back down.

Your phone's inbox carries the league's own traffic alongside it, including the three **mock drafts** the League Office publishes during the year — see [The Draft](#draft--mock-drafts-during-the-season).

:::screenshot The week's results across the league
image: week-results.jpg
:::

A player can go down before a game or during one; a mid-game injury shows as a red line in the play-by-play and his backup finishes the game — next man up, straight from your depth chart.

## What actually takes the field

The eleven bodies on each side change snap to snap, and that's where your roster construction cashes out.

Your offense picks a **personnel grouping** each snap from the mix its [scheme](#schemes) prefers: a Quick Game offense lives in one back, one tight end, three receivers; a Ground & Pound team leans on two tight ends and two-back sets; a Vertical team spreads out with four receivers and no tight end. Short yardage pulls big bodies on; third-and-long pulls them off. The defense answers with a **substitution package**, and separately fields the **front** its scheme plays — which is why a 3-4 nickel and a 4-3 nickel are not the same eleven.

| Package | Defensive backs | When it comes on |
|---|:---:|---|
| Base | 4 | Standard downs against one or two receivers |
| Nickel | 5 out of a 4-3 · 4 out of a 3-4 | Three receivers, or any third-and-long |
| Dime | 6 | Four receivers, or long yardage out of a passing look |
| Goal line | 3 | Short yardage against heavy personnel |

:::note Why a 3-4 keeps both inside backers
Against three receivers a 4-3 front makes two swaps: the base end becomes a second edge rusher, and the outside backer comes off for a slot corner — a true five-defensive-back nickel. A 3-4 answers differently. It keeps its front seven whole and pulls a **safety** for the slot corner instead, so it stays at four defensive backs and both inside linebackers are still out there; only on a genuine passing down (dime) does one of them finally come off. That's why a 3-4 team needs two starting-quality inside backers, and why a scheme asks you to carry 12–13 defenders to fill 11 slots.
:::

Extra bodies do real work: a second tight end or second back adds run blocking, while spreading the field for a fourth receiver costs you some. And the eleven on the snap are the eleven whose ratings decide the play — as starters tire they rotate out, and while a backup is out there the unit really is as good as that backup. See the [roster](#roster-management) page for depth charts and rotation.

## Watching a game

You can **sim the week** — the slate fills in score by score — or **watch your game** unfold play by play.

If you watch, you get the field with the ball spot and down-and-distance markers, the score and clock, and three live tabs: a scrolling play-by-play **log** (each play with the players involved and the result), a **team** box score comparing both clubs, and a **player** box score grouped by passing, rushing, receiving, defense, kicking and punting.

:::screenshot Watching a game
image: live-game.jpg
:::

You control the *pace*, not the *team*: pause and resume, slow the sim down or speed it up across **1× / 2× / 4× / 8×**, or hit **SIM TO END** and jump to the final. You never move a player. The game was decided the moment it was simulated; watching it is watching that decision play out.

The version where you call every offensive and defensive play yourself is a planned future layer — you'd still never steer individual players, only choose the calls. On-field animated visualization is further out; see [the film room](#playlab).

:::note One simulation, replayed exactly
Every game is decided once, from a seed tied to your league. Re-watch a game and it replays the **exact same events** — same throws, same injuries, same final score. Nothing is re-rolled on a second viewing, and reloading a save drops you back into the same league you left. The randomness is real, but it's fixed the moment it happens.
:::

## Playoffs, awards, and the next year

When the last regular-season week resolves, the standings lock and the league advances into a **14-team bracket** — seven seeds per conference, four division winners plus three wild cards. The top seed in each conference sits out the Wild Card round; every round after re-seeds, so the best remaining team always hosts the worst. Wild Card, Divisional, Conference, championship: one round per week, same watch-or-sim choice, same report. Postseason games can't end tied.

Then the year closes with a bookend loop:

- **Awards.** MVP, Offensive and Defensive Player of the Year, **Offensive and Defensive** Rookie of the Year, Best Kicker, Best Punter, Coach of the Year, and All-Pro first and second teams.
- **Hall of Fame & retirements.** Veterans retire by age and decline; Hall inductions are voted in, and your retirees are called out first.
- **Progression & regression.** Every player ages along his development curve — young players grow, veterans fade. See the [Development](#development) page.
- **Your GM career.** The season is appended to your record, achievements are checked, and your reputation updates.
- **Stay or move.** You're offered a handful of teams — about six, usually lower-ranked clubs — and you may **take over one** or **stay**. Choosing a new team simply moves you into that franchise; the league keeps rolling.

From there the calendar ticks over, a fresh draft class is minted, and you roll into the next offseason — starting again with contract aging.

## Deterministic, but alive

Hold two ideas at once. The league is **deterministic** — one seeded simulation, reproducible to the play. And it is **alive**: 31 AI franchises act in every phase you act in, hiring coaches, bidding in free agency, drafting, trading, cutting, and winning or losing their own games. You manage one team inside a whole league managing itself right alongside you.
