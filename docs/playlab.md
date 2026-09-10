---
id: playlab
title: The Film Room
nav: 16
section: On the field
status: live
icon: 🎬
tagline: >
  Watch any finished play as 22 moving players — an early alpha you can turn on today, where the film draws the result but never changes it
related:
  - schemes
  - season-flow
sources:
  - docs/playviz-status.md
  - docs/overview/engine-and-choreographer.md
  - DESIGN.md#L
  - app/lib/data/playviz_prefs.dart
  - app/lib/screens/settings_screen.dart
  - app/lib/screens/ingame_screen.dart
---

## Turning it on {live}

The Film Room is a top-down field where all 22 players actually move — the
receiver running his route, the corner trailing him, the pocket collapsing, the
back finding the hole. It is **in the game today, as an early alpha**, and it is
**on unless you turn it off**.

Settings ▸ **PLAYVIZ ALPHA** holds one switch, `PLAY VISUALIZATION (ALPHA)`,
and that is where you turn it off. Know what the ALPHA in its name is doing
there: this has been in development for months and is still far from complete,
every play is built from that play's own result rather than a canned clip, and
**some actions are still drawn wrong**. An animation that looks wrong does not
mean the play's stats are wrong — the numbers were settled before anything was
drawn. Two doors into it open inside a game:

- **The FILM tab**, which joins DRIVES, MATCHUP and PLAYERS while you watch.
  It lists the plays grouped by drive, and only the ones already revealed —
  it cannot spoil a game you are still watching.
- **Tapping any play row** in the DRIVES ticker, which opens that same snap.

Either way the transport pauses first and stays paused, and you get PREV/NEXT to
walk the game a snap at a time.

## What a film looks like today {live}

Players are drawn as circles rather than bodies — the art is still being built —
and the view opens tight enough to read them. Each circle carries a number, and
a chip cycles what that number means: his **jersey number**, his **position**,
or his **OVR**. A rating you have not scouted still prints `??`, exactly as it
does everywhere else in the game; the film is not a way around the fog. The ball
is a football rather than a dot: tucked at the carrier's side, turned along its
own flight path in the air, and tumbling when it is loose.

Because the art is unfinished, treat the alpha as *what happened, sketched* —
the movement is real, the bodies are placeholders.

## The result comes first, then the film draws it

The single most important thing to understand about the Film Room is *how* it
relates to the game you already play. It does not re-decide anything. Think of
it as two jobs done in order, never mixed:

