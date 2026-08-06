---
id: stat-glossary
title: Stat Glossary
nav: 7
section: Players
status: live
icon: 🧾
tagline: >
  Every column on a player's stat table and on the league leaderboards, in plain English — including what a snap share is actually a share of
related:
  - ratings
sources:
  - app/lib/data/stat_columns.dart
  - app/lib/data/stat_key.dart
  - app/lib/screens/player_detail_screen.dart
  - app/lib/screens/league_stats_tabs.dart
---

## Reading a stat table

Two places in the game carry a key of their own: a **player's card** and the league **player** leaderboards each have an ⓘ beside the table header, and it opens the key for **exactly the columns in front of you** — the quarterback key on a quarterback, the punting key on a punter, the leaderboard key for whichever board you are looking at. Everywhere else the columns stand unlabelled: the team stats tab, the league team board, a live or finished box score, and a retired player's career table have no key attached. This page is the whole key, written out once so it covers all of them.

The one habit worth forming: a header code means different things at different positions. `YDS` is passing yards on a quarterback's card, rushing yards on a running back's, receiving yards on a receiver's, and gross punt yards on a punter's. `TD`, `AVG`, `LNG` and `INT` are the same story. Read every column in the company of the position that produced it — which is why the tables below are grouped by position family rather than alphabetically.

