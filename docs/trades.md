---
id: trades
title: Trades
nav: 10
section: Money
status: live
icon: 🔄
tagline: >
  How the AI values players and picks, when the window is open, and why no GM will hand you a heist
related:
  - contracts
  - draft
sources:
  - docs/trading.md
  - DESIGN.md#F
  - sim/balance/trade_values.yaml
---

## How the AI decides

Every one of the 31 rival GMs runs the same math you do. Each player and each draft pick carries a **trade value** — a single number the whole league agrees on as the neutral market rate. When you send an offer, the receiving GM sums the value coming in, sums the value going out, and asks a simple question: *does this make my team better?*

That baseline value is talent, age and contract only — a shared anchor, identical for every team, so the market stays honest.

On top of it, each GM applies their own **read**. A team desperate at cornerback will pay over market for one; a team already three deep there sees the same player as surplus and discounts him. That personal read is what turns a fair-value trade into a deal a specific team actually wants — and it's why the offer screen shows you two numbers: the league market bar, and *their* take on it.

:::screenshot The Trade Center
A deal on the table: both sides' value bars, the counterparty's read, and where each cap lands this year and next.
:::

Four things set the neutral number:

- **Talent, steeply.** Value is near-flat at the bottom of the league and ramps hard at the top. A `90` is worth *far* more than three `80`s, not a little more. The middle is priced honestly too — a league-median starter is worth about an early fourth-round pick, not a second-rounder.
- **Age.** A 30-year-old star is worth less than his raw rating; a 23-year-old riser more. The bite is heaviest at the skill positions.
- **Position.** Premium spots are weighted hardest, and the weights are derived from what the market actually pays each group — so they line up with the money tiers on the [Free Agency & the Salary Cap](#free-agency) page. Quarterback is in a class of its own, then edge rusher and receiver, then interior defensive line. Tackle and cornerback sit around league-average value; running back, tight end and specialists sit below it.
- **Contract.** A bargain deal adds value; an albatross subtracts it.

:::note Where the rush premium lives
The base, run-setting `DE` prices as an interior body, not at the edge premium. The pass-rush market belongs to `EDGE`. If you want to sell a rusher, make sure you're actually selling one.
:::

## What moves a player's value

The talent-and-age curve does most of the work, but the situation around a player swings what any one team will give:

| Raises value | Lowers value |
|---|---|
| Young and still on the rise | Aging past his position's decline knee |
| High `OVR` — value ramps hard at the top | Middling `OVR` — the curve is nearly flat down there |
| Premium position (QB, edge, receiver, interior DL) | Low-value spot (kicker, punter, most backups) |
| Cheap contract relative to the market | Bloated contract the buyer must absorb |
| Fills the buyer's biggest hole | Lands on a team already deep there (surplus) |
| Wanted by a win-now contender near the deadline | Shopped to a rebuilder with no use for a vet |
| Fits the acquiring team's scheme | Wrong body type or role for their scheme |

The two forces you'll feel most are **need** and **surplus**. A contender chasing a title weights veterans up and future picks down; a rebuilder does the exact opposite, dumping aging salary for draft capital. That's why the same star nets a first-round pick from one team and a shrug from another. What "fits their scheme" means in practice is on the [Schemes & Scheme Fit](#schemes) page.

## The cap side of a trade

A trade is a cap transaction, and both halves are real:

- **The seller eats dead money.** Trading a player away doesn't erase his contract — the unpaid signing bonus accelerates onto the *seller's* cap immediately, exactly as if he'd been cut. Dumping a bad deal costs you something ([Contracts](#contracts)).
- **The buyer inherits the base salary**, but not the old bonus proration — that stays behind with the team that paid it.
- **Nobody may end a trade over the cap.** A deal that would leave the other club in the red is refused outright: take salary off their books first. The Trade Center shows where both teams land, this season and next.

One more wrinkle: trade **for** a player in the last year or two of his deal, and if you gave up a high pick to get him, the game reads that as intent to keep him and signs him to a fair-market extension on arrival — provided you have the room. Rent a veteran with a late pick instead and no extension fires; he plays out his deal and can walk. Players 30 and older are capped to short extensions regardless.

## Trading draft picks

Picks are assets just like players, and they carry their own value from the same steep-at-the-top curve: a `~Top 5` pick is worth a fortune, a late-round pick is worth a body. The Trade Center lists your picks under **All Picks**, grouped by team.

Three things shape a pick's price:

- **When it lands.** A next-year pick is discounted against the same pick this year — future capital is worth less than capital you can spend now.
- **What the rookie will cost.** A pick isn't a free player — it comes with the slotted rookie contract the drafted player will sign (a top pick's deal is a real cap commitment; see [rookie contracts](#draft--rookie-contracts)). The price nets that in: early picks trade a touch cheaper than the raw chart, day-three picks a touch richer, because their players are nearly free.
- **How good it will be.** Until a season finishes and the draft order locks, a pick's slot is only *projected*. Before kickoff the projection is pure team strength; as games are played it blends in record and remaining strength of schedule — but roster quality always keeps the majority of the weight, so a fluke 3-0 start can't dress up a bad roster's first-rounder as a late pick. The Trade Center shows the estimate as a tier: `~Top 5`, `~Top 10`, `~Mid 1st`, `~Late 1st`.

Because the projected slot travels with the pick, the AI values it exactly the way you see it — there is no hidden discount waiting to surprise you. How you actually *use* picks once you own them lives on the [Draft](#draft) page.

## The trade block and shopping players

The **Trade Block** is the league's want-ad board. Any player you list shows up there for other GMs, and the AI lists its own expendable players the same way — mostly mid-tier surplus bodies and the occasional big-contract veteran a cap-strapped team can no longer keep. Browsing it tells you who is genuinely available before you waste an offer on an untouchable star. You can also shop the whole league through **All Players**, sorted by rating; nothing stops you offering on someone who isn't listed, but a team that loves its guy will say no, or demand a package that reflects how badly it does *not* want to move him.

A player who negotiated a **no-trade clause** into his deal can only be dealt to a **contender-tier** team — the title favorites and the next tier of genuine contenders. Try to ship him to a rebuilder and he vetoes, with a reason. The clause restricts trades only; you can still re-sign, extend or cut him. Contender tiers are recalculated every week, so a team climbing into contention opens up mid-season.

## The window and the deadline

Trades are not always available. The **trade window** is open throughout the offseason and training camp, stays open through **Week 9** of the regular season, then closes for the rest of the season and the playoffs. When it is closed, the Trade Center is disabled with a `WINDOW CLOSED` chip.

The deadline is the busiest — and most lopsided — moment of the season. Contenders become buyers, rebuilders become sellers, and rental veterans flow toward the teams chasing a ring. Rival GMs pitch you offers on their own schedule each week, so check your **Offers Received** inbox regularly rather than only when you're shopping.

## Why the AI won't be fleeced

GMs will not take obviously lopsided deals. The engine enforces a fairness band on every executed trade: two AI clubs only shake hands when both sides land close to level in true value, and the typical executed deal sits well inside that band. League-wide volume is healthy — roughly a couple of dozen trades a season get done without you lifting a finger.

When *you* propose a trade, the standard is even stricter — the AI accepts only if, by its own read, what it receives is worth at least what it gives up. Its need-and-surplus tilt still applies (it may take a raw-value-uneven deal because it genuinely needs the position), but there is no built-in generosity to exploit. A few more guardrails you'll run into:

- **No gutting one position.** A team will not trade away two or three of its starting-caliber bodies at the same spot just to land one star elsewhere — it refuses to hollow out its own depth.
- **Picks close the gap both ways.** When a deal is close but tilted, either side adds the cheapest sufficient picks to balance it — and only picks with real value, never near-worthless filler. The AI will never hand back its own first-rounder as a balancer, and it won't ask for *your* first-rounder either: a surprise first-round ask reads as fleecing, not fairness. If a deal can't be balanced inside the band, it simply dies.
- **Realism limits.** At most three players per side, and neither a player nor a pick acquired this season can be flipped again in the same season — so nothing ping-pongs around the league.

:::tip Practical tips
- **Sell high, buy needs.** Shop a deep position to a team thin there and you'll get real value; add where you're already strong and the AI treats your target as surplus.
- **Beat the deadline.** If you're contending, move before the Week 9 cutoff — prices climb as rivals pile in late, and after it the window is gone.
- **Package smartly.** To pull a deal inside the fairness band, add a modest pick rather than a second star. Throwing in more talent than needed just overpays.
- **Watch the contract, not just the rating.** A cheap young player on a bargain deal is worth more than his rating suggests; a great player on an albatross deal is worth less.
- **Count the dead money before you dump salary.** Shedding a bad contract by trade still accelerates its bonus onto your books this season.
:::
