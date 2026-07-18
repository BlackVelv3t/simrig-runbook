# Dan's GT Omega Rig & PC Setup — Runbook

*Last updated: 2026-07-18 — PPL passed ✅ — CPL training underway*

---

## How to start a new AI session
1. Run `context simrig` in PowerShell (or `.\context.ps1` from the repo folder)
2. Paste the output to Claude
3. State what you want to do

Past session notes are in `sessions/` — worth skimming if context on recent changes is needed.

---

## Session Log

### What it is
A dated markdown file in `sessions/` committed to Git after each session. Keeps a human-readable history of what changed and why.

### When to create one
After any session where something was changed, decided, fixed, or purchased. Even a small update is worth a note (e.g. "ordered X", "fixed MultiMonitorTool error").

### What to put in it
- What you did and why
- Any commands, settings, or fixes that were non-obvious or worth remembering
- Anything that broke and how it was fixed
- Decisions made and purchases (e.g. "chose X over Y because...")

### How to create and commit one

1. Write the file locally as `sessions/YYYY-MM-DD.md`
2. From the repo folder:
```powershell
cd "C:\Users\danan\Tools\Shadowlab & GIT\Sim-Rig"
git add sessions/YYYY-MM-DD.md
git commit -m "Session log: YYYY-MM-DD"
git push origin main
```

### When to update the runbook instead
Update `RUNBOOK.md` itself when something changes that would affect how a future AI session understands the setup — new hardware, resolved issue, new software, or a structural change to the rig/PC. Day-to-day notes go in the session log; structural changes go in the runbook.

---

## Quick Reference

### Save current state to GitHub
```powershell
cd "C:\Users\danan\Tools\Shadowlab & GIT\Sim-Rig"
git add -A
git commit -m "Update: describe what changed"
git push origin main
```

### Check what has changed
```powershell
git status
git diff
```

### Roll back a single file
```powershell
git restore RUNBOOK.md
```

### Roll back everything to a previous commit
```powershell
git log --oneline        # find the commit hash you want
git checkout abc1234     # replace with actual hash
```

---

## 🪑 RIG — GT OMEGA PRIME

- **Frame:** GT Omega PRIME, 8040 aluminium extrusion. Built, sturdy, confirmed solid.
- **Seat:** Still the original GT Omega RS9 seat — the VW Golf GTI Mk6 OEM seat swap discussed previously has **not** happened.
- **T-nuts:** M8 40 Series drop-in/hammer-head, 8mm slot — the correct spec after a fair bit of trial and error. Keep a stock of these on hand for any future accessory additions.
- **Joystick mounts:** 1x PRIME Side Support Bracket + 2x Flight Stick Expansion Plates (confirmed correct combination directly by GT Omega support).
- **Monitor mount:** GT Omega PRIME **Quad** Integrated Monitor Mount — all 4 monitors now mounted and in use on this.
- **Gear Shifter Mount & Keyboard Tray:** decided **not** to buy the official GT Omega versions — using **3D-printed equivalents** instead. Both still needed/in progress.
- **New project — rig enclosure:** looking into adding more 8040 extrusion profiles to make the rig more enclosed (side/rear panelling), partly for aesthetics, partly to support the planned speaker upgrade below.

---

## 🔊 AUDIO — SURROUND SOUND (new)

- Planning a proper surround sound upgrade for the rig — speakers mounted behind the seating position for genuine rear-channel immersion (engine/environment sounds from behind, radio chatter, etc.)
- Ties into the rig enclosure project above — the extra extrusion framework will likely double as speaker mounting points
- Not yet speced out (no specific speaker models/amp chosen yet) — worth researching options in a future session

---

## 🖥️ SCREENS — SORTED

