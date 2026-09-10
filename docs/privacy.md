---
id: privacy
title: Privacy
nav: 17
section: About
status: live
icon: 🔒
tagline: >
  What the game and this guide collect about you — nothing, unless you switch
  one thing on
related:
  - season-flow
sources:
  - CLAUDE.md
  - app/lib/data/teams_import.dart
  - app/lib/data/analytics/analytics_prefs.dart
  - app/lib/data/analytics/posthog_analytics_sink.dart
  - tools/docs/guide_build.py
  - LAUNCH.md
  - TRACKING.md
---

## The short version

*CapForge: Football GM* collects nothing about you unless you turn one setting on. There is no account, no login, no ads, and no third-party trackers, and there never will be. The game runs entirely on your device.

The one exception is a switch in Settings called **Share Anonymous Gameplay Analytics**. It is **off** when you install the game, and it stays off until you turn it on yourself. Leave it alone and nothing about you leaves your phone, ever — not once, not in the background, not at all.

If you do turn it on, the game sends anonymous counters about how the game is played — which screens get opened, how far franchises get, whether people trade and draft. Never your saves, never anything you typed, and nothing that says who you are. The rest of this page spells out precisely what that means, and stays honest about the other moments the network comes near the game.

## What the game collects

The game was built on-device only from day one, and it plays fully offline — put your phone in airplane mode and everything works exactly the same, whichever way that switch is set.

| What you might expect | What actually happens |
|---|---|
| An account or login | None. You just start a game |
| Usage analytics / telemetry | **Only if you switch it on.** Off by default; anonymous counters if you turn it on. Details below |
| Crash reporting | No crash-reporting library is bundled at all. Your phone's OS may still share anonymous crash logs with developers if *you* switched that on in your device settings — that is Apple's or Google's channel, not ours, and it carries nothing about your franchise |
| Ads or ad trackers | None |
| Cloud saves | None. Every save lives locally on your device |
| A profile tied to you | None. There is no server that knows you exist |

Your franchise, your saves, your settings, your GM career record — all of it is stored locally on your device and nowhere else. No copy is kept anywhere online, because there is nowhere online to keep it.

:::note Your saves are yours alone
Because saves live only on your device, they behave like any other on-device file. Removing the app removes its local saves along with it. There is no cloud backup to fall back on, and equally no cloud copy for anyone else to reach.
:::

## If you switch analytics on

The switch lives in **Settings → Display → Privacy · This Device**, and it is per-device: turning it on for one franchise turns it on for all of them, and starting a new save never re-asks or re-grants it.

### What gets sent

Anonymous counters, and nothing else. Each one is a short label, and numbers are **rounded into ranges** rather than sent exactly — the game reports that a session lasted "5 to 15 minutes" and that you made "2 to 5" trades, not the precise figures.

| What | Example |
|---|---|
| That the app opened, and roughly how long you played | `61_300` seconds |
| Which screens you opened | `TradeScreen` |
| How far a franchise got | season 4, year band `4_7` |
| Whether you trade, sign free agents, and draft | `2_5` trades this session |
| How a season finished | 10–12 wins, made the playoffs |
| Which difficulty and setup options you picked | `hard` |

### What never gets sent

This list is enforced in code, not just promised — the app refuses to send a counter whose name is not on an approved list, and the forbidden names below are covered by an automated test.

