# Week 12A Starter Code - Flame Overlays & Collision Detection

This is the starter code for the Week 12A in-class demo where we add **collision detection** and **multiple overlay screens** (title, HUD, pause, info with WebView, settings with sliders) to a basic Flame asteroid game.

## What's Included

```
week12a_asteroid_game_starter/
├── README.md
├── pubspec.yaml              # flame + webview_flutter pre-installed
├── assets/images/
│   └── asteroid.png
└── lib/
    ├── main.dart             # Basic GameWidget setup
    ├── game.dart             # Spawns 10 asteroids (no collision yet)
    ├── asteroid.dart         # Wall bouncing only
    ├── overlay_title.dart    # UI scaffolding + // TODO handlers
    ├── overlay_main.dart     # HUD bar scaffolding + // TODO handlers
    ├── overlay_pause.dart    # Pause menu scaffolding + // TODO handlers
    ├── overlay_info.dart     # WebView scaffolding + // TODO close
    └── overlay_settings.dart # Container + Close (sliders we'll add in class)
```

The overlay files contain the **UI scaffolding only** - all game-control logic is left as `// TODO` comments. In class we'll fill in the TODOs, register each overlay in `main.dart`, and add elastic collision math to the asteroids.

## Setup Instructions

1. Clone this repo (via GitHub Classroom or directly)
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` (or use the Run button in VS Code)
4. You should see 10 asteroids bouncing off the walls (but passing through each other)
5. Follow along in class as we add collision detection and wire up the overlays

> **Hitting Gradle / Android build errors?** Run in **Chrome** as a quick backup - web builds skip Gradle entirely. (The info overlay's WebView won't work in Chrome, but everything else will.) Full troubleshooting in the course reference guide.

## Participation Credit

You have two options:

### Option 1: Commit just your Dart files (minimum for credit)
Copy and paste the contents of your modified `lib/` files (especially the overlay files and `main.dart`) into this repo using the GitHub website. This gets you full participation credit.

### Option 2: Commit your full Flutter app (strongly recommended)
Clone this repo to your machine using **GitHub Desktop** or `git clone`, then commit your entire modified Flutter project. This way you have a working version you can pull back down later.

**Why Option 2 matters:** This is the second class in our Flame series, and **the next two classes build directly on this project** - we'll add Provider state management (12B) and bottom navigation + AppLifecycle (13A) on top of what we build today. Having a working project you can pull down and run will save you a lot of headaches across the series. If you're considering a game for Project 3, having these Flame demos ready to run will be a big help.

## In Class

We'll add:
- **Elastic collision detection** between asteroids (HasCollisionDetection, CircleHitbox, onCollisionStart)
- **Title screen overlay** with Start Game button
- **Persistent HUD overlay** with score and control buttons
- **Pause menu overlay**
- **Info overlay** with embedded HTML via WebView
- **Settings overlay** with volume sliders (we'll build the Slider widgets together)
- All the wiring: `overlayBuilderMap`, `game.overlays.add/remove`, `game.paused`
