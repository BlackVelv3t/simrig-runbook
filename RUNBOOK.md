# Dan's GT Omega Rig & PC Setup — Runbook

*Last updated: PPL passed ✅ — CPL training underway*

---

## How to start a new AI session
1. Run `.\context.ps1` on Gengar (in the repo folder)
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
cd "C:\Users\danan\Tools\Shadowlab & GIT\simrig-runbook"
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
cd "C:\Users\danan\Tools\Shadowlab & GIT\simrig-runbook"
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
- **Seat:** VW Golf GTI Mk6 OEM seat (tartan), fitted in place of the stock RS9 seat.
- **T-nuts:** M8 40 Series drop-in/hammer-head, 8mm slot — the correct spec after a fair bit of trial and error. Keep a stock of these on hand for any future accessory additions.
- **Joystick mounts:** 1x PRIME Side Support Bracket + 2x Flight Stick Expansion Plates (confirmed correct combination directly by GT Omega support).
- **Monitor mount:** GT Omega PRIME **Quad** Integrated Monitor Mount.
- **Outstanding GT Omega accessories** (held up at one point by a Cloudflare error on their site — site-side issue, not yours, worth rechecking stock/shipping):
  - PRIME Gear Shifter Mount
  - PRIME Keyboard Tray
  - PRIME Monitor Quick Mount

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
- **Stream Deck switching project (in progress):** using **MultiMonitorTool** (free, NirSoft) to save/load "Rig Mode" vs "Desktop Mode" display configs via command line, triggered from a Stream Deck button.
  - Tool path: `C:\Users\danan\Tools\multimonitortool\MultiMonitorTool.exe`
  - Config path: `C:\Users\danan\Tools\Display Config\RigMode.cfg` (DesktopMode.cfg to be saved the same way)
  - Command: `"C:\Users\danan\Tools\multimonitortool\MultiMonitorTool.exe" /LoadConfig "C:\Users\danan\Tools\Display Config\RigMode.cfg"`
  - **Last error hit:** "This app can't run on this PC" — likely a 32-bit/64-bit mismatch (re-download the 64-bit build from nirsoft.net) or the file needs unblocking (right-click exe → Properties → General tab → tick "Unblock").
  - **Fallback if MultiMonitorTool keeps failing:** DisplayFusion (paid, ~£20) — more robust profile switching, better Stream Deck plugin support.

---

## 🎮 FLIGHT CONTROLS

- **HOTAS:** Thrustmaster T.16000M FCS Flight Pack (stick + throttle + rudder pedals) — bought secondhand for £94.30. Chosen over the Thrustmaster Warthog (which was cancelled) because the T.16000M's Hall Effect stick sensors are more modern than the Warthog's ageing potentiometer-based throttle, at a fraction of the price.
- **Deliberately deferred upgrade:** MOZA MTQ Throttle Quadrant (interchangeable Boeing/Airbus/fighter levers) — planned once flying style/preferences are clearer, not before.
- **TrackIR 5** — confirmed want for head tracking in MSFS/DCS, on the list.
- **Saitek panels** — still hunting eBay for a Radio Panel + Multi Panel, and there was a yoke/quadrant/radio/multi bundle spotted going cheap — worth keeping an eye out for similar bundles.

---

## 🏎️ RACING / OTHER SIM CONTROLS

- **MOZA RS20 All-in-One R5 Bundle** — 5.5Nm direct drive wheelbase + RS20 wheel + SR-P pedals + clamps.
- **MOZA TSW Truck Wheel** — second wheel for Euro Truck Sim/Farm Sim, swaps via MOZA's quick-release in seconds.
- **Sim rally interest noted** — WRC / EA Sports WRC / Dirt Rally 2.0 / Richard Burns Rally all good options. MOZA HBP Handbrake flagged as the natural future accessory for rally-specific driving technique.
- **Buttkicker Gamer Plus** — confirmed want for tactile immersion (includes 4080 rail mount for the rig), not yet ordered.

---

## 🔌 PC, POWER & CABLING