- **Your saves.** No roster, no league, no franchise data, in whole or in part.
- **Anything you typed.** Custom team names, franchise names, GM names, imported file addresses.
- **Player or coach names**, yours or the game's.
- **Anything identifying you**: no name, no email, no account (there isn't one), no advertising identifier, no phone number, no contacts, no location.
- **Your IP address.** The analytics provider is configured to discard it on arrival rather than store it.

One thing to be straight about, because it is easy to leave out: the analytics provider's own software attaches standard technical context to each counter — **device model, operating system version, app version, language and timezone**. That is the same coarse information any app sees about the phone it is running on. It is not personal data and it does not identify you, but it *is* sent, and a list of what is never sent would be dishonest without saying so.

### The random ID, and why the App Store says "Device ID"

Counters need some way to tell "one person opened twelve screens" apart from "twelve people opened one screen each" — otherwise every number is meaningless. So when you switch analytics on, the game's analytics software generates a **random string** and sends it along.

What it is, exactly:

- **Randomly generated on your device**, the first time analytics runs. It is not your Apple ID, not your phone's serial number, not an advertising identifier, and not derived from anything about you or your hardware.
- **Specific to this app.** No other app can see it, and it cannot be matched to you anywhere else.
- **Never joined to anything.** No name or account is attached, because none exists. We never call the "identify this person" part of the analytics system.
- **Thrown away** when you switch analytics off.

Because that string persists between sessions, Apple's privacy questionnaire counts it as a **Device ID**, so the App Store listing for this game declares one. That is the honest answer to their question, and it is why the listing does not read "Data Not Collected" any more. It still reads **Data Not Linked to You**, and the game shows no "Ask App Not to Track" prompt, because nothing here is tracked across other companies' apps or websites.

:::note Not "tracking", in the App Store's sense
Nothing is shared with data brokers, matched against other companies' apps or websites, or used for advertising. That is why the game shows no "Ask App Not to Track" prompt — there is nothing to ask about.
:::

### Who receives it

**PostHog**, a product-analytics company, on servers in the United States. They store the counters on our behalf so we can read them as charts. No profile is created for you: the game never calls the "identify this person" part of their system, so the counters arrive as a crowd, not as individuals.

### Turning it off

Flip the same switch. Three things happen immediately:

1. Nothing further is recorded, ever, including the fact that you switched off.
2. The game's own store of pending counters is deleted from your device.
3. The anonymous id the analytics system was using is thrown away.

Two honest caveats. Counters already delivered cannot be pulled back — they are anonymous and were never linked to you, so there is no "you" to find them under. And a small number that the provider's software had already accepted but not yet uploaded may still go out, because that queue belongs to their software and offers no way to empty it. This is exactly why the game decides *before* handing anything over rather than trying to recall it afterwards: with the switch off, nothing is ever passed across in the first place.

If that residue matters to you, the honest advice is simply to leave the switch off. The game is identical either way.

## The one time the app uses the network

There is exactly one moment the app itself can make a network request, and it only happens if you ask for it. Two other moments hand off to your phone instead of going online themselves; both are named below.

When you start a new game, you can optionally **import a custom teams file** from a web address you type in yourself — typically a link to a file you host on GitHub. If you use that option, the app fetches that one file over a secure (HTTPS) connection from the address you provided, checks that it is valid, and loads it. That is a one-time setup download of a configuration file you chose and pointed the app at — not ongoing online play, and not something that happens on its own.

Even then, the request only goes *out* to fetch a file. Nothing about you is sent, attached, or stored remotely: no identifier, no usage data, no phone-home. It is an ordinary file download to the address you named, and if you never use the import option the app itself never makes a network request at all.

:::tip You are always in control of that request
Skip the import step and start a normal new game, and the app stays fully offline for the entire life of your franchise. The network request exists only to serve *your* request to load *your* file.
:::

Two other outbound moments are worth naming, though neither is the app going online itself.

- **The community link** on the save-select screen hands a web address to your phone's own browser and steps out of the way. The game doesn't open a browser inside itself, doesn't read anything back, and sends nothing along with it — it is the same as you typing the address in yourself.
- **The rating prompt.** The first time you win a championship, the game asks *your phone's operating system* to show its standard "rate this app" sheet. That is a system sheet, asked for once per device and never again; the app doesn't run it, doesn't see your answer, and sends nothing with the request. Whatever you type goes to the App Store, not to us — and it is the store's own review system, entirely separate from your saves.

No advertising, attribution or crash-reporting library is bundled in the app at all.

## This Field Guide website

The guide you are reading right now is a set of static pages. It runs no analytics, sets no cookies, loads no tracking pixels, and measures nothing about its readers. Nothing about who opens it, what they read, or how long they stay is captured or reported anywhere.

There is nothing to opt out of, because there is nothing collecting anything in the first place. The only thing the page remembers is your light/dark theme choice, kept in your own browser purely so the page looks the way you left it — never sent anywhere and visible to no one but you.

## Your data, and your rights over it

Most privacy pages end with how to request, correct, export, or delete your data. Here there is nothing to request, correct, export, or delete — none of it is ever collected, so none of it exists to hand over or erase.

- **Nothing to access.** There is no profile or record of you anywhere to see. If you never switched analytics on, nothing at all was ever sent; if you did, what was sent is anonymous counters that were never linked to you in the first place.
- **Nothing to delete online.** No save, and nothing identifying you, is stored on any server. To clear your local game data, remove the app, which takes its saves with it. To stop analytics, switch it off — that also deletes anything still queued on your device.
- **Nothing shared or sold.** Nothing is ever sold, and nothing is shared with advertisers, data brokers, or any other company. The analytics provider stores counters on our behalf and does nothing else with them.

If you want to walk through the game itself from here, start with [How a Season Works](#season-flow).