1. **The engine decides.** The same play resolver that simulates all 272 games a
   season — the one that turns [ratings](#ratings) into contests — produces the
   outcome: run or pass, who caught it, how many yards, whether it was a sack or a
   pick, the whole box score. This is the source of truth, and it is exactly what
   already happens when you watch the stat feed with the film switched off.
2. **The film choreographs.** Given that finished outcome, the visualization layer
   arranges 22 players moving on the field so that what you watch *lands on* the
   result the engine already decided. An 18-yard completion gets a believable
   route-and-catch that adds up to 18. A sack gets a rusher arriving free before
   the throw.

This ordering is deliberate and load-bearing. Because the picture is drawn
*after* the decision, nothing you see on the field can ever change a number.
Improving the animation, adding better routes, making the defense look sharper —
none of it can move a stat line or tip the league's balance. The film is
downstream of the truth, always. That is also why the alpha is safe to leave on:
the worst a wrong-looking animation can cost you is the picture.

:::note The film never lies about the result
The Film Room is fully deterministic. A watched play is drawn from the finished
outcome plus a fixed seed tied to that game and that snap, so re-opening it draws
the *identical* film again, frame for frame. Nothing is re-simulated — the box
score is already written, and the drawing is regenerated on demand rather than
stored. So the same catch happens the same way every time, and the picture can
never drift out of sync with the box score. What you see is always a faithful
drawing of what the engine actually decided.
:::

One honest caveat comes with this design: because the engine decides the *result*
but not the exact play concept, the film shows *a* believable version of the play,
not *the* one true play that "really" happened — there was never one true play to
begin with. An 18-yard gain might be drawn as a dig route one time and a crossing
route another, both landing on 18. For a GM game, that's the right trade: your
league stays perfectly balanced, and you still get something real to watch.

That freedom is used deliberately. Every candidate take is scored for
believability — penalising a defender chasing the wrong way, a ball carrier who
stalls, bodies sliding through each other, players standing dead. Anything that
fails a hard check (a player asked to reach a spot faster than his legs allow, a
step out of bounds, a beat out of order) is thrown away rather than shown.

## What the film shows

The visualization is built from the roles the engine already tracks — it knows the
passer, the target, the ball carrier, who got the sack, who made the tackle, how
the yards split between the throw and the run after the catch, how long the pocket
held, and which eleven each side had on the field. Your [scheme](#schemes) shows
up in all of it. From those facts the film stages the full picture:

| On the field | What you'll watch |
|---|---|
| **Personnel** | The exact eleven the engine graded, in the grouping and package it fielded — so a 4-3 nickel really shows five defensive backs, a 3-4 nickel really shows four, and a 3-4 really keeps both inside backers on the field |
| **Pre-snap** | Both units align, the defense can disguise its intent, and a receiver may motion across with his man defender travelling with him |
| **Routes** | Receivers run real concepts — slants, posts, corners, digs, drags, comebacks — chosen and shaped to fit the completion the engine decided |
| **Coverage** | Man defenders jam, mirror, react to the break and trail; zone defenders claim their landmarks and hand receivers off between them, with the shell picked from the situation |
| **Pass rush** | The line pairs off, the pocket sinks and collapses at a pace set by the quality of the protection, and blitzes arrive as recognizable patterns — a mugged A-gap, an edge fire, a show-and-bail |
| **Runs** | Named concepts, not generic handoffs: inside zone, duo, split zone, draw, power, counter, iso, trap, wide zone, pin-and-pull, toss and crack toss, each with its own blocking picture |
| **Pursuit & tackling** | Unblocked defenders and the secondary chase on cut-off angles, converge on the ball carrier, and finish |
| **Turnovers** | Interceptions and fumble recoveries get their return — including the ones that go the distance |
| **Special teams** | Kickoffs, punts and field goals film like everything else: the real kicking and return units take the field, the snap-hold-kick beat plays out, gunners release and the coverage streams its lanes, and the return man fields the ball and brings it back to the spot the engine credited — or kneels it for a touchback |

Every one of those movements is a player steered by his own [ratings](#ratings) —
speed sets his top gear, burst his acceleration, agility his cuts — so a faster,
more explosive player visibly plays like one. Timing is held to real football, too:
the ball comes out and the pocket breaks on the clock the real league runs on, and
every test film is graded against those windows.

Two rules keep the picture honest. Anything the engine actually credited — the
catch point at the credited air yards, the spot where the tackle happened — is
locked and can never be nudged to make the animation easier. And nobody is asked
to cover ground he physically can't: no teleporting to the ball, no catch-and-freeze.

The one gap on that list is special-teams *flavor*: fair catches, muffs, blocked
kicks and onside recoveries aren't outcomes the engine records yet, so they can't
be drawn. {in-dev}

## Where it actually stands {live}

Honest state of things, because "alpha" is doing real work in that sentence.

**What is finished.** The engine-decides-then-film-draws pipeline runs end to end
on your phone, and every run and pass family draws natively — dropback passes at
every depth, play-action, screens, run-pass options, the full run concept
vocabulary, sacks, scrambles, interceptions, fumbles and their returns, and the
kicking game. No play falls back to standing still. Man and zone coverage are both
built, including pattern-matching rules and pre-snap motion. Movement constants are
measured off real tracking film, and a standing self-check grades every film in a
frozen library against the physics and the football before a change is allowed
through. A separate guard checks continuously that none of it can move a balance
number.

**What is not.** The bodies are circles — the player art is still being produced,
and until it lands the film reads as a diagram rather than a broadcast. Individual
concepts are still being tuned play by play against film review, and some actions
are drawn wrong today. That is the whole reason the switch exists — and the whole
reason the name still says ALPHA.

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

:::tip The short version
The engine already decides everything, exactly as it does in every game you play.
The Film Room's only job is to *show* you those decisions as 22 players moving on
a field — faithfully, deterministically, and without ever touching the result. It
is on your phone now, in alpha, behind a switch. What is still coming is the
polish, not the honesty.
:::