- **4x MSI MAG 27CQ6PF** — 27", QHD 2560x1440, 180Hz, 1500R curve, frameless. Bought as a matched set of 4 from Currys (FlexPay/BNPL) to guarantee an identical look across the quad mount — no mixed models.
- *(Background note for reference: the original plan used an existing 34" AOC ultrawide as the 4th screen, but it got smashed mid-build — hence going all-in on 4 matched MSI units instead.)*
- **AOC CU34G2XP 34" ultrawide** — undamaged, repurposed as the separate general/desktop monitor, not part of the rig.

### GPU & display limits (resolved)
- **Powercolor Red Devil RX 9070 XT** — 3x DisplayPort 2.1a + 1x HDMI 2.1b.
- Display engine caps out at **4 simultaneous active displays**, regardless of physical port count.
- Setup: 3x MSI screens via a **DisplayPort 1-to-3 MST hub** (Thandble, on one native port) + 1x additional screen on a separate native port = 4 active, maxing the card.
- The AOC desktop monitor competes for that same 4-display ceiling — **fix confirmed working:** simply power the AOC off via its own button (not unplug) to free a slot for the other screen.
- **Stream Deck switching project — basics working:** MultiMonitorTool (free, NirSoft) saves/loads "Rig Mode" vs "Desktop Mode" display configs via command line. Both config files (`RigMode.cfg`, `DesktopMode.cfg`) exist and load correctly. Not yet wired to an actual Stream Deck button — still to do.
  - Tool path: `C:\Users\danan\Tools\multimonitortool\MultiMonitorTool.exe`
  - Config path: `C:\Users\danan\Tools\Display Config\RigMode.cfg` / `DesktopMode.cfg`
  - Command: `"C:\Users\danan\Tools\multimonitortool\MultiMonitorTool.exe" /LoadConfig "C:\Users\danan\Tools\Display Config\RigMode.cfg"`
  - **To revisit:** finish wiring this into a Stream Deck button once the extra Stream Decks arrive (see below)
  - **DisplayFusion** (paid, ~£20) — flagged as a more robust alternative worth investigating properly; more reliable profile switching and better Stream Deck plugin support than MultiMonitorTool.

---

## 🎮 STREAM DECK

- Currently own **1x standard Stream Deck**
- **Planning to add:** Stream Deck **XL** + the model with **rotary knobs** (Stream Deck +) — for more dedicated buttons/controls across flight and racing sim functions

---

## 🎮 FLIGHT CONTROLS

- **HOTAS:** Thrustmaster T.16000M FCS Flight Pack (stick + throttle + rudder pedals) — no change, still in use. Bought secondhand for £94.30. Chosen over the Thrustmaster Warthog (which was cancelled) because the T.16000M's Hall Effect stick sensors are more modern than the Warthog's ageing potentiometer-based throttle, at a fraction of the price.
- **Deliberately deferred upgrade:** MOZA MTQ Throttle Quadrant (interchangeable Boeing/Airbus/fighter levers) — planned once flying style/preferences are clearer, not before.
- **TrackIR 5** — still on the list, not yet bought.
- **Saitek Multi Panel — now owned.** Still hunting eBay for a Radio Panel and a yoke/quadrant bundle to complete the set.

---

## 🏎️ RACING / OTHER SIM CONTROLS

- **MOZA RS20 All-in-One R5 Bundle** — 5.5Nm direct drive wheelbase + RS20 wheel + SR-P pedals + clamps. No change.
- **MOZA TSW Truck Wheel** — second wheel for Euro Truck Sim/Farm Sim, swaps via MOZA's quick-release in seconds. No change.
- **Sim rally interest** — still just an interest, not yet actively playing WRC / Dirt Rally 2.0 / RBR. MOZA HBP Handbrake remains a flagged future accessory if/when this gets picked up.
- **Racing setup overall** — undetermined for now, no immediate changes planned.
- **Buttkicker Gamer Plus** — still on the list, not yet ordered.

---

## 🔌 PC, POWER & CABLING

- **Sabrent HB-BU10** 10-port powered USB hub — replaces reliance on built-in PC ports, handles HOTAS, wheelbase, headset, scanner, webcam, mic, keyboard, mouse without dropout issues (important since unpowered hubs can struggle under HOTAS/wheelbase current draw).
- **Dynamode 12-Way Switched PDU** — main rig power distribution. Note: this unit has **one master switch**, not individually switched sockets, but each socket is individually fused.
- Confirmed safe: a standard 4-way extension lead plugged into one PDU socket to power the 4 monitors — negligible current draw for monitors, nowhere near the rated capacity.
- Cable management: Velcro ties (not zip ties) on anything likely to be adjusted again soon, cables grouped by purpose (monitor power separate from HDMI/DP data runs) and tied to the frame itself, never to pivoting/moving parts.

---

## ✈️ FLIGHT SIMULATOR — MSFS 2024

- **Version:** Microsoft Flight Simulator 2024, **Premium Deluxe Edition** (Xbox/Microsoft Store key via Eneba) — includes 95 aircraft total, notably the Boeing 787-10 Dreamliner, C-17 Globemaster, CH-47D Chinook, Saab 340B, Cessna Citation Longitude, and more on top of the standard roster.
- **Career mode progress:** airliners are now **unlocked** in career mode.
- **Current approach — deliberately sticking to smaller aircraft for now.** Airliner learning curve is a real concern; holding off on the 787/Saab 340B until more supporting tools are in place (see Air Manager note below).
- **FlyByWire (A32NX)** — downloaded. Free, highly-regarded community Airbus A320 mod with deep systems modelling; a natural stepping stone toward the payware Fenix A320 without the up-front cost.

### Air Manager / tablet-assisted cockpit (new, researching)
- Interest in running **Air Manager** on a tablet (or multiple) mounted near the rig, to provide interactive virtual cockpit panels/checklists alongside the physical HOTAS — aimed at easing the airliner learning curve before committing further into career mode.
- Currently just researching options — no tablet or Air Manager licence bought yet.

---

## 🛫 AIRCRAFT PROGRESSION (recommended order — for reference)

1. **Cessna 172** — start here, every sim pilot does. Slow, forgiving, teaches the basics of joystick control and trimming properly.
2. **Cessna 172 with G1000** — glass cockpit, introduces nav systems and autopilot basics.
3. **Cirrus SR22** (included in Premium Deluxe) — faster GA, full Garmin Perspective avionics, proper AP. Good bridge between GA and airliners.
4. **Saab 340B** (included in Premium Deluxe) — regional turboprop airliner, perfect for Fly UK shorter routes, real crew procedures.
5. **Boeing 787-10 Dreamliner** (included in Premium Deluxe) — the long haul aircraft. The London to Sydney flight discussed extensively.
6. **FlyByWire A32NX** (free) — now downloaded; a good free step into study-level Airbus systems before considering the payware Fenix.
7. **Fenix A320** (~£50, payware) — study-level Airbus, the gold standard for serious airliner flying and streaming. Fully modelled systems, proper FMS, failures.
8. **PMDG 737** (~£70-90, payware) — same tier as Fenix but Boeing. Once you have one study-level aircraft, the other becomes a natural second step.

*Current position: airliners unlocked in career mode, but deliberately holding at smaller aircraft until Air Manager/tablet setup is sorted.*

---

## 🌐 VATSIM & ONLINE FLYING

- **Status: not started yet.** VATSIM account and P1 rating still to do.
- **What it is:** a global online network where real volunteers act as ATC and real people fly as pilots simultaneously. Every ATC voice you hear is a real human somewhere in the world. Controllers can't control your aircraft — they can only talk to you, just like real ATC. You follow instructions, they see you as a blip on their radar.
- **Required software:** vPilot (free, connects MSFS to the VATSIM network) + a free VATSIM account at vatsim.net.
- **Before flying online:** complete the **VATSIM P1 pilot rating** (free online training) — teaches phraseology, readback procedures, and what to expect before you talk to a real controller for the first time.
- **First contact tip:** say "student pilot, first time on VATSIM" on initial contact — controllers will slow down and walk you through it.
- **VATSpy** (free) — live radar showing every connected aircraft and controller worldwide. Run this on your 4th screen while flying so you can see yourself as a blip and monitor surrounding traffic.
- **Fly UK** (free virtual airline, flyuk.aero) — join as a First Officer, fly real UK routes, log hours, get promoted. Gives every MSFS flight a purpose and a community behind it.
- **IVAO** — alternative to VATSIM, similar concept, slightly different community. Also worth knowing exists.

---

## 🗺️ NAVIGATION & PLANNING SOFTWARE

| Tool | Purpose | Status |
|---|---|---|
| **SimBrief** | Real world flight planning — routes, fuel load, OFP paperwork, integrates with Fenix/PMDG FMS | Not yet in use |
| **Little Navmap** | Moving map, charts, flight planning, VATSIM traffic overlay — run on 4th screen | **Installed** |
| **Navigraph** (~£15/month) | Real world charts, SIDs, STARs, approaches updated every 28 days — essential for serious IFR flying | **Subscribed** |
| **VATSpy** | Live VATSIM radar — every aircraft and controller online in real time | Not yet in use (VATSIM not started) |
| **vPilot** | Connects MSFS to VATSIM network | Not yet in use (VATSIM not started) |

---

## 🎮 REALISM ADD-ONS

**Status: none purchased yet, but planning to get GSX Pro and OnAir Company soon.**

**1. GSX Pro** (~£30-35, FSDreamTeam) — planned next purchase
Ground Services X — adds realistic ground handling to every flight. Jetways, stairs, catering trucks, fuel bowsers, pushback tug, passenger boarding/deboarding animations. Transforms the gate experience completely. Essential for streaming — the departure sequence alone is compelling content.

**2. OnAir Company** (~£8-10/month or one-time purchase) — planned next purchase
Virtual airline management platform running alongside MSFS in real time. You build an airline from scratch — start small, buy/lease aircraft, open routes, hire virtual pilots, manage finances. Flights take real time (time acceleration supported for cruise phase — see below). Random failures and emergencies can occur mid-flight. Gives every flight a purpose and creates a persistent narrative perfect for a YouTube series.

**Time acceleration in OnAir:** fully supported. Typical long haul workflow:
- Real time — taxi, departure, climb (the interesting bit for stream)
- x4 or x8 acceleration — cruise phase on autopilot
- Real time — descent, approach, landing, taxi in (the interesting bit again)
- A 12-hour London-Sydney flight becomes roughly 2-3 hours at the keyboard

**3. Active Sky** (~£40, HiFi Simulation Technologies) — not yet bought
Replaces MSFS's default weather engine with more realistic atmospheric modelling — proper turbulence, wind shear, icing conditions, SIGMETs and PIREPs in-sim. Weather surprises mid-flight are great stream content and genuinely useful for building weather awareness.

**4. Orbx GB Central** (~£25, orbxdirect.com) — not yet bought
Hyper-detailed UK Midlands scenery — Stoke-on-Trent area specifically. Accurate autogen, farmhouses, hedgerows, landmarks. Flying over familiar territory looking like it actually should is genuinely impressive.

**5. FlyingIron Sims Spitfire Mk IXc** (~£15, MSFS Marketplace) — not yet bought
Because flying a Spitfire over the Peak District with the Buttkicker rumbling the Merlin engine through your seat is a bucket list sim moment.

---

## 🎬 STREAMING SETUP

**Status: not started.** OBS Studio is installed but streaming itself hasn't begun yet.

**Why YouTube (recommended over Twitch for this content):** chill/ambient sim content compounds over time — old streams stay permanently searchable and get discovered months later. Twitch VODs disappear. For a London-Sydney OnAir flight as a 3-hour stream, YouTube is the right home.

**Suggested stream structure (long haul OnAir + VATSIM), for whenever this kicks off:**
1. Pre-flight — SimBrief planning, load aircraft, walk through departure plate
2. GSX pushback sequence and startup — visually compelling, great opening
3. Taxi and departure on VATSIM — real ATC interaction
4. Cruise at acceleration — chat interaction, talking about the route/airline progress
5. Real time for descent + VATSIM approach — most technically interesting segment
6. GSX arrival at destination — satisfying conclusion
7. OnAir debrief — show the finances, airline status, what's next

**Music:** use **Pretzel Rocks** (~£8/month) — licensed specifically for streaming, safe for YouTube VODs without mutes or copyright strikes. Never stream Spotify, Apple Music, or commercial radio.

**Copyright on games:** all the sims discussed (MSFS, Euro Truck, Farming Simulator, Assetto Corsa, F1) permit streaming and monetisation. Check each game's specific policy before enabling ads.

**Realistic sequencing:** given VATSIM, GSX, and OnAir are all still pending, streaming is naturally blocked on those first — worth treating as the last piece to switch on once the flying/add-on setup feels ready to show off.

---

## 🚦 AUTOPILOT QUICK REFERENCE

For when something goes wrong mid-flight and you need a quick reminder:

| Mode | What it does |
|---|---|
| **AP** | Master on/off — one button engages/disengages everything |
| **HDG** | Follows the heading bug — set the bug first, then engage |
| **ALT** | Holds current altitude — engage once level and trimmed |
| **NAV** | Follows nav source (VOR/GPS/ILS) instead of heading bug |
| **FLC** | Flight Level Change — holds a set airspeed while climbing/descending to a target altitude |
| **VNV** | Vertical Navigation — follows altitude constraints in the flight plan |
| **APR** | Approach mode — captures ILS glideslope and localiser for precision approaches |

**AP engage/disengage sequence:**
1. Press AP → press HDG → press ALT (engage)
2. Press AP again (disengage everything)

**If AP is pulling away from heading:** check heading bug is set correctly → confirm NAV mode is off → disengage AP → hand fly back to desired heading → retrim → re-engage HDG only → then ALT

**Mixture at altitude:** lean the mixture progressively as you climb. At 16,000ft+ lean significantly — watch EGT gauge, lean toward peak. In MSFS: `Ctrl+Shift+F3` to lean, `Ctrl+Shift+F4` to enrich. Assign a throttle axis for smoother control.

---

## ✈️ REAL-WORLD AVIATION TRACKING (side project)

- **ADS-B receiver** — RTL-SDR Blog V4 dongle (~£35) + 1090MHz antenna (~£25), planned to run as a Home Assistant Community Add-on (readsb/dump1090) on the existing Pi 5/HAOS install. **Not yet bought.** Tracks real aircraft overhead on a live local map. A natural complement to sim flying — compare real traffic patterns against what you fly in the sim.

---

## 📋 NEXT ACTIONS

1. Design/print 3D versions of the Gear Shifter Mount and Keyboard Tray.
2. Finish wiring MultiMonitorTool Rig/Desktop mode switching to a Stream Deck button — also properly evaluate DisplayFusion as an alternative.
3. Buy Stream Deck XL and Stream Deck + (rotary knobs).
4. Order TrackIR 5 and Buttkicker Gamer Plus.
5. Keep watching eBay for a Saitek Radio Panel and yoke/quadrant bundle (Multi Panel already owned).
6. Research and spec out the surround sound speaker upgrade (models, amp, mounting via the new extrusion enclosure).
7. Progress the rig enclosure project (extra 8040 extrusion, side/rear panelling).
8. Research and decide on Air Manager + tablet setup before progressing further into airliner career mode.
9. Buy GSX Pro and OnAir Company.
10. Set up VATSIM account + vPilot → complete P1 pilot rating before flying online.
11. ADS-B add-on — low priority, fun project for a free afternoon.
12. Streaming — realistically the last step once VATSIM/GSX/OnAir are in place.

---

## AI Assistant Context (for future sessions)

### Working Style
- Deliver instructions in logical numbered steps
- No walls of text
- When editing files: request current content, make edits, provide complete file to copy-paste
- Use the `context simrig` output at the start of each session for current state

---

*Dan — quite a journey from "what HOTAS should I get" to building a proper sim den and flying airliners on VATSIM. Enjoy every flight.*