- **Sabrent HB-BU10** 10-port powered USB hub — replaces reliance on built-in PC ports, handles HOTAS, wheelbase, headset, scanner, webcam, mic, keyboard, mouse without dropout issues (important since unpowered hubs can struggle under HOTAS/wheelbase current draw).
- **Dynamode 12-Way Switched PDU** — main rig power distribution. Note: this unit has **one master switch**, not individually switched sockets, but each socket is individually fused.
- Confirmed safe: a standard 4-way extension lead plugged into one PDU socket to power the 4 monitors — negligible current draw for monitors, nowhere near the rated capacity.
- Cable management: Velcro ties (not zip ties) on anything likely to be adjusted again soon, cables grouped by purpose (monitor power separate from HDMI/DP data runs) and tied to the frame itself, never to pivoting/moving parts.

---

## ✈️ FLIGHT SIMULATOR — MSFS 2024

- **Version:** Microsoft Flight Simulator 2024, **Premium Deluxe Edition** (Xbox/Microsoft Store key via Eneba) — includes 95 aircraft total, notably the Boeing 787-10 Dreamliner, C-17 Globemaster, CH-47D Chinook, Saab 340B, Cessna Citation Longitude, and more on top of the standard roster.
- **Career mode** — MSFS 2024 has a proper career progression built in. Start as a student pilot, earn licences, build hours, take on passenger and cargo jobs, unlock bigger aircraft. Good for structured progression before free flying.

---

## 🛫 AIRCRAFT PROGRESSION (recommended order)

1. **Cessna 172** — start here, every sim pilot does. Slow, forgiving, teaches the basics of joystick control and trimming properly.
2. **Cessna 172 with G1000** — glass cockpit, introduces nav systems and autopilot basics.
3. **Cirrus SR22** (included in Premium Deluxe) — faster GA, full Garmin Perspective avionics, proper AP. Good bridge between GA and airliners.
4. **Saab 340B** (included in Premium Deluxe) — regional turboprop airliner, perfect for Fly UK shorter routes, real crew procedures.
5. **Boeing 787-10 Dreamliner** (included in Premium Deluxe) — the long haul aircraft. The London to Sydney flight discussed extensively.
6. **Fenix A320** (~£50, payware) — study-level Airbus, the gold standard for serious airliner flying and streaming. Fully modelled systems, proper FMS, failures.
7. **PMDG 737** (~£70-90, payware) — same tier as Fenix but Boeing. Once you have one study-level aircraft, the other becomes a natural second step.

---

## 🌐 VATSIM & ONLINE FLYING

- **What it is:** a global online network where real volunteers act as ATC and real people fly as pilots simultaneously. Every ATC voice you hear is a real human somewhere in the world. Controllers can't control your aircraft — they can only talk to you, just like real ATC. You follow instructions, they see you as a blip on their radar.
- **Required software:** vPilot (free, connects MSFS to the VATSIM network) + a free VATSIM account at vatsim.net.
- **Before flying online:** complete the **VATSIM P1 pilot rating** (free online training) — teaches phraseology, readback procedures, and what to expect before you talk to a real controller for the first time.
- **First contact tip:** say "student pilot, first time on VATSIM" on initial contact — controllers will slow down and walk you through it.
- **VATSpy** (free) — live radar showing every connected aircraft and controller worldwide. Run this on your 4th screen while flying so you can see yourself as a blip and monitor surrounding traffic.
- **Fly UK** (free virtual airline, flyuk.aero) — join as a First Officer, fly real UK routes, log hours, get promoted. Gives every MSFS flight a purpose and a community behind it.
- **IVAO** — alternative to VATSIM, similar concept, slightly different community. Also worth knowing exists.

---

## 🗺️ NAVIGATION & PLANNING SOFTWARE (all free unless noted)

| Tool | Purpose |
|---|---|
| **SimBrief** | Real world flight planning — routes, fuel load, OFP paperwork, integrates with Fenix/PMDG FMS |
| **Little Navmap** | Moving map, charts, flight planning, VATSIM traffic overlay — run on 4th screen |
| **Navigraph** (~£15/month) | Real world charts, SIDs, STARs, approaches updated every 28 days — essential for serious IFR flying |
| **VATSpy** | Live VATSIM radar — every aircraft and controller online in real time |
| **vPilot** | Connects MSFS to VATSIM network |

---

## 🎮 REALISM ADD-ONS (paid, priority order)

**1. GSX Pro** (~£30-35, FSDreamTeam)
Ground Services X — adds realistic ground handling to every flight. Jetways, stairs, catering trucks, fuel bowsers, pushback tug, passenger boarding/deboarding animations. Transforms the gate experience completely. Essential for streaming — the departure sequence alone is compelling content.

