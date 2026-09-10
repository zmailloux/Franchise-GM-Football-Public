---
id: scouting
title: Scouting
nav: 13
section: Building the roster
status: live
icon: 🔍
tagline: >
  How you learn what a draft prospect really is — always through the fog of your scouts
related:
  - draft
  - development
sources:
  - DESIGN.md#O
  - docs/overview/dormant-features.md
  - sim/lib/src/models/settings.dart
---

## The scouts' desk

Every prospect who will ever enter your draft has a **true ceiling** and a **true current ability** baked in
the moment his class is generated. You never see those numbers. What you see is your scouting department's
best guess — and how good that guess is depends entirely on who you hire.

Your scouts live in the Front Office, under FRANCHISE ▸ OFFICE ▸ **SCOUTS & MEDICAL**, which carries three
views: **STAFF**, **DRAFT POOL** and **DRAFT CLASSES**. Two star ratings on your lead scouts drive
everything on the two draft views:

- **Evaluation** — overall accuracy. How closely your projections track the truth, across every prospect.
- **Star Spotter** — ceiling accuracy. How reliably your department separates a real blue-chipper from a
  merely good player, and catches a hidden gem before the rest of the league does.

A department strong on Evaluation but weak on Star Spotter will place most players about right, yet keep
mistaking future stars for role players (and role players for future stars). That distinction is the whole
reason both ratings exist.

## Reading a class through the fog

The **DRAFT CLASSES** view is your bird's-eye view. Each of the **next three draft classes** gets its own
card, and the card answers the three questions you actually ask about a class before it arrives:

- **How good is the top?** A headline count of the prospects your department projects into the top
  potential tiers, over the number of players eligible that year.
- **What shape is it?** The class drawn as one stacked bar, a band per projected-potential tier, each with
  its count and its share. Tap a band and you land on those prospects in the draft pool.
- **Where is it deep?** A **WHERE THE CLASS IS DEEP** list, ranking every position group by how many
  prospects it holds that project as worth a real pick. This is how you spot that "two years out is a
  loaded receiver year" or "there's no franchise quarterback until the class after next" — before anyone
  else is talking about it.

A fourth reading sits in the card's corner: a **confidence read** — **SHARP READ**, **EARLY READ** or
**DISTANT READ**, with bars to match — telling you how much of the card to believe from this far out. It
matters because the card for a class three drafts away is drawn in exactly the same ink as next April's,
and it has nowhere near the same right to your trust.

Filter by position and the tier bar re-measures for that group. The depth list always ranks across the
whole class, filter or not — "where is this class deep" is a cross-position question by definition.

Here is the part to internalize: **every number on that card is your scouts' projection, not the truth.**
Two GMs with different scouting staffs looking at the same league see *different* cards. They are rebuilt
from your department's read each time you check, never from the hidden reality underneath.

:::note What your scouts show you
Every projection you read is the league's consensus view of a prospect plus your own department's
miss. The *size* of that miss is what your scouts control: better scouts miss by less. It also
shrinks as a class gets closer to draft day. And because present-day ability is observable,
**current** grades are far more trustworthy than ceiling grades.
:::

## The fog narrows over time

A class three years out is blurry. A class one year out is nearly in focus. The further from draft day a
prospect is, the wider the error on his projection — but the bar is never hidden from you, just noisier.
Watch the same class across seasons and you'll see it **firm up year over year** as the noise drains out.

A strong Evaluation rating flattens that curve: good scouts see further with confidence, so their far-out picture is
already usable while a weaker department is still guessing. Here's how each lever tightens the picture:

| What sharpens the read | Effect |
|---|---|
| Higher **Evaluation** | Tighter error on every prospect, every bucket |
| Higher **Star Spotter** | Reliable top two buckets — fewer buried gems, fewer false blue-chips |
| A prospect's class getting closer | Error shrinks each season toward draft day |
| A scout's **position specialty** | Sharper read on that one position group |
| A scout's **type** | Tilts the scout toward one half of the job — see below |
| The **Scout Accuracy** difficulty setting | A global dial on how much fog the whole league plays under |

### Scout types are a trade, never a bonus

Every scout carries a **type**, and it decides which half of the job the scout is better at. None of them is
the good one. A type **tilts those ratings**, so compare types between scouts of similar quality — it will
never make a weak scout sharp:

| Type | What the type is better at | What it costs |
|---|---|---|
| **Current Evaluator** | Reading what a prospect already is — the tightest grades of the three | Hidden upside: the riser nobody else sees gets past them too |
| **Diamond Spotter** | Finding the sleeper the rest of the league missed | Precision on the here and now — that read of today is the loosest of the three |
| **Balanced** | Neither half is a hole | No edge either: a specialist wins the half that specialist owns |

So the type is a question about how you draft, not a rating to shop for. If you trade back and bet on
development, a Diamond Spotter earns their keep; if you draft to start rookies immediately, the Current
Evaluator's tighter grades are worth more.

