---
id: free-agency
title: Free Agency & the Salary Cap
nav: 9
section: Money
status: live
icon: 💰
tagline: >
  How the cap works, how the three offseason waves cool off, and how a free agent weighs money against rings
related:
  - contracts
  - roster-management
sources:
  - docs/fa-economy-plan.md
  - docs/salary-calibration.md
  - DESIGN.md#S
  - docs/holdouts-and-expectations.md
  - sim/balance/cap_rules.yaml
  - sim/balance/free_agency.yaml
---

## The salary cap

Every team plays under the same hard number: a **flat $300M salary cap**, the same every season. It does not grow. Instead, multi-year deals you sign quietly get cheaper on the books as they age — the effect matches a rising cap in the real NFL, where a star's slice of the pie shrinks over the life of his contract, except the number you budget against never moves.

:::warn Unused room does not carry over
There is no rollover. Whatever cap space you finish a season with is **gone** when the next one starts — you cannot bank a rebuild's savings and spend them three years later. Every club lives inside one flat $300M every year, which makes what a team chooses to spend *this* year the whole story.
:::

What counts against the cap is every player's current-year cap hit — base salary plus the prorated slice of any signing bonus — plus any dead money you're still carrying. The full anatomy of a deal lives on the [Contracts](#contracts) page; this page is about the market that sets those numbers.

You must be cap-compliant, but not at every moment of the offseason — you can dip over while wheeling and dealing. The hard gate is **before Week 1**: the roster-and-cap compliance check trims you to the roster limit and under the cap, and keeps firing all season. Miss it and the game makes the cuts for you. See [How a Season Works](#season-flow) for where this sits on the calendar.

Teams are also pushed *up* toward a spending floor, so nobody sits on idle room forever — and the better the team, the higher its floor. Title favorites are expected to spend nearly to the cap; the middle of the league a little less; **rebuilding clubs are allowed to be genuinely cheap**. Spending is audited over rolling multi-season windows rather than year by year, so a club can have a lean season without being force-fed contracts, but can't hoard forever. The rebuild carve-out is the point: bad teams get to be cheap, get younger, and come back.

:::screenshot The free-agency hub
One wave in progress: the market list with asks and interest, your pending offers, and cap room live at the top.
:::

## The three offseason waves

Free agency runs **before the draft**, in three waves. But nobody hits the market until the **re-sign window** opens first: every team looks at its own expiring players and decides to extend them, tag one, or let them walk. Only the players a team won't pay — or won't pay *enough* — reach the pool. (The franchise tag is the override that yanks an elite player back off the market for a forced one-year stay; one per team per year.)

Then the pool opens in tiers. Each wave advances the calendar a few days; you and every AI GM act once per wave, offers resolve, and the market re-prices before the next one.

| Wave | Feel | Who signs | Price | Length ceiling |
|---|---|---|---|---|
| 1 — The Frenzy | Top tier, panic buying | The best names on the board | Over the going rate | 4 years |
| 2 — The Market | Fair value, deliberate | Wave-1 leftovers plus the next tier | Market rate | 3 years |
| 3 — Bargains | Buyer's market | Everyone remaining | Under market | 1 year |

The waves cool for two independent reasons. The wave itself applies a premium early and a discount late — and separately, a player who goes unsigned gets cheaper every wave, sliding his ask and conceding toward his true market rank. Unsigned players stay active in later waves, so patient GMs regularly land a Wave-1-quality name at a Wave-3 price. Teams pace themselves too: a club spends the bulk of its room in Wave 1, keeps some powder dry for Wave 2, and holds a little back for the bargain bin — with a hard limit on how many offers it can make per wave.

That "length ceiling" is a ceiling, not a template. The actual offer is the shorter of the wave ceiling and what the player himself wants, so a 33-year-old signs short even in the frenzy. Below-average starters are capped at a short "prove-it" deal in any wave.

After the waves comes the draft, then a light post-draft cleanup for undrafted rookies and leftover holes — not a fourth headline wave.

## Winning a bidding war

Offers on a single free agent resolve as a **sealed auction**: everyone bids, the player evaluates, and the best offer *after his personality* wins.

- **Contested players get expensive.** Every additional rival bidding on the same player pushes the price up.
- **Every team prices slightly differently.** There's a spread across clubs, so sometimes you're the high bid by luck.
- **A contender's offer is worth more than its dollars** to an ambitious player.
- **He can say no to everyone.** A winning bid still has to come close to what he's asking, or he goes unsigned and waits for the next wave.

Rival GMs are fenced in on price: an AI team can only go so far above what the player himself asked, and no AI deal — however desperate the club — can exceed the top-of-market price for that position group. **You are exempt from both.** A human GM can overpay to whatever the cap allows, which is a real edge in a bidding war and a real way to wreck your own future.

## How free agents choose

A player reaches the open market by one of two doors.

**The team's call** — a club lets its own player walk when the money doesn't make sense: it can't fit the extension under its projected cap, it already has a cheaper young heir at the spot, he's overpriced for a low-value role, or a rebuilding club is deliberately shedding its older players. Contenders, by contrast, pay a premium to keep their own.

**The player's call** — even when his team *does* offer, he can decline and test the market:

- **Money.** The offer sits below what he thinks he's worth, and a greedy personality chases the top bidder.
- **Rings.** A ringless star past his mid-twenties, stuck on a non-contender, wants out — and will take a discount to join a winner. The urge cools hard once he actually wins.
- **Role.** An ambitious high-end player who isn't getting the ball wants to be the alpha somewhere he will.
- **Mood.** Roster churn, bad coaching or a lost season sours him — raising his ask and weakening his pull to stay.

**Loyalty is the counterweight.** A loyal player gives his current team a real discount plus a strong pull to stay — which is why re-signing your own guys early is almost always cheaper than replacing them.

## In-season free agency

Once the season kicks off, the market shrinks to **one-year deals only** — depth and injury replacements, never headline signings. Signings fire only when a real **need** opens: a season-ending injury to a starter your bench can't cover, or a fresh cut, with cap room to spare.

The street is also deliberately worse than your own building. The in-season pool is quality-capped, while [practice squads](#roster-management) carry the league's best willing fringe — so when an injury opens a hole, the intended first answer is a call-up from your own squad, and free agency is the fallback, not the plan.

Deals are **prorated** to the weeks left — sign a player in Week 10 and you pay only the back half of the season, with little or no future dead cap. A player who sat unsigned all offseason keeps getting cheaper through the regular season, drifting toward a floor, so a stranded name eventually becomes affordable. That floor is also a **hard rule**: no signing path may put a quality player below it, and a team that can't clear it simply doesn't get him. That's the governing law of the whole economy — a high-`OVR` player is only ever cheap through a rookie deal or a post-trade contract where someone else already ate the guarantees, never a straight free-agent minimum.

## What the market pays

Prices are fit to real-NFL money, and set by **position group** rather than raw position — edge rushers price together, guards and centers price separately, and a hybrid lineman blends between groups depending on whether he's really a pass rusher or a run stopper. Each group has its own curve and its own hard ceiling on what any single contract in it can be worth.

Those ceilings are the whole positional-value argument, and they run in this order:

| Tier | Position groups |
|---|---|
| A league apart | Quarterback |
| Premium | Edge rusher · Wide receiver |
| Expensive | Interior defensive line · Offensive tackle · Cornerback |
| Mid-market | Center · Guard · Safety |
| Cheap for a starter | Off-ball linebacker · Running back · Tight end |
| Rounding error | Kicker · Punter |

The best quarterback in the league is worth several running backs, and the gap between the tiers is far bigger than the gap between two players inside one tier. Within a group the curve is steep at the top and flat at the bottom — which is why a genuine star sets the market in Wave 1 while replaceable starters flood the bargain bin. How rating maps onto money is on the [Player Stats & Ratings](#ratings) page.

## Holdouts and contract drama {live}

The pressure layer is **on**: a player whose situation has curdled can escalate from private grumbling to a public demand that you rework his contract, and from there to a trade request — with a genuine sit-out as the rare tail, only at the higher difficulty settings. The market matters here because an unhappy player's ask is one of the forces that prices him. The escalation ladder and what each answer does live on [Morale, Health & Your Roster](#roster-management--what-your-players-want); the negotiating mechanics are on [Contracts](#contracts--renegotiations-and-holdouts).