**2. OnAir Company** (~£8-10/month or one-time purchase)
Virtual airline management platform running alongside MSFS in real time. You build an airline from scratch — start small, buy/lease aircraft, open routes, hire virtual pilots, manage finances. Flights take real time (time acceleration supported for cruise phase — see below). Random failures and emergencies can occur mid-flight. Gives every flight a purpose and creates a persistent narrative perfect for a YouTube series.

**Time acceleration in OnAir:** fully supported. Typical long haul workflow:
- Real time — taxi, departure, climb (the interesting bit for stream)
- x4 or x8 acceleration — cruise phase on autopilot
- Real time — descent, approach, landing, taxi in (the interesting bit again)
- A 12-hour London-Sydney flight becomes roughly 2-3 hours at the keyboard

**3. Active Sky** (~£40, HiFi Simulation Technologies)
Replaces MSFS's default weather engine with more realistic atmospheric modelling — proper turbulence, wind shear, icing conditions, SIGMETs and PIREPs in-sim. Weather surprises mid-flight are great stream content and genuinely useful for building weather awareness.

**4. Orbx GB Central** (~£25, orbxdirect.com)
Hyper-detailed UK Midlands scenery — Stoke-on-Trent area specifically. Accurate autogen, farmhouses, hedgerows, landmarks. Flying over familiar territory looking like it actually should is genuinely impressive.

**5. FlyingIron Sims Spitfire Mk IXc** (~£15, MSFS Marketplace)
Because flying a Spitfire over the Peak District with the Buttkicker rumbling the Merlin engine through your seat is a bucket list sim moment.

---

## 🎬 STREAMING SETUP (YouTube recommended over Twitch for this content)

**Why YouTube:** chill/ambient sim content compounds over time — old streams stay permanently searchable and get discovered months later. Twitch VODs disappear. For a London-Sydney OnAir flight as a 3-hour stream, YouTube is the right home.

**OBS Studio** (free) — standard streaming software, handles both YouTube and Twitch simultaneously if you want both.

**Suggested stream structure (long haul OnAir + VATSIM):**
1. Pre-flight — SimBrief planning, load aircraft, walk through departure plate
2. GSX pushback sequence and startup — visually compelling, great opening
3. Taxi and departure on VATSIM — real ATC interaction
4. Cruise at acceleration — chat interaction, talking about the route/airline progress
5. Real time for descent + VATSIM approach — most technically interesting segment
6. GSX arrival at destination — satisfying conclusion
7. OnAir debrief — show the finances, airline status, what's next

**Music:** use **Pretzel Rocks** (~£8/month) — licensed specifically for streaming, safe for YouTube VODs without mutes or copyright strikes. Never stream Spotify, Apple Music, or commercial radio.

**Copyright on games:** all the sims discussed (MSFS, Euro Truck, Farming Simulator, Assetto Corsa, F1) permit streaming and monetisation. Check each game's specific policy before enabling ads.

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

- **ADS-B receiver** — RTL-SDR Blog V4 dongle (~£35) + 1090MHz antenna (~£25), running as a Home Assistant Community Add-on (readsb/dump1090) on the existing Pi 5/HAOS install. Tracks real aircraft overhead on a live local map. A natural complement to sim flying — compare real traffic patterns against what you fly in the sim.

---

## 📋 NEXT ACTIONS

1. Fix MultiMonitorTool ("app can't run" error) → confirm Rig Mode/Desktop Mode switching → wire into Stream Deck buttons.
2. Order outstanding GT Omega accessories (Gear Shifter Mount, Keyboard Tray, Monitor Quick Mount).
3. Order TrackIR 5 and Buttkicker Gamer Plus.
4. Keep watching eBay for Saitek panels/bundles (Radio Panel, Multi Panel, yoke bundle).
5. Set up VATSIM account + vPilot → complete P1 pilot rating before flying online.
6. Buy GSX Pro and OnAir Company when ready to start airliner/streaming content.
7. ADS-B add-on — low priority, fun project for a free afternoon.

---

## AI Assistant Context (for future sessions)

### Working Style
- Deliver instructions in logical numbered steps
- No walls of text
- When editing files: request current content, make edits, provide complete file to copy-paste
- Use the `context.ps1` script output at the start of each session for current state

---

*Dan — quite a journey from "what HOTAS should I get" to building a proper sim den and flying airliners on VATSIM. Enjoy every flight.*
