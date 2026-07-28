---
id: contracts
title: Contracts
nav: 8
section: Money
status: live
icon: 📝
tagline: >
  Deal anatomy, guarantees, dead money, and how players decide what they're worth at the table
related:
  - free-agency
  - trades
  - roster-management
sources:
  - docs/contracts.md
  - DESIGN.md#E
  - sim/balance/cap_rules.yaml
  - sim/lib/src/cap/cap_engine.dart
---

## Anatomy of a deal

Every contract is built from four things: a **length** in years, a **base salary** for each year, a **signing bonus**, and a set of **guarantees**. What counts against your cap in a season — the number on the CAP HIT tab — is that year's base salary plus that year's slice of the signing bonus.

:::note How the bonus is counted
The signing bonus is paid to the player up front, but *charged* to your cap in even slices across the deal — never spread across more than **five years**. That's the whole trick behind fitting an expensive player under the cap, and the whole reason cutting him later hurts.
:::

How much of a deal is bonus depends on who the player is, not on a fixed rule. A player coming off a breakout wants cash in hand now, because his next payday isn't promised. An established star doesn't need the bonus trick — he wants *years* locked in. A depth player takes what he can get.

| Who you're signing | What he pushes for | What he'll trade away |
|---|---|---|
| Depth piece | A job and a roster spot | Guarantees, term, structure |
| Riser coming off a breakout | Money up front, in the bonus | Length — he wants back on the market |
| Established star | Guaranteed years, not tricks | Some annual money, for security |

