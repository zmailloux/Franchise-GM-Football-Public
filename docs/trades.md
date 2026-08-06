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

:::screenshot A deal on the table
image: trade-center.jpg
:::

Four things set the neutral number:

- **Talent, steeply.** Value is near-flat at the bottom of the league and ramps hard at the top: the last man on a roster is worth essentially nothing as a trade asset, and the curve only starts biting around the level of a solid full-time starter. But it is a *curve*, not a cliff — three genuinely good starters really can outweigh one great player. Quantity has a value here; it just isn't a shortcut to a superstar.
- **Age.** A 30-year-old star is worth less than his raw rating; a 23-year-old riser more. The bite is heaviest where speed is the job — running backs fall fastest, then receivers and corners; quarterbacks age most gently of all.
- **Position.** Premium spots are weighted hardest, and the weighting is derived from what each group is actually paid rather than hand-picked — so it broadly tracks the money tiers on the [Free Agency & the Salary Cap](#free-agency) page. Quarterback is in a class of its own, then edge rusher and receiver, then the interior defensive line. Tackle and cornerback sit right at league-average value, the rest of the front seven and secondary just under it, and running back, tight end and the specialists well below.
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

The two forces you'll feel most are **need** and **surplus**: the same star nets a first-round pick from a team with a hole at his spot and a shrug from a team already three deep there. Around the deadline a second layer shows up in the AI's own dealing — contenders start valuing veterans over future picks, rebuilders do the exact opposite and dump aging salary for draft capital. What "fits their scheme" means in practice is on the [Schemes & Scheme Fit](#schemes) page.

:::warn A team's best player is usually not for sale at any price
Value is not the only gate. A club **refuses to move a cornerstone** — its most valuable player — while he still has real time left on his deal, and no amount of "offer a bit more" gets past it. Four things open the door: he is listed on the trade block, he is down to the final year of his contract, you blow the doors off with a genuinely lopsided overpay, or the seller is a non-contender and you're paying with a first-round pick — the classic rebuild trade. In reverse, an AI won't spend a premium pick on a player who wouldn't start for it after the deal.
:::

## The cap side of a trade

A trade is a cap transaction, and both halves are real:

- **The seller eats dead money.** Trading a player away doesn't erase his contract — the unpaid signing bonus accelerates onto the *seller's* cap immediately. It is the cheaper half of a cut: the base salary and the guarantees travel with the player, and only the bonus you already paid sticks to you ([dead money](#contracts--cutting-players-and-dead-money)).
- **That acceleration is also a price, not just a cap hit.** A team being asked to swallow dead money to move a contract wants more back for the trouble — so the ugliest salary dumps cost you cap *and* return.
- **The buyer inherits the base salary**, but not the old bonus proration — that stays behind with the team that paid it.
- **No AI club will end a trade over the cap.** A deal that would leave the other side in the red is refused outright: take salary off their books first. Your own club is not blocked the same way — you get a warning and a confirmation, and then the bill is yours to solve before the compliance gate in Week 1 ([Free Agency & the Salary Cap](#free-agency--the-salary-cap)). The Trade Center shows where both teams land, this season and next.

One more wrinkle: trade **for** a player in the last year or two of his deal, and if you gave up a high pick to get him, the game reads that as intent to keep him and signs him to a fair-market extension on arrival — provided you have the room. Rent a veteran with a late pick instead and no extension fires; he plays out his deal and can walk. Players 30 and older are capped to short extensions regardless.

## Trading draft picks

Picks are assets just like players, and they carry their own value from the same steep-at-the-top curve: a `Top 5` pick is worth a fortune, a late-round pick is worth a body. You browse them one club at a time — pick a trade partner, then switch between its **PLAYERS** and **PICKS** tabs.

Three things shape a pick's price:

- **When it lands.** A next-year pick is discounted against the same pick this year — future capital is worth less than capital you can spend now.
- **What the rookie will cost.** A pick isn't a free player — it comes with the slotted rookie contract the drafted player will sign, and a top pick's deal is a real cap commitment (see [rookie contracts](#draft--rookie-contracts)). The price nets that in, which nudges premium picks down a little and late picks up a little, because their players are nearly free.
- **How good it will be.** Until a season finishes and the draft order locks, a pick's slot is only *projected*. Before kickoff the projection is pure team strength; as games are played it blends in record and remaining strength of schedule — but roster quality keeps the larger share of the weight all the way through, so a fluke 3-0 start can't dress up a bad roster's first-rounder as a late pick. The Trade Center shows the estimate as a tier: `Top 5`, `Top 10`, `Mid 1st`, `Late 1st`, and `Early`/`Mid`/`Late` plus the round number after that.

Because the projected slot travels with the pick, the AI values it exactly the way you see it — there is no hidden discount waiting to surprise you. How you actually *use* picks once you own them lives on the [Draft](#draft) page.

## The trade block and shopping players

The **Trade Block** is the league's want-ad board. The AI lists its own expendable players there — mostly mid-tier surplus bodies and the occasional big-contract veteran a cap-strapped team can no longer keep — and browsing it tells you who is genuinely available before you waste an offer on an untouchable star. Nothing stops you offering on someone who isn't listed, but a team that loves its guy will say no, or demand a package that reflects how badly it does *not* want to move him.

Listing your own player there is not a passive act. A quality name on the block draws real interest: rival GMs who could start him come looking, usually within a week or two, and their packages are built against a motivated-seller price. If you want offers, list him — then judge what arrives.

A player who negotiated a **no-trade clause** into his deal can only be dealt to a **contender-tier** team — the title favorites and the next tier of genuine contenders. Try to ship him to a rebuilder and he vetoes, with a reason. The clause restricts trades only; you can still re-sign, extend or cut him. Contender tiers are recalculated every week, so a team climbing into contention opens up mid-season.

## The window and the deadline

Trades are not always available. The **trade window** is open throughout the offseason and training camp, stays open through **Week 9** of the regular season, then closes for the rest of the season and the playoffs. When it is closed the trade buttons grey out and a `TRADE WINDOW CLOSED` chip appears on your next-game card.

Open is not the same as busy:

| Window | What it feels like |
|---|---|
| Before the draft | The real market — star veterans move, premium picks change hands, rebuilders sell in earnest |
| Training camp | Near-dead; premium picks essentially never move |
| Weeks 1–9 | A steady trickle, building to the deadline |
| Week 9 | The busiest and most lopsided moment of the season |

At the deadline contenders become buyers, rebuilders become sellers, and rental veterans flow toward the teams chasing a ring. Rival GMs pitch you offers on their own schedule each week — including on players you never listed — so check your **Offers Received** inbox regularly rather than only when you're shopping.

**Draft day is its own market.** Trading up or back while the clock runs is on the [Draft](#draft) page; unlike an in-season trade, those deals are checked hard before they execute — roster limit, the personnel your scheme requires, and cap space are enforced, not warned about.

## Why the AI won't be fleeced

GMs will not take obviously lopsided deals. The engine enforces a fairness band on every executed trade: two AI clubs only shake hands when both sides land close to level in true value. You will see a steady stream of deals get done around the league without lifting a finger, and none of them will be a heist.

When *you* propose a trade, the standard is even stricter — the AI accepts only if, by its own read, what it receives is worth at least what it gives up. Its need-and-surplus tilt still applies (it may take a raw-value-uneven deal because it genuinely needs the position), but there is no built-in generosity to exploit. A few more guardrails you'll run into:

- **No gutting one position.** A team will not send away *two* starting-caliber bodies at the same spot in one package, and a club that isn't rebuilding also has to still field a real starter afterward. Rebuilders are allowed to fire-sale into a hole; nobody ships a whole position group.
- **Picks close the gap both ways.** When a deal is close but tilted, either side adds picks until it balances — the cheapest ones that actually close the gap, never padding that changes nothing. A club will not hand back its own first-rounder as a balancer, and it won't ask for *yours* either: a surprise first-round ask reads as fleecing, not fairness. At most one first-rounder and two picks total may ride on either side of a deal. If it can't be balanced inside the band, it simply dies.
- **The counter.** When you land close but short, the AI often counters rather than refusing — it adds or asks for the assets it thinks square the deal, and the additions are marked so you can see what changed. Accepting takes the counter as written.
- **Realism limits — on the AI.** A rival keeps at most three players on its side of a package and won't flip a player or pick it acquired this same season, so nothing ping-pongs around the league. Those are limits on *its* behavior; the Trade Center does not impose them on you.

:::tip Practical tips
- **Sell high, buy needs.** Shop a deep position to a team thin there and you'll get real value; add where you're already strong and the AI treats your target as surplus.
- **Beat the deadline.** If you're contending, move before the Week 9 cutoff — prices climb as rivals pile in late, and after it the window is gone.
- **Package smartly.** To pull a deal inside the fairness band, add a modest pick rather than a second star. Throwing in more talent than needed just overpays.
- **Shop the block first.** Chasing a star nobody has made available usually burns a week for a refusal you could have predicted.
:::
