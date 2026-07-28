---
id: privacy
title: Privacy
nav: 16
section: About
status: live
icon: 🔒
tagline: >
  What the game and this guide collect about you — the short answer is nothing
related:
  - season-flow
sources:
  - CLAUDE.md
  - app/lib/data/teams_import.dart
  - tools/docs/guide_build.py
  - LAUNCH.md
---

## The short version

*Franchise GM: Football* collects nothing about you. There is no account, no login, no telemetry, no analytics, no ads, and no third-party trackers. The game runs entirely on your device and never phones home. This Field Guide website is the same: static pages that report nothing about who reads them.

That is the whole policy. The rest of this page just spells out what "nothing" means, and is honest about the single, optional moment the app can touch the network — one you start yourself.

## What the game collects

Nothing leaves your device, because the game was built on-device only from day one. It plays fully offline — put your phone in airplane mode and everything works exactly the same.

| What you might expect | What actually happens |
|---|---|
| An account or login | None. You just start a game |
| Usage analytics / telemetry | None. Nothing about how you play is measured or sent |
| Crash reporting | None that leaves your device |
| Ads or ad trackers | None |
| Cloud saves | None. Every save lives locally on your device |
| A profile tied to you | None. There is no server that knows you exist |

Your franchise, your saves, your settings, your GM career record — all of it is stored locally on your device and nowhere else. No copy is kept anywhere online, because there is nowhere online to keep it.

:::note Your saves are yours alone
Because saves live only on your device, they behave like any other on-device file. Removing the app removes its local saves along with it. There is no cloud backup to fall back on, and equally no cloud copy for anyone else to reach.
:::

## The one time the app uses the network

There is exactly one moment the app can make a network request, and it only happens if you ask for it.

When you start a new game, you can optionally **import a custom teams file** from a web address you type in yourself — typically a link to a file you host on GitHub. If you use that option, the app fetches that one file over a secure (HTTPS) connection from the address you provided, checks that it is valid, and loads it. That is a one-time setup download of a configuration file you chose and pointed the app at — not ongoing online play, and not something that happens on its own.

Even then, the request only goes *out* to fetch a file. Nothing about you is sent, attached, or stored remotely: no identifier, no usage data, no phone-home. It is an ordinary file download to the address you named, and if you never use the import option the app never touches the network at all.

:::tip You are always in control of that request
Skip the import step and start a normal new game, and the app stays fully offline for the entire life of your franchise. The network request exists only to serve *your* request to load *your* file.
:::

## This Field Guide website

The guide you are reading right now is a set of static pages. It runs no analytics, sets no cookies, loads no tracking pixels, and measures nothing about its readers. Nothing about who opens it, what they read, or how long they stay is captured or reported anywhere.

There is nothing to opt out of, because there is nothing collecting anything in the first place. The only thing the page remembers is your light/dark theme choice, kept in your own browser purely so the page looks the way you left it — never sent anywhere and visible to no one but you.

## Your data, and your rights over it

Most privacy pages end with how to request, correct, export, or delete your data. Here there is nothing to request, correct, export, or delete — none of it is ever collected, so none of it exists to hand over or erase.

- **Nothing to access.** There is no profile or record of you anywhere to see.
- **Nothing to delete online.** Nothing about you is stored on any server. To clear your local game data, remove the app, which takes its saves with it.
- **Nothing shared or sold.** No data is collected, so none is ever shared with or sold to anyone.

If you want to walk through the game itself from here, start with [How a Season Works](#season-flow).