Hiring or firing a scout re-rolls your whole department's read — the bars visibly move the next time you open
the screen. Scouts are hired in the same offseason market as your coaches; see
[Coaches, Scouts & the Organization](#staff).

## Two stars, one board

On a prospect's page the read splits in two, and the split matters:

- **Projected stars** — his *ceiling*, the fogged number above. This is where a bad department burns you.
- **Current stars** — his *draft-day ability*. Present ability is observable, so this read is only lightly
  fogged and rarely far wrong.

What your scouts **cannot** move is the board itself. A prospect's ranking among his classmates, and the
projected-pick tier that ranking maps to (`Top 5`, `Mid 1st`, `Day 2`, `UDFA` and so on), come from the
league's public consensus — the same order every GM sees. Scout quality expresses itself purely through how
trustworthy your stars are, never through a re-sorted board. And the raw ceiling *number* is never surfaced
before you make the pick. See [Player Stats & Ratings](#ratings) for what those underlying numbers mean once he's yours.

:::example What a fogged read feels like
Take a prospect with a genuinely first-round ceiling. A sharp department usually shows him in the right
star bucket, and the whole class firms up early. A weak department can read the same player a full bucket
high or low — he looks like a Day-2 flier to you while a rival's scouts see the blue-chip — and you only
find out who was right three seasons later. Neither read is a lie; they're guesses of different quality,
and the quality is what you hired.
:::

:::screenshot A prospect's page: what your scouts will tell you
image: prospect-card.jpg
:::

## College tape, the combine, and character

Each prospect comes with generated history you can dig into from his page, so scouting is never just one
number:

- **College production** — a simulated season stat line for his position, plus an injury history (how often,
  how many games missed). Offensive linemen get pass-block snaps, pressures allowed, pressure rate, and sacks
  allowed; lower pressure rate is better. Because output carries its own noise, a great prospect can post a
  quiet year and a sleeper can put up big numbers — the tape is a *clue*, not a verdict.
- **Combine** — an **ATHL SCORE** from 0 to 10 built from the six drills (40-yard dash, 3-cone, shuttle,
  bench press, vertical, broad jump), each ranked against the prospects you can see at his position. Height
  and weight describe his frame but do not help or hurt that score. The workout correlates with a player's
  physical traits but is a *separate signal* from your scouts' grades, so fast numbers can flatter a raw
  player and vice versa. Weighing tape against combine against scout grade is the craft.
- **Skills grades** — his attributes shown as letter grades (`A+` down to `F`) on colored chips. A few chips
  read blank when your staff hasn't uncovered that trait yet (things like injury-proneness stay hidden until
  revealed).
- **Character and intelligence** — his **character** (greed, loyalty, ambition) and **intelligence**
  (personality, football IQ, work ethic) as `HIGH / MED / LOW` chips, plus his real college GPA.

That last read costs you nothing. **Character and intelligence are simply on the page for every prospect,
all the time** — there is no interview to schedule, no budget to spend and no card to unlock. What you read
there is exactly how that player will behave as a pro: his character on draft day and his conduct on your
roster are the same underlying person, and that conduct is real — see
[Morale, Health & Your Roster](#roster-management--what-your-players-want).

## Busts and steals

Under your scouts' private read sits a second, league-wide layer: **consensus**. Occasionally a prospect is
collectively **over-hyped** — the whole league grades him high, drafts him early, and he develops only to his
true (lower) ceiling. That's a bust. Occasionally one is **under-rated** — he slides down the board, then
breaks out. That's a steal.

This is the crucial bit: busts and steals come from the *consensus miss*, not from your scouts' fog. Every
perception path in the game — your read, the public grade, the board order, the AI's board — is centered on
consensus rather than truth, so busts and steals exist **even if you turned every fog setting off**. What a
strong **Star Spotter** buys you is a *chance* to catch the miss before the pick. That catch is capped on
purpose: even a near-perfect Star Spotter still whiffs a meaningful share of the time at the extremes.
There is no such thing as a sure thing at the top of a draft.

:::warn A great scout is an edge, not a crystal ball
The best scouting department in the league still drafts busts and still lets steals slip. It just does both
less often than a weak one. Trust your process over any single projection — the fog is the point.
:::

## The fog-of-war settings

Settings ▸ FOG OF WAR holds three switches, and all of them stay editable for the life of a save.

**Scout potential fog** is the one that ships **on** {live} — it's the fog this whole page describes, and it
also makes the AI clubs draft on their own imperfect reads, which is where gems slip. Turn it off and you
see true potential and the AI drafts on true value; the draft gets legible and considerably easier.

The other two are built but ship **off** {built-off} — opt in for a harder, more uncertain game:

- **AI character fog** — AI clubs only know the character of the prospects they targeted, and draft the
  rest blind to it. It changes how they build, not what you are shown: your own cards always read as
  though you had already sat down with the man.
- **Mood on field** — lets a player's mood tilt his on-field performance ([more on mood](#roster-management--what-your-players-want)).

A second fog lives one section up, under GAMEPLAY SETTINGS, and it ships **on** {live}. **Rookie ratings**
hides a first-year player's overall: he reads `??` instead of a number until he has been evaluated —
roughly 250 snaps at medium scout accuracy, or the end of his first season, whichever comes first. His card
shows how far he has got. This is not a rule about your own club — an opponent's rookies are hidden from
you too — but the clock is not quite the same, and what sets it is **who drafted him**, not who holds him
now. A rookie you drafted carries your own scouts' work on him, training camp included, and keeps it even
if you trade him away. A rookie who was never yours is read cold: you do not attend their camp, so he
clears on playing time alone. A kicker or punter is counted in games, since he never takes a snap from
scrimmage. Turn the switch off and every rookie in the league reads plain.

There is also an everyday snaps fog for your own roster — a veteran you have not seen play for you reads a
band that tightens as he takes snaps — but it has no switch in this build and stays **off** {built-off}.

Two related dials sit beside the rookie switch under GAMEPLAY SETTINGS. **Scout accuracy** (high / medium
/ low) is the global fog dial named in the table above — your difficulty seeds it, sharp on Easy and
blurry on Hard, and you can move it any time. **Drafted player ratings** decides whether the draft recap
shows every pick's true overall, yours and the AI's alike; it starts hidden on Hard and visible on the
easier modes.

Once you've made your picks, see [The Draft](#draft) for how draft day and class shape work, and
[Player Growth & Aging](#development) for how a raw prospect grows into — or falls short of — the ceiling you scouted.
