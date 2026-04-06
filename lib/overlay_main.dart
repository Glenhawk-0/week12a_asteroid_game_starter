import 'package:flutter/material.dart';

///
/// Main Overlay (HUD)
/// A top-aligned transparent bar with a score display and three icon buttons
/// (pause, settings, info). In class we'll wire up each button to control the game.
///
/// NOTE: This is a "widget function" (returns a Widget) instead of a
/// StatelessWidget class like overlay_title.dart. Both work, but classes are
/// preferred in Flutter because they can use const constructors (cached by the
/// framework, better performance) and show up in the DevTools widget inspector.
/// VS Code's "Extract Widget" refactor always produces a class for a reason.
/// We're using both patterns here so you can recognize them in the wild.
///

Widget mainOverlay(BuildContext context, game) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      color: Color.fromARGB(48, 245, 154, 50), // Semi-transparent orange
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Score: 0",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // TODO: Pause
            },
            icon: Icon(Icons.pause),
          ),
          IconButton(
            onPressed: () {
              // TODO: Settings
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              // TODO: Info
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
    ),
  );
}
