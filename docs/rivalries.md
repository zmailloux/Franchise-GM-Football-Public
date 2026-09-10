---
id: rivalries
title: Rivalries
nav: 2
section: Start here
status: live
icon: 🔥
tagline: >
  How the league remembers a series, the three marks a rivalry can earn, and why none of them change a result
related:
  - season-flow
sources:
  - DESIGN.md#Y
  - app/lib/data/rivalry_marks.dart
  - sim/lib/src/league/rivalry_score.dart
---

## The league keeps score

Every game two clubs play against each other goes into a shared book. The recent meetings are kept in
full — year, score, who won, whether it was a playoff game — and older ones fold into a lifetime record
that is never thrown away. Win a division game in your first season and it is still on the ledger a
decade later, part of a series that has by then grown a shape of its own.

That book is what the game reads when it decides whether to call two clubs rivals. A series with a story
gets a word; a series without one gets nothing.

You meet the word in the places that describe a single opponent: the chip beside the opponent on your
hub's NEXT GAME card, the game-day opponent strip, the pre-game write-up, and the box-score header
afterward. It also shows on the schedule and the four-week strip, and your record against every club you
have actually faced lives on the RECORD tab of your GM card — the same place your career book is kept, and
it fills in as your career does. See [Your GM career](#season-flow--your-gm-career).

## The three marks

A series is either unmarked or carries one of three words, in rising order of heat.

| Mark | What it says about the series |
|---|---|
| *(nothing)* | Most pairs. The clubs have a record, but not a rivalry |
| **HISTORY** | Enough meetings, some of them close, to be worth noticing |
| **RIVALRY** | A real series: close games, a record neither side has run away with, usually a division opponent |
| **BAD BLOOD** | The hottest series in the league. Almost always a division rival, and years in the making |

The empty row is deliberate. Most of the league has no rivalry with most of the rest of it, and the game
says nothing rather than printing NONE on every card. A missing mark is the ordinary state, not an error.

The list surfaces are stricter than the focused ones. The schedule and the four-week strip chip only
**RIVALRY** and **BAD BLOOD**. HISTORY is real, but it is common — and a mark on most of a 17-game slate
would stop meaning anything. Open the game itself and HISTORY shows.

:::example What the marks feel like over a save
Your division opponents will collect marks first, because you play each of them twice a year and the
games tend to be close. By the time a save has a few seasons on it, a club typically carries around four
opponents at RIVALRY or better, most of them inside its own division, and a BAD BLOOD series is almost
always a division one. A conference opponent you meet every few years can climb if the games keep landing
close. A club from the other conference gets no credit at all for the matchup, so it takes a genuinely
tight, even series to mark one — and it is rare.
:::

## What earns a mark

Four things heat a series up.

- **Close games.** A three-point finish counts for far more than a blowout. A series of blowouts, in either direction, is not a rivalry.
- **An even series.** The mark wants a record neither club has run away with. Dominance is not a feud.
- **Playoff meetings.** A postseason game between the two carries extra weight.
- **The division.** A division opponent heats fastest. A club in your conference counts for less. A club in the other conference gets nothing from the matchup itself, and has to earn its mark on the games alone.

Two things hold it back.

- **One game is not a series.** A pair needs several meetings in its recent window before it can be called anything. A single overtime thriller against a club you see once every four years does not mint a feud.
- **Rivalries cool.** If the two clubs stop meeting, the mark fades. The games they played are never deleted — the record is still there on the ledger — but the heat needs to be kept up.

:::note Playing a rival changes nothing on the field
A rivalry is history, not football. A marked game is simulated exactly like every other game: no rating
moves, no result is tilted, nobody's mood shifts, and a win against a rival is worth the same one game in
the standings as any other. The mark tells you what the series has been. It says nothing about what it
will be, and it puts no thumb on the scale. Read it as a story, not an edge.
:::

## A past you did not play

A brand-new save can open with a history already written for it. That happens when **GENERATE LEAGUE
HISTORY** is on when you create the league — it is on by default, and you can turn it off. With it on,
the series between every pair of clubs starts with a synthesised past, so week 1 of your first season can
already be a rivalry game rather than a first meeting between strangers.

The game is honest about which games it invented. A seeded meeting is marked as seeded, and it never
prints a scoreline for one. Where a played game on the ledger reads `2030: W 27-24`, a seeded one reads
`2030: W` — the year and the result are treated as facts of the schedule, but a fabricated score is not
something the game will show you. Once your save is running, every meeting from there on is a real one,
with its real score.

Turn the option off and the book opens blank. Every series starts from zero, and the first marks arrive
only once you have played enough games to earn them.

## What survives a rename

The series belongs to the two clubs, not to their names. Rename a club or a conference in the team editor
and every result on the ledger stays exactly where it was — past games keep their scores and their
winners, future games keep their schedule. A rivalry that was BAD BLOOD under the old name is BAD BLOOD
under the new one.
