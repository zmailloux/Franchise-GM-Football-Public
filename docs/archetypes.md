---
id: archetypes
title: Archetypes
nav: 3
section: Players
status: live
icon: 🧬
tagline: >
  The label that describes how a player wins — read off his ratings, never a dial you set
related:
  - ratings
  - schemes
sources:
  - docs/archetypes.md
  - sim/lib/src/models/scheme.dart
  - sim/balance/schemes.yaml
---

## What an archetype is

Every player on your roster carries an archetype — `Deep Threat`, `Power Back`, `Pocket Passer`, `Press Man`, and so on. It is a short label for **how** a player wins his position: not how good he is, but what kind of good he is. A `Deep Threat` and a `Possession` receiver can share the same `OVR` and be completely different weapons.

The key thing: an archetype is **not a setting**. You never assign it, and there is no hidden dial behind it — it is **derived entirely from a player's ratings**. Two receivers with identical `speed`, `catching` and route-running always get the same archetype, and the way to change a label is to change the underlying numbers, which is why the player editor shows it read-only. For what those numbers are and how they roll up, see [Player Stats & Ratings](#ratings).

Tap the little info marker beside a player's archetype and you get a card of its own: a one-line read on how that archetype wins, plus the schemes it thrives in and the ones it's a poor fit for.

:::screenshot A player's archetype card
image: archetype-card.jpg
:::

## How a player earns his archetype

The game runs a small, fixed set of rules per position, in priority order, and takes the **first one that fits**. Each rule is a plain comparison between two of the player's own ratings. If nothing fits, he lands on the position's **default** — the well-rounded, no-strong-tilt archetype.

Because the rules compare a player's ratings *to each other* rather than to a fixed cutoff, the same test works for a superstar and a scrub: it's about the *shape* of the player, not his level. And with no dice involved it's perfectly repeatable — reload a save or re-watch a game and every player re-derives the same archetype.

:::example How a receiver gets classified
The game asks a short series of questions about a wide receiver and stops at the first "yes":

- Is he much faster than he is polished as a route runner? → **Deep Threat**
- Does he out-jump his own speed? → **Jump Ball**
- Are his routes ahead of his speed? → **Route Runner**
- Is he more agile than fast? → **Slot**
- Otherwise → **Possession** (the default)

A burner with `95` `speed` and average routes is a `Deep Threat`. Slow him down and sharpen his routes and he becomes a `Route Runner` — same player, new label.
:::

## The catalog — offense

