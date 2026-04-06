import 'package:flutter/material.dart';

///
/// Pause Overlay
/// A centered container shown when the game is paused, with Resume and
/// Settings buttons. In class we'll wire the buttons to control the game.
///

Widget pauseOverlay(BuildContext context, game) {
  return Center(
    child: Container(
      width: 350,
      height: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 150, 200, 220),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Game Paused",
            style: TextStyle(
              color: Colors.black,
              fontSize: 48,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Resume (unpause + remove pause overlay)
            },
            child: const Text("Resume"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Settings
            },
            child: const Text("Settings"),
          ),
        ],
      ),
    ),
  );
}
