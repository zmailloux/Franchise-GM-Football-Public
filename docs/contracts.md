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

No year of an active-roster deal may pay less than the **league minimum salary of $885,000**, so even the last man on the roster has a price floor. (Practice-squad deals are a weekly stipend and sit legitimately below it — see [Morale, Health & Your Roster](#roster-management).)

How much of a deal is bonus depends on who the player is, not on a fixed rule.

| Who you're signing | What he pushes for | What he'll trade away |
|---|---|---|
| Depth piece | A job and a roster spot | Guarantees, term, structure |
| Riser coming off a breakout | Money up front, in the bonus | Length — he wants back on the market |
| Established star | The largest bonus *and* most of the deal guaranteed | Very little — a thin-guarantee offer is refused outright |

The star row is the one that surprises people: an elite player demands the **biggest** signing bonus in the league, not a clever cap-friendly deal. That matters twice over, because prorated bonus is exactly what accelerates when a contract leaves your building — so the star you just signed is also the player who will be expensive to move later.

A greedy personality pushes every one of those asks further. The later years of a long deal also count for less against your cap than the sticker number suggests — see [Free Agency](#free-agency).

## Weighting: front, balanced, or back

When you build an offer you pick how the same total money is spread across the years. This doesn't change what the player earns — it changes *when* the cap pain lands and what it costs to cut him early.

| Weight | What it does | Cap hit now | Dead money if you cut him |
|---|---|---|---|
| Front-loaded | Keeps the money as early **base salary** | Higher | Lower |
| Balanced | Even split across every year | Even | Even |
| Back-loaded | Converts early base into **bonus** and pushes payouts late | Lower | Higher |

Rival GMs use the same slider with intent: a cap-strapped or rebuilding team **back-loads** and shaves a year off, while a win-now contender **front-loads** and pays the pain now. Stars are the exception either way — a team that just won a bidding war for one will meet his guaranteed-years ask rather than nickel him, because a star punishes a short-guarantee offer by walking.

## Guarantees and what they cost you

Not every dollar is promised. Guarantees cover **whole early years** of base salary rather than a slice of every year — roughly the front half of the deal, while a genuine blue-chipper asks for most of it guaranteed. The signing bonus is always fully guaranteed on top of that.

His ask is an anchor, not a fixed price. You dial the guaranteed number yourself, and coming up short is sticky: shaving a guaranteed year hurts your chances far more than adding one helps you. A true star goes further than sticky — if the share of the deal you are actually promising is too thin, he doesn't weigh it at all, he refuses it.

Guaranteed base is money you owe whether he's on your roster or not, and once a guaranteed year has been played the promise lapses — which is what makes "cut the veteran after his guarantees run out" a deliberate plan rather than a free move.

Blue-chip players also negotiate for **no-trade clauses** on re-signs and extensions. A star in his prime who is loyal, or a multi-year fixture of your building, may *want* one; granting it helps close the deal while restricting where you can later trade him. They never appear on a fresh free-agent signing. Consequences on the [Trades](#trades) page.

:::warn Contract difficulty is locked when you create the save
Everything else you can change later; this you cannot, because deals already signed can't retroactively have been negotiated under other rules. Settings calls the three tiers `SIMPLE`, `STANDARD` and `FULL`.

On `SIMPLE` a contract is just salary and signing bonus — no guaranteed-years lever, no ceiling on the years a player will accept, no no-trade clauses, no weighting slider, and players say yes a little more readily. Dead money on a cut still applies as normal. `STANDARD` restores guarantees and the bonus expectation at softened weights; `FULL` is the table on this page, and is what all 31 rival GMs play under whichever tier you picked.

One door exists between them and it only opens downward: you may **switch to `SIMPLE` mid-save**, because guarantees can be stripped out of signed deals. They can't be invented, so there is no way back up.
:::

## Cutting players and dead money

When you release a player, you don't escape everything you owe. Two things accelerate onto your cap as **dead money**: every remaining slice of his signing bonus, and every remaining guaranteed year of base salary. Non-guaranteed base in future years simply disappears — you owe none of it.

:::example What cutting a player actually costs
A **4-year, $40M** deal with an **$18M** signing bonus, prorated at **$4.5M** a year, leaving **$5.5M** a year of base. Cap hit each season is **$10M**. The first two base years are guaranteed.

**Before Year 1:** all **$18M** of bonus accelerates, and both guaranteed base years (**$11M**) are still owed. Dead money = **$29M** — nearly the whole deal for a player who never took a snap.

**Before Year 3:** the guarantees have lapsed, so no base is owed. Only the two remaining bonus slices accelerate. Dead money = **$9M** — cheap enough to walk away.
:::

A **June-1 designation** softens the worst cuts by splitting the bill across two seasons: this year eats the current bonus slice plus the guarantees, and the rest of the acceleration defers to next season's books. It never reduces what you owe — it buys you a year of room now and hands the bill to the next one. You get **two per offseason**, and the release dialog counts down how many you have left. They are an offseason tool: release a player once the season is under way and the whole bill lands this year. The toggle also only offers itself when there is something to defer, so a final-year or bonus-free deal can't waste one.

**Trading him away is the third kind of dead money, and it is the cheapest.** A trade-out accelerates the remaining bonus onto your cap exactly like a cut does, but the base salary and the guarantees travel with the player to his new team instead of staying with you. That is the real reason a bad contract is easier to trade than to release — if you can find a taker. Details on the [Trades](#trades) page.

A **restructure** is the flip side: convert some current-year base salary into signing bonus and re-spread it over the remaining years. Lower cap hit now, more dead money later. Cap-strapped rival teams do it too, before they resort to cutting anyone. More on [Morale, Health & Your Roster](#roster-management).

:::screenshot A player's contract tab
image: player-contract.jpg
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

Age cuts a deal on **both** axes. Annual money peaks in the late twenties, holds through about 30, then falls away hard — a star still playing well in his mid-thirties earns a clear fraction of what that same player commanded at 27, not something close to it. Term collapses alongside it: premium players command real length into their early thirties and progressively shorter deals after, mid-market and depth players shorten faster, and a fast-aging room (running backs above all) reads older than the calendar says.

The other end of the curve moves for a different reason. A young star already at the top of his game *refuses* the long deal you'd love to give him and asks for a short bridge, so he can reach the market again while he's still a peak asset. Once he is out of his mid-twenties he stops refusing years at all — keeping a veteran short becomes **your** job, not something he does for you.

**The number he asks for is the number he signs for.** The DEMAND column is a real price, not an opening bid: it is the cheapest deal *of the shape you currently have on screen* that he would say yes to. Change the shape and the price moves with it — stretch the term, load the signing bonus, or guarantee another year and watch his ask come down; strip the guarantees out and it climbs. Meet it and the deal is done, no dice roll.

That also means there is no free second try. **Once he turns an offer down, he won't look at the same one again** — not after you leave the screen, and not next week. You have to actually improve it: more money, more years, more bonus, more guaranteed years, or any mix of those that genuinely helps him. A genuine lowball isn't considered at all, and he won't sit through an unlimited number of tries either — loyal players give you more rope, greedy ones less.

## Extensions, the tag, and the option

You can't renegotiate whenever you like. A player will only talk **extension in the final year of his current deal**. When you do extend, the new money is a **plain append**: his current final year plays out exactly as signed, and all the extra salary and bonus start with the tacked-on years. No mid-deal cap surprises.

Two formula deals let you keep a player without negotiating at all:

- **Franchise tag** — a **1-year, fully guaranteed** contract at the average of the **top 5** salaries in his position group. **One per team per season.**
- **Fifth-year option** — for a first-round pick, an extra guaranteed year at the average of the **top 10** in his group, exercised before his rookie deal ends.

Both are sanity-checked against the *individual*, so a journeyman backup quarterback can't be tagged at superstar money just because his position is expensive. A star whose own price already clears his group's average is unaffected. And because both are fully guaranteed, tagging a player and then cutting him is almost never worth it.

Drafted players sign standard rookie contracts, and you **can't extend one until after his third season** — no locking a stud in at year-one prices. An expiring deal is always re-signable. Rookies are also mood-proof at the table: a sour mood inflates a veteran's ask, but not theirs. See the [Draft](#draft) page for where they come from, and [Player Growth & Aging](#development) for how their ratings move afterward.

## Renegotiations and holdouts {live}

Mid-contract drama runs **from Medium up**. A new game starts on **Easy**, which switches the whole morale economy off — no mood anywhere, no demands, no sagas — so none of this section applies to a default save until you raise the difficulty or turn **PLAYER MOODS** on yourself under Settings ▸ Difficulty.

With it on, a player who has badly outperformed a deal with a year or two left — or one buried in the pecking order, or ringless on a doormat — can escalate from private grumbling to a public demand. Most of it resolves quietly: he asks you to rework the deal and you **accept**, **promise** to revisit it, or **ignore** him and eat the mood hit.

A **trade request** is the next step up, and on **Medium** it is where every saga stops — the ladder simply has no rung above it. Only **Hard** lets a player actually **sit out** (a Custom setup inherits Hard's ceiling), and even there it is the rare tail rather than the norm: he stays away, gets fined a slice of his salary every week he does — credited back to your cap — and usually reports in around the trade deadline anyway.

:::warn Scarce by design
Public sagas are rationed. Only a couple can start on your roster in a season, with one running at a time — a pressure valve and a storyline, not a talent drain. Loyal, well-paid, winning players are mostly immune, and paying up or winning is always an available cure.
:::

How mood is built week to week — usage, wins, pay, coaching — lives on [Morale, Health & Your Roster](#roster-management).