Ratings are a different measurement entirely: a rating is what a player *can* do, a stat is what he *did*. For the rating side of the house, see [Player Stats & Ratings](#ratings).

:::screenshot The STATS tab on a player card
image: player-stats.jpg
:::

## Snaps, games, and what the percentages divide by

Three usage columns travel with almost every table in the game.

| Column | What it means |
|---|---|
| `GP` | Games he appeared in — any game where he logged a snap or a stat |
| `SNAP` | Offensive or defensive snaps he was on the field for |
| `SNAP%` | The share of his team's snaps on his side of the ball that he played |

`SNAP%` is the one that is easy to misread, so read it slowly. It is a share of his **unit's** snaps — every offensive snap the team took if he plays offense, every defensive snap if he plays defense. It is never a share of the team's total plays, and it is never a share of some league average.

:::warn What the snap share divides by
On a season row, a career row, and on the league leaderboard, the denominator is the **team's snap total for the whole season** — not just the games the player dressed for. So a backup who played one game reads as a small sliver of the season, which is the honest answer, rather than a big share of the single game he happened to appear in. Only the per-game rows on a player's card divide by that one game's snap count.
:::

Two consequences worth knowing. A player traded mid-season is measured against each club only for the weeks he was actually there — his old team's remaining games are not held against him, and neither are his new team's earlier ones — so a move neither inflates nor deflates the number. And when the game cannot reconstruct a true team snap total for some season — an old save, a season recorded before the totals were kept — the share reads as a dash rather than a guess, and a career share is only shown when *every* season feeding it has a real denominator.

Only offensive and defensive snaps are counted. Kicking and punting happen on special teams and nowhere else, so a kicker or punter carries no snap columns at all — his usage is told by his own volume columns instead (`FGA`, `PUNT`), next to a `GP` count of the games he appeared in. Returners are different: the man fielding a kick is normally a running back or receiver, so his snap columns are real and describe his day job on offence, not his return work.

A week he *missed* is not a blank row. His season table lists it with the reason in place of the stats — `BYE`, `OUT` for an injury, `IR`, or `SUSP` — so a thin stat line and an absent player never look the same. Where those reasons come from is on [Morale, Health & Your Roster](#roster-management).

**Which games are counted** depends on the surface. A league leaderboard ranks the **regular season only** — playoff games are left out of it entirely. A player's own card is the opposite: his season table lists every game he played including the playoff weeks, and its `TOTAL` row adds them all up. His career table keeps the postseason on its own separate `POST` line, so a career regular-season total stays a regular-season total. When a leaderboard number and a player card disagree by a few games in January, this is why — see [How a Season Works](#season-flow) for the phase calendar itself.

## Quarterbacks

| Column | What it means |
|---|---|
| `FNTPTS` | Fantasy points from his passing and rushing line |
| `RAT` | Passer rating from completions, yards, touchdowns and interceptions |
| `CMP` | Completed passes |
| `ATT` | Pass attempts |
| `YDS` | Passing yards |
| `TD` | Touchdown passes |
| `INT` | Interceptions he threw |
| `RUYD` | His own rushing yards |
| `RUTD` | His own rushing touchdowns |

## Running backs

| Column | What it means |
|---|---|
| `FNTPTS` | Fantasy points from his rushing and receiving line |
| `CAR` | Rushing attempts |
| `YDS` | Rushing yards |
| `AVG` | Rushing yards per carry |
| `TD` | Rushing touchdowns |
| `REC` | Catches |
| `RECYD` | Receiving yards |
| `RECTD` | Receiving touchdowns |
| `CAR%` | His share of the team's rushing attempts |
| `TCH%` | His share of the team's carries plus catches |

`CAR%` and `TCH%` are the workload columns. A committee back and a bell cow can post similar yardage; the share columns are what tell them apart.

## Receivers and tight ends

| Column | What it means |
|---|---|
| `FNTPTS` | Fantasy points from his receiving and rushing line |
| `TGT` | Passes thrown his way |
| `REC` | Catches |
| `YDS` | Receiving yards |
| `AVG` | Receiving yards per catch |
| `TD` | Receiving touchdowns |
| `TGT%` | His share of the team's pass attempts |

## Offensive line

Linemen are graded on the two jobs they actually do, and each job carries its own snap count so the rates mean something.

| Column | What it means |
|---|---|
| `PBSNP` | Snaps he spent pass blocking |
| `PRSA` | Pressures he allowed |
| `QBHA` | Quarterback hits he allowed |
| `SKA` | Sacks he allowed |
| `PEN` | Blocking penalties charged to him |
| `PR%` | Pressures allowed per pass-block snap — lower is better |
| `RBSNP` | Snaps he spent run blocking |
| `RBW` | Run blocks he won |
| `STFA` | Runs stuffed at his gap |
| `RBW%` | Run blocks won per run-block snap — higher is better |

:::note The two rates point in opposite directions
`PR%` is a bad-things-allowed rate, so low is good. `RBW%` is a good-things-won rate, so high is good. A tackle with a low `PR%` and a low `RBW%` is a pass-protection specialist you should not be running behind.
:::

## Defense

Every defensive player carries the same tackle-and-turnover line, so a safety and an interior lineman can be compared on it directly. It is not the whole row, though: everyone the defense asks to cover carries a coverage block in front of it as well — see [the coverage ledger](#stat-glossary--the-coverage-ledger) below.

| Column | What it means |
|---|---|
| `FNTPTS` | Fantasy points from his defensive line |
| `TKL` | Solo tackles |
| `AST` | Assisted tackles |
| `TFL` | Tackles made behind the line of scrimmage |
| `SACK` | Sacks |
| `INT` | Passes he intercepted |
| `FF` | Fumbles he forced |
| `FR` | Fumbles he recovered |
| `PD` | Passes he broke up |

## The coverage ledger

Anyone the defense can put in coverage — corners, safeties, linebackers and edge rushers — carries a second block charting what happened on throws into his coverage. On his player card it **leads** the row, sitting ahead of the tackle line, because for a corner it is the job. Interior linemen and base ends carry none of it: nobody asks a nose tackle to cover anybody, so those columns simply aren't on his card.

| Column | What it means |
|---|---|
| `Y/TGT` | Yards given up per pass into his coverage — lower is better |
| `TGT` | Passes thrown at the receiver he was closest in coverage to |
| `CMP%` | Share of those throws that were caught — lower is better |
| `YDS` | Yards given up on throws into his coverage, catch and run together |
| `TD` | Touchdowns scored on throws into his coverage |

:::warn Read the rate against the volume
A shutdown corner is *avoided*: quarterbacks stop throwing at him, so his `TGT` collapses and every remaining throw is a desperate one. Judge him on the pair, never on the rate alone — and note the rate cells stay blank until he has faced enough throws to mean anything, so they are empty on every single-game row and fill in on the season total.

One honest limit: in a zone call the yards belong partly to the unit, not solely to the man charted nearest the ball, and break-ups and interceptions are credited from a separate read — so a card can legitimately show more `PD` than `TGT`.
:::

## Kickers

| Column | What it means |
|---|---|
| `FGM` | Field goals made |
| `FGA` | Field goals attempted |
| `FG%` | Field goals made per attempt — extra points are not counted |
| `LNG` | His longest made field goal, in yards |
| `XPM` | Extra points made |
| `XPA` | Extra points attempted |
| `KPTS` | Kicking points: three per field goal plus one per extra point |

`FG%` is field goals only. Extra points live in `XPM` and `XPA` and never flatter the percentage, which is the difference between a kicker who is good and a kicker who has been asked for a lot of chip shots.

## Punters

| Column | What it means |
|---|---|
| `PUNT` | Punts |
| `YDS` | Gross punt yards |
| `AVG` | Gross yards per punt |
| `NET` | Net yards per punt after the return, touchbacks spotted at the 20 |
| `I20` | Punts downed inside the opponent's 20 |
| `TB` | Punts that went for a touchback |
| `LNG` | His longest punt, in yards |
| `BLK` | Punts blocked |

`NET` is the column that decides a punter. A big `AVG` with a mediocre `NET` means he is out-kicking his coverage or booming the ball through the end zone; `I20` against `TB` shows you which.

:::note Blocked punts {in-dev}
`BLK` is on the table so the punting line is complete, but games do not currently produce blocked punts — it reads `0` for everybody.
:::

## Returns

The league's return board folds kick returns and punt returns into a single line, then splits the averages back out.

| Column | What it means |
|---|---|
| `RET` | Kick and punt returns |
| `YDS` | Kick and punt return yards |
| `AVG` | Yards per return, kicks and punts together |
| `LNG` | His longest return, kick or punt, in yards |
| `TD` | Return touchdowns |
| `KRAVG` | Yards per kick return |
| `PRAVG` | Yards per punt return |

## Columns only the league boards use

The leaderboards mix positions on one table, so a few headers are disambiguated there that a single player's card never has to be.

| Column | What it means |
|---|---|
| `FNTPT` | Fantasy points from his offensive or defensive line, rounded |
| `CMP/ATT` | Completed passes out of pass attempts |
| `PAYD` · `PaTD` | Passing yards · touchdown passes |
| `RUYD` · `RuTD` | Rushing yards · rushing touchdowns |
| `RECYD` · `RecTD` | Receiving yards · receiving touchdowns |
| `ATT` | Rushing attempts (on a rushing board, not pass attempts) |
| `YPC` | Receiving yards per catch |
| `TD` | On the all-offense board: touchdowns thrown, run and caught, combined |

Every board is filtered from the side you're on: `ALL` · `QB` · `RB` · `WR` · `TE` · `OL` on offense, `ALL` · `DL` · `LB` · `DB` on defense, `ALL` · `K` · `P` · `RET` on special teams. The `ALL` board is deliberately narrow — a handful of columns that mean something for every position — because widening it to every position's stats would render mostly dashes. Pick a position filter and you get that group's real column set instead.

Two of those boards rank on a **rate** rather than a total, because the counting stat would reward the wrong man:

- The `OL` board sorts by fewest pressures allowed per pass-block snap. A raw sack-allowed count just punishes whoever plays the most, so only full-time linemen are ranked at all — a man needs at least 80% of the busiest lineman's pass-block snaps. Everyone else is listed underneath them.
- The `DB` board sorts by yards allowed per target, with the rest of the [coverage ledger](#stat-glossary--the-coverage-ledger) behind it. The `LB` board carries the same coverage columns but ranks on the tackle line, because that is the larger part of the job.

Watch which board a defender lands on, because it follows the job rather than the label: `DL` is interior linemen and base ends and ranks on sacks, while an **edge rusher is ranked on the `LB` board**, alongside the off-ball linebackers he shares a coverage ledger with.