A greedy personality pushes every one of those asks further. The later years of a long deal also count for less against your cap than the sticker number suggests — see [Free Agency](#free-agency).

## Weighting: front, balanced, or back

When you build an offer you pick how the same total money is spread across the years. This doesn't change what the player earns — it changes *when* the cap pain lands and what it costs to cut him early.

| Weight | What it does | Cap now | Cost to cut early |
|---|---|---|---|
| Front-loaded | More cash paid in the early years | Higher | Lower later |
| Balanced | Even split across every year | Even | Even |
| Back-loaded | Bigger payouts pushed to the late years | Lower | Higher |

Rival GMs use the same slider with intent: a cap-strapped or rebuilding team **back-loads** and shaves a year off, while a win-now contender **front-loads** and pays the pain now. Stars are the exception either way — a team that just won a bidding war for one will meet his guaranteed-years ask rather than nickel him, because a star punishes a short-guarantee offer by walking.

## Guarantees and what they cost you

Not every dollar is promised. Guarantees cover **whole early years** of base salary rather than a slice of every year — roughly the front half of the deal, and deeper still for a genuine blue-chipper. The signing bonus is always fully guaranteed on top of that.

His ask is an anchor, not a fixed price. You dial the guaranteed number yourself, and coming up short is sticky: falling short on guarantees hurts your chances far more than an extra year of term helps. Guaranteed base is money you owe whether he's on your roster or not, and once a guaranteed year has been played the promise lapses — which is what makes "cut the veteran after his guarantees run out" a deliberate plan rather than a free move.

Blue-chip players also negotiate for **no-trade clauses** on re-signs and extensions. A star in his prime who is loyal, or a multi-year fixture of your building, may *want* one; granting it helps close the deal while restricting where you can later trade him. They never appear on a fresh free-agent signing. Consequences on the [Trades](#trades) page.

## Cutting players and dead money

When you release a player, you don't escape everything you owe. Two things accelerate onto your cap as **dead money**: every remaining slice of his signing bonus, and every remaining guaranteed year of base salary. Non-guaranteed base in future years simply disappears — you owe none of it.

:::example What cutting a player actually costs
A **4-year, $40M** deal with an **$18M** signing bonus, prorated at **$4.5M** a year, leaving **$5.5M** a year of base. Cap hit each season is **$10M**. The first two base years are guaranteed.

**Before Year 1:** all **$18M** of bonus accelerates, and both guaranteed base years (**$11M**) are still owed. Dead money = **$29M** — nearly the whole deal for a player who never took a snap.

**Before Year 3:** the guarantees have lapsed, so no base is owed. Only the two remaining bonus slices accelerate. Dead money = **$9M** — cheap enough to walk away.
:::

You get **two June-1 designations** per offseason to soften the worst cuts. Designating a release splits the bill across two seasons: this year eats the current bonus slice plus the guarantees, and the rest is deferred to next season's books. It doesn't reduce what you owe — it buys you a year.

A **restructure** is the flip side: convert some current-year base salary into signing bonus and re-spread it over the remaining years. Lower cap hit now, more dead money later. Cap-strapped rival teams do it too, before they resort to cutting anyone. More on [Morale, Health & Your Roster](#roster-management).

:::screenshot The negotiation table
An offer in progress: his ask and the DEMANDS line explaining it, your structure sliders, and the acceptance read.
:::

## What a player thinks he's worth

Every player is priced against his **position group** — quarterbacks, edge rushers, receivers, interior linemen and so on — and, inside it, against the *rank* he'd hold if he signed today. Elite money is scarce: a group's best, its tenth-best and its fortieth-best are priced very differently. That rank price is the starting point; from there the number moves for reasons you can read straight off his card.

| What moves the ask | Direction |
|---|---|
| Greed as a personality trait | Up — and he holds out for it longer |
| A genuine contender knocking | Down — ambitious players take less to win |
| Sour mood, buried on the depth chart | Up |
| Production beyond his rating | Up — he gets paid like the player he has *been* |
| Re-signing with your team, if he is loyal | Down — the hometown discount |

That last one is the lever that keeps your own stars from all walking. A player can also over-ask well past his rank price and simply go unsigned for it.

Age barely cuts the annual money for a top-of-market player — he is paid nearly the same at 33 as at 27. What age collapses is **term**: premium players command real length into their late twenties and progressively shorter deals after that, while mid-market and depth players shorten faster. That's why aging stars sign big-money *short* deals rather than cheap long ones. A young star already at the top of his game asks for a short bridge instead, so he can hit the market again near his peak.

Acceptance climbs sharply once your offer total meets or beats his ask; below that it leans on structure, guarantees and how long he's been with you. A genuine lowball isn't considered at all, and he won't sit through an unlimited number of tries — loyal players give you more rope, greedy ones less.

## Extensions, the tag, and the option

You can't renegotiate whenever you like. A player will only talk **extension in the final year of his current deal**. When you do extend, the new money is a **plain append**: his current final year plays out exactly as signed, and all the extra salary and bonus start with the tacked-on years. No mid-deal cap surprises.

Two formula deals let you keep a player without negotiating at all:

- **Franchise tag** — a **1-year, fully guaranteed** contract at the average of the **top 5** salaries in his position group. **One per team per season.**
- **Fifth-year option** — for a first-round pick, an extra guaranteed year at the average of the **top 10** in his group, exercised before his rookie deal ends.

Both are sanity-checked against the *individual*, so a journeyman backup quarterback can't be tagged at superstar money just because his position is expensive. A star whose own price already clears his group's average is unaffected. And because both are fully guaranteed, tagging a player and then cutting him is almost never worth it.

Drafted players sign standard rookie contracts, and you **can't extend one until after his third season** — no locking a stud in at year-one prices. An expiring deal is always re-signable. Rookies are also mood-proof at the table: a sour mood inflates a veteran's ask, but not theirs. See the [Draft](#draft) page for where they come from, and [Player Growth & Aging](#development) for how their ratings move afterward.

## Renegotiations and holdouts {live}

Mid-contract drama is switched on. A player who has badly outperformed a deal with a year or two left — or one buried in the pecking order, or ringless on a doormat — can escalate from private grumbling to a public demand. Most of it resolves quietly: he asks you to rework the deal and you **accept**, **promise** to revisit it, or **ignore** him and eat the mood hit. A trade request is the next step up. An actual sit-out is the rare tail — it only exists on the harder difficulty settings — and it costs him salary every week he stays away, credited back to your cap.

:::warn Scarce by design
Public sagas are rationed. Only a couple can start on your roster in a season, with one running at a time — a pressure valve and a storyline, not a talent drain. Loyal, well-paid, winning players are mostly immune, and paying up or winning is always an available cure.
:::

How mood is built week to week — usage, wins, pay, coaching — lives on [Morale, Health & Your Roster](#roster-management).