The game ships **52 archetypes across 15 positions**: 30 on offense, 16 on defense, and three each for kicker and punter. The tables below are the full set — every archetype, how it wins, and the [schemes](#schemes) that hunt for it or avoid it. ⭐ marks each position's **default**, the label a balanced player with no standout tilt lands on.

| Pos | Archetype | How he wins | Schemes that want him | Poor fit in |
|---|---|---|---|---|
| QB | Dual-Threat | legs-first runner | Read Option · Run & Shoot | — |
| QB | Improviser | off-script escape artist, throws on the move | Quick Game | — |
| QB | Gunslinger | big-armed downfield gambler | Run & Shoot · Vertical | Read Option |
| QB | Pocket Passer | rhythm passer from a clean pocket | Pro Set · Quick Game · Vertical | — |
| QB | Game Manager ⭐ | efficient distributor | Ground & Pound · Pro Set | — |
| RB | Receiving Back | backfield pass-catcher | Quick Game · Run & Shoot | Ground & Pound |
| RB | Power Back | downhill bruiser | Ground & Pound · Read Option | Vertical |
| RB | Elusive Back | make-you-miss space back | Run & Shoot | — |
| RB | Workhorse ⭐ | complete three-down bell-cow | Ground & Pound · Read Option · Pro Set | — |
| WR | Deep Threat | home-run speed | Run & Shoot · Vertical | Ground & Pound · Quick Game |
| WR | Jump Ball | contested-catch winner | — (wins anywhere the ball is thrown high) | — |
| WR | Route Runner | separation technician | Quick Game · Vertical | — |
| WR | Slot | quick-twitch interior weapon | Quick Game · Run & Shoot · Vertical | — |
| WR | Possession ⭐ | reliable chain-mover | Quick Game | — |
| TE | Seam Threat | pass-first mismatch | Run & Shoot · Vertical | — |
| TE | Blocker | run-game sealer | Ground & Pound | Run & Shoot · Vertical |
| TE | H-Back | move blocker from the backfield | Ground & Pound · Read Option | — |
| TE | Two-Way ⭐ | complete inline tight end | Pro Set · Quick Game | — |
| OL | Zone Blocker | mobile reach-blocker | Read Option · Quick Game | — |
| OL | Mauler | drive-blocking road grader | Ground & Pound · Read Option | Run & Shoot |
| OL | Pass Protector | pocket-keeping anchor | Vertical | — |
| OL | Balanced ⭐ | no-weakness lineman (the center's default is **Pivot**, the protection-calling brain) | — | — |

## The catalog — defense

There are **16 defensive archetypes**, and all but two are some scheme's preferred body. The exceptions are the `DE` `Power End` and the `LB` `Field General` — both real, common bodies that no scheme singles out, so they're neutral everywhere rather than filler nobody gets classified as.

| Pos | Archetype | How he wins | Schemes that want him | Poor fit in |
|---|---|---|---|---|
| DT | 3-Tech | one-gap interior penetrator | 4-3 Man | — |
| DT | Nose Tackle ⭐ | space-eating double-team anchor | 4-3 Zone · 3-4 Man · 3-4 Zone | — |
| DE | Power End | one-gap edge-setter who pushes the pocket | — (a stylistic split; every front fields him) | — |
| DE | Run Anchor ⭐ | two-gap 5-tech occupier | 3-4 Man · 3-4 Zone | — |
| EDGE | Coverage | rush-or-drop disguise piece | 3-4 Zone · Hybrid Zone | — |
| EDGE | Speed Rusher | bend-the-edge speed | 4-3 Man · 3-4 Man · Hybrid Man | — |
| EDGE | Power Rusher ⭐ | long-arm bull rush | 3-4 Man · Hybrid Man | — |
| LB | Coverage | sideline-to-sideline range defender | 4-3 Man · 4-3 Zone · 3-4 Zone · Hybrid Zone | — |
| LB | Thumper | downhill gap-filler | 4-3 Man · 3-4 Man · Hybrid Man | — |
| LB | Field General ⭐ | the defensive signal-caller | — | — |
| CB | Slot | agile-not-fast interior nickel starter | Hybrid Man · Hybrid Zone | — |
| CB | Press Man | physical travel corner | 4-3 Man · 3-4 Man · Hybrid Man | every Zone scheme |
| CB | Zone ⭐ | read-and-drive zone corner | 4-3 Zone · 3-4 Zone · Hybrid Zone | 4-3 Man · 3-4 Man |
| S | Box | in-the-box thumper | 4-3 Man · Hybrid Man | — |
| S | Hybrid | interchangeable disguise piece | Hybrid Man · Hybrid Zone | — |
| S | Free Safety ⭐ | single-high center fielder | 4-3 Zone · Hybrid Zone | — |

:::note One pool per job
The front seven runs on three clean jobs: **`DE`** is the base, 5-technique run-setting end,
**`EDGE`** is the single pass-rush pool (hand-down or stand-up is a look, not a different body),
and **`LB`** covers every off-ball backer. See [Player Stats & Ratings](#ratings) for the position list.
:::

A few names repeat across positions on purpose — `Coverage` describes both an `EDGE` and an `LB`, `Zone Blocker` every line spot. The rules are separate per position, so the shared name just means "same idea, different spot."

## The catalog — specialists

Kickers and punters used to carry one label each, because there was only one number to split them on. Now that leg power and placement are real [ratings](#ratings), the classic trade-off has a name on both jobs. No scheme prefers or avoids a specialist archetype, so these labels describe the player without moving his fit — a `Precision` kicker is exactly as welcome in Ground & Pound as in Vertical.

| Pos | Archetype | How he wins |
|---|---|---|
| K | Big Leg | range first — the 55-yarder is on the table |
| K | Precision | automatic inside his range, short on the long ones |
| K | Kicker ⭐ | no strong tilt either way |
| P | Bomber | pure gross yardage, booms it |
| P | Directional | hang time and the coffin corner over raw distance |
| P | Punter ⭐ | no strong tilt either way |

## What archetypes actually do

Archetypes are **not** a hidden stat boost to the player himself. When a play resolves — a catch, a block, a pass rush — the outcome runs off the underlying ratings, not the label. What the archetype changes is **distribution and fit**: who gets the ball, who gets the credit, and how well your roster matches your scheme. Three channels:

### Scheme fit

Every team scheme names the archetypes it **prefers** and the ones that are a **poor** fit, per position — the two right-hand columns in the catalog above. On **offense** that match nudges how much a player is used — a preferred-fit receiver draws a few more targets, a poor-fit one a few fewer — and deliberately stays a usage tilt: it never reorders your depth chart, and a great player in the "wrong" scheme is still your best player. On **defense** the match now also pays a real, bounded on-field bonus: fill the role slots your scheme's identity is built on — the rush `EDGE` in a 4-3 Man, the rangy `Zone` corners and `Free Safety` in a zone shell — and your defensive unit grades tick up. It's a carrot, never a stick: an empty slot just forgoes its share, and the bonus is sized well below raw talent, so commitment is felt but never beats ability. The full picture, and the scheme catalog, live on the [Schemes & Scheme Fit](#schemes) page.

### Usage tilts

Beyond scheme fit, certain archetypes bias **who gets the ball in specific situations**. This is why a `Power Back` and an `Elusive Back` behind the same line get used differently:

| Situation | Archetype tilt |
|---|---|
| Goal-line & short-yardage carries | `Power Back` strongly favored; `Receiving Back` cut back hard |
| Late-game clock-killing carries | `Power Back` favored, `Workhorse` a little |
| Carries generally | `Workhorse` gets a standing bump |
| Targets generally | `Receiving Back` favored; `Power Back` pulled back |
| Deep targets | `Deep Threat` gets the strongest tilt in the game; `Possession` and `Slot` pulled off the deep ball |
| Passing-down / third-down targets | `Receiving Back` and `Possession` favored |
| Screens | `Slot` favored |
| Routes at all | `Blocker` tight ends run far fewer of them |
| Pass-rush credit on obvious passing downs | the dedicated rush archetypes (`3-Tech`, `Speed Rusher`, `Power Rusher`) take a bigger share of sacks and pressures |
| Run-stop credit in short-yardage | `Nose Tackle`, `Run Anchor`, and `Thumper` take a bigger share |
| Interceptions & pass break-ups | `Coverage` (EDGE or LB) is favored — the only tilt on the defensive back end |

So a committee of a `Power Back` and a `Receiving Back` naturally splits into a short-yardage hammer and a passing-down weapon, without you setting anything — the archetypes do the sorting. The same is true on defense: two edge rushers with the same `OVR` will not put up the same sack total if one is a `Speed Rusher` and the other is a `DE` `Run Anchor`.

Two things this table is **not**. It never touches the play mix or your team totals — it only redistributes touches and credit inside a lineup you already field. And it is never a power boost: a `Power Back` handed a goal-line carry still converts it with his own [ratings](#ratings), not with a bonus.

### AI roster building

Every draft class is generated with a **designed spread of archetypes** rather than one cookie-cutter prospect per position. Each new prospect is dealt an archetype first — weighted toward the ones the league's schemes actually ask for — and his ratings are then shaped so he really classifies as that. The effect you feel: no archetype ever swallows a position, and none goes extinct. Quarterback classes come out spread across all five labels, and a coverage-first linebacker shows up often enough to plan around. So [scouting](#scouting) the [draft](#draft) for a *specific* kind of player is a realistic plan, not a lottery.

The AI also reads archetypes when it builds rosters. In free agency, when two players are close in value, the better scheme-fit archetype is the tiebreaker for who signs where. When a team assesses its needs, it counts how many preferred-archetype starters it has at each spot and treats a shortage as a hole to fill. This shapes **which** players end up on **which** teams. The upshot for you: the league self-sorts, so you'll see Ground & Pound teams stockpiling maulers and power backs while Vertical teams hoard burners — which also means the [free-agent](#free-agency) market for a given archetype is thinner when half the league runs a scheme that wants it.

## Archetypes can shift over time

Because the label is read off the ratings, it moves when the ratings move. If a young corner's man-coverage climbs past his zone-coverage by enough, he flips from `Zone` to `Press Man` the next time he's classified — and editing a player's ratings is the intended lever for reshaping his archetype.

Normal [development](#development), though, is built to **keep** an archetype rather than drift it: as a player grows, the ratings that define his current label grow together, so a `Speed Rusher` stays a speed rusher across his career instead of quietly morphing into a run-stopper. Left alone, a label almost never changes across a whole career. In practice archetypes flip when **you** edit a player — not as a side effect of aging.

:::note Where this is heading {in-dev}
The defensive scheme-fit bonus above is live. Offense has no equivalent yet: cross-position
interactions — a `Pocket Passer`'s effective play scaling with the `Pass Protector` talent in front of
him, say — remain a future step, so on that side of the ball fit is still purely a usage tilt.
:::
