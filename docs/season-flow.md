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
  - DESIGN.md#K
  - DESIGN.md#V
  - DESIGN.md#R
  - sim/lib/src/season/schedule.dart
  - sim/lib/src/season/playoffs.dart
  - sim/lib/src/sim/personnel.dart
  - sim/lib/src/game/fatigue.dart
  - sim/balance/game_flow.yaml
---

## Welcome, GM

*CapForge: Football GM* is a single-player football GM game. You run one franchise — roster, salary cap, draft, trades, coaching staff, season — against 31 computer-run teams. You're the general manager, not a player and not the head coach on the field: you build the team, set the plan, and watch what your decisions produce.

Everything runs on your device — no server, no online league. A brand-new game loads a real-shaped league of 3,158 players plus coaches and scouts, and hands you the keys to one of its 32 clubs. From there time only moves when you move it, and every step reports back what happened.

## Making the league your own

Settings ▸ **EDIT TEAMS** lets you rename any club, its city and its stadium, rename the two conferences,
and set every club's three colours with a hex picker. The editor previews what you are making as you make
it — the club header, the in-game broadcast bar, the field and a three-pose uniform, all tinted live.

Names and colours are the only things that change. You cannot move a club: divisions and conferences keep
their members, and realignment is not on the table. And a rename moves **no** simulated result, past or
future — the game holds itself to that with a test that renames every club and both conferences and
requires the season and the playoff bracket to come out byte for byte identical. Rename freely; a series
that was BAD BLOOD under the old name is BAD BLOOD under the new one ([Rivalries](#rivalries)).

## The year at a glance

A league year runs the same ordered loop every season. You advance it phase by phase; the other 31 teams run the same steps in the background at the same time.

| Stage | Phases in order | What it settles |
|---|---|---|
| Offseason | Contract aging → staff hiring → re-signings → cuts → free agency (3 waves) → a pre-draft trade window → the draft → the post-draft tail → **training camp** → start the season | Who's on the team, and who's paid |
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
- **The post-draft tail.** The undrafted pool clears, the rival clubs short of bodies fill out their rosters, the league's spending floor is applied to the AI teams, and next year's pick ledger rolls forward. **Your own roster is deliberately left alone here** — those open slots are yours to fill at camp.
- **Training camp.** The last stop before week 1, and a real one: the offseason waits on you. Sign undrafted rookies off their own board (every rookie the seven rounds passed on, at the league minimum), settle your practice squad, cut, and trade. Nothing costs dead cap yet — once week 1 kicks off, a cut does. You leave camp by starting the season, which is gated on the same legality check below.
- **Preseason games.** Three exhibition games are built into the calendar but are **switched off**, and there is no setting to turn them on. Camp is the last thing between you and week 1.

:::warn Get legal before week 1
Right before the season opens, your team must be **compliant**: an active roster of **53 or fewer** (and at least **44**), no more than **16** on the [practice squad](#roster-management), and total salary under the cap. Outside any of those lines and you can't kick off until you fix it — release players, restructure a contract to lower this year's hit, or make a [trade](#trades). The AI teams resolve it automatically; you get a blocking screen until you're legal. The same check fires before every regular-season game, so a midseason signing that busts the cap stops your next kickoff too.

Two softer signals ride along: the roster screen shows a **required-starters count per position**, derived from your scheme's actual looks, and before kickoff the game **warns you** if injuries have left a position group too thin to field its slots. Merely thin is a warning — ignore it and a backup's backup plays. A scheme-required position with **no healthy body at all** is a hard block, exactly like busting the cap.
:::

## Playing the regular season

The regular season is an 18-week calendar in which every team plays 17 games and takes exactly one bye. Weeks 1–4 and 15–18 are always full 16-game slates; the byes fall in weeks 5–14, so those weeks carry a few games fewer. The slate is also *sequenced* like a real one, not just balanced: home and road games alternate the way the league schedules them, so no club sits through a long stretch of either, and nobody opens the year with a run of games all on one side. Your core action is to **advance the week** — the whole slate simulates at once, you experience your own game, and the rest resolve in the background.

Each game week has four beats.

**1. The outlook.** The week opens on a **pre-game outlook** — a scouting read on the game you are about to play. A few sentences on what actually decides it (an edge rusher your tackles have to account for, a receiver nobody on their roster covers, a run defense that has not been moved all year) — tap **READ MORE** and it opens out into the full column, several paragraphs on both clubs. Then both clubs side by side: records, division position, team grades, and how each moves the ball and stops it — passing and rushing yards for and against, with league ranks. Below that, the men who decide it and anybody who is hurt. Player names in the read are tappable and open that man's card. In week 1 there are no season numbers yet, so the read leans on the rosters instead; the numbers appear as soon as games have been played. If you only want to simulate, **SIM WEEK** is right there — you never have to open the plan.

**2. Planning.** Before kickoff you set a gameplan against this specific opponent — five levers, each with an ⓘ that explains what it actually does: **RUN STYLE** (inside / balanced / outside), **PASSING** (safe / balanced / aggressive), **TEMPO** (slow / normal / hustle), **BLITZ** (low / medium / high) and **CUSHION** (press / balanced / soft), which is how much room your corners give. Each tilts the odds for that one game only. Above the levers sits an **OPPONENT READ**: each of their units drawn as a bar either side of the league average, green to the **WEAK** side with a hint on how to attack it, red to the **STRONG** side telling you to respect it. There's a recommended plan you can apply with one tap or override, and every AI team plans against you the same way. It's a strategic tilt, not play-by-play control.

:::screenshot The weekly gameplan, against this week's opponent
image: gameplan.jpg
:::

**3. The game.** Watch it or sim it (below).

**4. Post-game resolution.** Standings recompute across all 32 teams, injuries and suspensions are drawn, moods and holdout pressure update, the trade market moves (until the deadline closes midseason), in-season free agency fires if an injury opened a hole you can't cover, and needs and projected draft slots refresh.

It all folds into a **Weekly Report**: your result and a league scoreboard, injuries (yours first, with who replaces them and how many weeks he'll miss), incoming [trade](#trades) offers as actionable cards, suspensions, league news, and your refreshed needs plus projected draft slot. Player storylines land here too — a big game can earn a young player a growth bump, or talk a brewing holdout back down.

Your phone's inbox carries the league's own traffic alongside it, including the three **mock drafts** the League Office publishes during the year — see [The Draft](#draft--mock-drafts-during-the-season).

The results screen itself reads like a league desk rather than a fixture list. It opens with a short digest of the week's games worth knowing about, each carrying the tag it earned on the field — **UPSET**, **THRILLER**, **BLOWOUT**, **SHOOTOUT**, **ROCK FIGHT**, **DIVISION** — and the number that earned it, so you can see at a glance what actually happened around the league before you read a single score. Under the digest sits the full slate, grouped by conference, one tile per game: the two clubs stacked with the winner in full contrast, a bar showing the margin, and each club's place in its division alongside — with an arrow when the result moved it.

:::screenshot The week's results across the league
image: week-results.jpg
:::

A player can go down before a game or during one; a mid-game injury shows as a red line among that drive's plays and his backup finishes the game — next man up, straight from your depth chart.

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

You can **sim the week** — the slate fills in game by game — or **watch your game** unfold play by play.

If you watch, you get the field with the ball spot and down-and-distance markers, the score and clock, and above them a **score-flow ribbon**: the running score margin drawn against the game clock with the four quarters marked, so one look tells you whether this was a runaway or a street fight, and exactly when it turned.

Under all that sit three live tabs — four with the film switched on. **DRIVES** is the game as possessions, newest first — each drive a card showing where it started, how many plays it took, the net yards, the time it burned and how it ended. Tap one and it opens into the plays that made it up. **MATCHUP** is the game on paper: a quarter-by-quarter line score, the scoring summary, then the team-stat comparison, each category drawn as a single bar leaning out from a centre line toward whichever club is winning it and by how much. **PLAYERS** is the box score player by player — passing, rushing, receiving, defense, kicking and punting — with a strip of the game's leaders across the top.

:::screenshot Watching a game
image: live-game.jpg
:::

You control the *pace*, not the *team*. The transport is a scrub row — step back a play, play or pause, step forward a play — with the sim speed on its own stepper across **1× / 2× / 4× / 8×**, and **SIM TO END** to jump straight to the final. You never move a player. The game was decided the moment it was simulated; watching it is watching that decision play out.

**And you can watch the snap itself.** Turn on `PLAY VISUALIZATION (ALPHA)` in Settings and a **FILM** tab joins the row, with any play row in DRIVES opening the same view: that snap redrawn as 22 moving players. It is an early alpha and it says so when you switch it on. The film is drawn *from* the result and can never change it — see [the film room](#playlab).

The version where you call every offensive and defensive play yourself is a planned future layer — you'd still never steer individual players, only choose the calls.

## The endgame

A simulated game manages its own clock the way a real one does, and the difference shows up where games are won. The clock runs or stops on the play, tempo changes with the situation, and both teams spend **timeouts** rather than banking them. A **two-minute warning** stops the clock at the end of each half — and in overtime too. A team with the lead and the ball **kneels it out**; a team without it goes hurry-up, **spikes** to stop the clock, and throws a Hail Mary when the last snap is all that's left. Fourth downs are weighed against score and time, two-point tries come off a chart rather than a whim, and a team down late will try an **onside kick** — when the clock and its timeouts say a deep kick can't get the ball back in time, not merely because it's behind.

How well your team does all that is a coaching question: your head coach's **game management** scales the quality of those decisions, so a sharp staff burns fewer timeouts on nothing and reaches the right fourth-down call more often. See [Coaches, Scouts & the Organization](#staff).

Kickoffs use the modern **dynamic** rule — most kicks are returned, and a touchback comes out to the **35**.

**Overtime.** Both teams get a possession before it goes to sudden death, and a defensive touchdown or safety ends it on the spot regardless. In the regular season overtime is a single **10-minute** period with **two** timeouts a side, and if it expires with the score level **the game ends in a tie**. The postseason plays **15-minute** periods with a full three timeouts per half and keeps going until somebody wins.

:::note One simulation, replayed exactly
Every game is decided once, from a seed tied to your league. Re-watch a game and it replays the **exact same events** — same throws, same injuries, same final score. Nothing is re-rolled on a second viewing, and reloading a save drops you back into the same league you left. The randomness is real, but it's fixed the moment it happens.
:::

## Playoffs, awards, and the next year

When the last regular-season week resolves, the standings lock and the league advances into a **14-team bracket** — seven seeds per conference, four division winners plus three wild cards. The top seed in each conference sits out the Wild Card round; every round after re-seeds, so the best remaining team always hosts the worst. Wild Card, Divisional, Conference, championship: one round per week, same watch-or-sim choice, same report. The championship itself is played at a **neutral site** — no home edge for either club, the only game of the year with none — and you get the same pre-game read and set a **gameplan before every round**, exactly as you did in the regular season, against a bracket where every other club is planning too. Postseason games can't end tied.

If you miss the playoffs or get knocked out, you can still follow your rivals one week at a time. On the bracket, **SIM PLAYOFF WEEK** resolves just that round and lets you browse the results. **SIM REMAINING PLAYOFFS** takes you straight through to the champion. The choice stays available between rounds, and coming back to your save won't advance the bracket for you.

Then the year closes with a bookend loop:

- **Awards.** MVP, Offensive and Defensive Player of the Year, **Offensive and Defensive** Rookie of the Year, Best Kicker, Best Punter, Coach of the Year, and All-Pro first and second teams. Everything a player wins lands in the **trophy room** on his card — each honor a rendered piece rather than a line of text, tinted to the club he won it with.
- **Hall of Fame & retirements.** Veterans retire by age and decline; Hall inductions are voted in, and your retirees are called out first.
- **Progression & regression.** Every player ages along his development curve — young players grow, veterans fade. See the [Development](#development) page.
- **Your GM career.** The season is appended to your record, achievements are checked, and your reputation updates — see [Your GM career](#season-flow--your-gm-career).
- **Stay or move.** You're offered a handful of teams — about six, usually lower-ranked clubs — and you may **take over one** or **stay**. Choosing a new team simply moves you into that franchise; the league keeps rolling.

From there the calendar ticks over, a fresh draft class is minted, and you roll into the next offseason — starting again with contract aging.

## Your GM career

The league keeps a book on **you**, not just your current roster. The GM card on your hub opens it.

**RECORD** is the career at a glance: your lifetime win-loss, and every club you have run as a
separate **tenure** — when you arrived, when you left, and what happened in between. Each tenure
draws its seasons as a column chart with the year underneath and a reference line for a .500 year,
so a rebuild that took four seasons to turn looks like one. Titles and playoff berths are marked on
the seasons that earned them. Underneath sit the career ledgers: what your teams did on the field,
what they did in the draft, and how they ranked league-wide on each side of the ball.

**SEASON LOG** is one row per year you have worked — club, record, how far you got, and whether the
year ended with a trophy.

**ACHIEVEMENTS** is the case: badges on shelves, with a progress header and category filters. Each
badge carries the year you earned it and whether it was a single-game, single-season or whole-career
feat; tap one for exactly what it asks of you. The ones you have not earned stay visible, so the case
doubles as a list of things worth trying.

A tenure ends when you take another job. At season end you're offered a handful of clubs and may move
or stay — the old tenure closes with its record intact and a new one opens. Nothing is lost by moving;
the book is yours, not the franchise's.

## The Hall of Fame

The Hall is about a whole career: honors, production, championships and how long a player stayed at the top. Retirement is not an instant induction. Every retiree waits five seasons before his first vote, and a good player can stay on the ballot for years after that.

Your player card shows two separate climbs: the CapForge Hall of Fame and his primary club's Ring of Honor. A club honors only what a player did for that club, so a Hall of Famer is not automatically in a team's ring.

A new save being quiet for its first decade-plus is intended. Only the career you see in this save counts; a veteran's pre-save résumé is invisible. That fresh start, plus the five-season wait, means the first Hall classes take time to arrive.

## Deterministic, but alive

Hold two ideas at once. The league is **deterministic** — one seeded simulation, reproducible to the play. And it is **alive**: 31 AI franchises act in every phase you act in, hiring coaches, bidding in free agency, drafting, trading, cutting, and winning or losing their own games. You manage one team inside a whole league managing itself right alongside you.
