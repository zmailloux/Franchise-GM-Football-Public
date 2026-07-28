---
id: playlab
title: The Film Room (Playlab)
nav: 15
section: On the field
status: in-dev
icon: 🎬
tagline: >
  The Phase-2 dream — watching all 22 players move on the field, where the film draws the result but never changes it
related:
  - schemes
  - season-flow
sources:
  - playlab/README.md
  - docs/overview/engine-and-choreographer.md
  - DESIGN.md#L
  - docs/playlab-filmplan-v2.md
  - playlab/TASKS.md
---

## The one page that isn't finished yet {in-dev}

Everything else in this guide describes a game you can play today. This page is
different: it's the on-field future we're building, and it isn't in the shipping
game yet. Read it as a promise, not a feature list.

Right now, when you watch a game, you experience it as a live feed of events — a
stat viewer ticking through completions, sacks, and touchdowns while you control
the sim speed. That experience is real and it's live; it's covered under
[the season and game flow](#season-flow). The Film Room adds a whole new layer on
top of it: a top-down field where all 22 players actually move — the receiver
running his route, the corner trailing him, the pocket collapsing, the back
finding the hole. It exists today as a working lab you can't reach from the
shipping game.

The single most important thing to understand about the Film Room is *how* it
relates to the game you already play. It does not re-decide anything. The result
comes first, from the same engine that runs every other game in the league. Then
the film is drawn to match it.

## The result comes first, then the film draws it

Think of it as two jobs done in order, never mixed:

1. **The engine decides.** The same play resolver that simulates all 272 games a
   season — the one that turns [ratings](#ratings) into contests — produces the
   outcome: run or pass, who caught it, how many yards, whether it was a sack or a
   pick, the whole box score. This is the source of truth, and it's exactly what
   already happens today when you watch the stat feed.
2. **The film choreographs.** Given that finished outcome, the visualization layer
   arranges 22 players moving on the field so that what you watch *lands on* the
   result the engine already decided. An 18-yard completion gets a believable
   route-and-catch that adds up to 18. A sack gets a rusher arriving free before
   the throw.

This ordering is deliberate and load-bearing. Because the picture is drawn
*after* the decision, nothing you see on the field can ever change a number.
Improving the animation, adding better routes, making the defense look sharper —
none of it can move a stat line or tip the league's balance. The film is
downstream of the truth, always.

:::note The film never lies about the result
The Film Room is fully deterministic. A watched play is drawn from the finished
outcome plus a fixed seed, and every frame of movement is saved alongside the
result. When you re-watch a play, the game replays those saved frames — it never
re-simulates. So the same catch happens the same way every time, and the picture
can never drift out of sync with the box score. What you see is always a faithful
drawing of what the engine actually decided.
:::

One honest caveat comes with this design: because the engine decides the *result*
but not the exact play concept, the film shows *a* believable version of the play,
not *the* one true play that "really" happened — there was never one true play to
begin with. An 18-yard gain might be drawn as a dig route one time and a crossing
route another, both landing on 18. For a GM game, that's the right trade: your
league stays perfectly balanced, and you still get something real to watch.

That freedom is used deliberately. For every play the lab drafts several
candidate takes, scores each one for believability — penalising a defender
chasing the wrong way, a ball carrier who stalls, bodies sliding through each
other, players standing dead — and shows you the best of them. Anything that
fails a hard check (a player asked to reach a spot faster than his legs allow, a
step out of bounds, a beat out of order) is thrown away rather than shown. In the
lab there's a "new take" button that re-dramatizes the same result a different
way; the box score never budges.

## What the film shows

The visualization is built from the roles the engine already tracks — it knows the
passer, the target, the ball carrier, who got the sack, who made the tackle, how
the yards split between the throw and the run after the catch, how long the pocket
held, and which eleven each side had on the field. Your [scheme](#schemes) shows
up in all of it. From those facts the film stages the full picture:

| On the field | What you'll watch |
|---|---|
| **Personnel** | The exact eleven the engine graded, in the grouping and package it fielded — so a nickel look really has five defensive backs and a 3-4 really shows both inside backers |
| **Pre-snap** | Both units align, the defense can disguise its intent, and a receiver may motion across with his man defender travelling with him |
| **Routes** | Receivers run real concepts — slants, posts, corners, digs, drags, comebacks — chosen and shaped to fit the completion the engine decided |
| **Coverage** | Man defenders jam, mirror, react to the break and trail; zone defenders claim their landmarks and hand receivers off between them, with the shell picked from the situation |
| **Pass rush** | The line pairs off, the pocket sinks and collapses at a pace set by the quality of the protection, and blitzes arrive as recognizable patterns — a mugged A-gap, an edge fire, a show-and-bail |
| **Runs** | Named concepts, not generic handoffs: inside zone, duo, split zone, draw, power, counter, iso, trap, wide zone, pin-and-pull, toss and crack toss, each with its own blocking picture |
| **Pursuit & tackling** | Unblocked defenders and the secondary chase on cut-off angles, converge on the ball carrier, and finish |
| **Turnovers** | Interceptions and fumble recoveries get their return — including the ones that go the distance |
| **Special teams** | Kickoffs, punts and field goals resolve and report today; their full-motion choreography — gunners racing down, the return man fielding it — is the piece of the film still being drawn {in-dev} |

Every one of those movements is a player steered by his own [ratings](#ratings) —
speed sets his top gear, burst his acceleration, agility his cuts — so a faster,
more explosive player visibly plays like one. Timing is held to real football, too:
the ball comes out and the pocket breaks on the clock the real league runs on, and
every test film is graded against those windows.

Two rules keep the picture honest. Anything the engine actually credited — the
catch point at the credited air yards, the spot where the tackle happened — is
locked and can never be nudged to make the animation easier. And nobody is asked
to cover ground he physically can't: no teleporting to the ball, no catch-and-freeze.

## The longer vision — calling your own plays {in-dev}

The Film Room is the first step toward the biggest feature on the horizon: a mode
where *you* call the plays.

Today your strategic input is the weekly
[gameplan](#season-flow--playing-the-regular-season) — a tilt across the whole
game — and the individual play calls are made for you, hidden. The next stage
lets you choose the offensive and defensive call before each snap. Crucially,
you'd still never control individual players with a joystick; you're the coach
making the call, not the athlete making the move. Your play call becomes one more
input the engine weighs, riding the same tested machinery your gameplan already
uses, so it shifts your odds without ever breaking balance.

Beyond that sits the play designer — authoring your own formations and routes,
building a personal playbook, and having the sim genuinely respect what you drew.
That's the largest single piece of work in the whole project, and it's sequenced
last, on purpose, after everything underneath it is proven.

## Where development actually stands

Here's the honest state of things. The core idea has moved from concept to a
working lab, but it is not in the shipping game and there's real work left.

**What already works.** The engine-decides-then-film-draws pipeline runs end to
end: simulate a real game, watch any play in the play-by-play list as 22 moving
players, with the movement guaranteed to land on the box score. Every scrimmage snap
films — dropback passes, play-action, screens, run-pass options, the full run
concept vocabulary, turnover returns — with special teams the one family still
getting its full motion. Man and
zone coverage are both built, including pattern-matching rules and pre-snap
motion. A standing guard checks continuously that none of it can move a balance
number, and a large library of frozen test plays is re-graded on every change so
a fix in one place can't quietly make another play worse.

**What remains.** The path forward was just settled: rather than keep patching the
lab's aging drawing machinery, the visualization engine is being **rebuilt from the
ground up** — keeping the validated motion model (players accelerate, cut and chase
like real athletes) while replacing the tangle underneath with a clean pipeline
designed to run on your phone. Individual concepts still get tuned play by play
against film review, and the finished engine still has to be wired into the game
you play before this becomes a feature rather than a promise. None of that changes
what this page says — it's all downstream work on the drawing, never on the
decision.

:::tip The short version
The engine already decides everything, exactly as it does in every game you play
today. The Film Room's only job is to *show* you those decisions as 22 players
moving on a field — faithfully, deterministically, and without ever touching the
result. When it ships, watching a game gets a body; the brain is already here.
:::
