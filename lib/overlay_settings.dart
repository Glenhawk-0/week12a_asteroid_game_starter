import 'package:flutter/material.dart';

///
/// Settings Overlay
/// A centered container with TWO volume sliders (music, sound effects)
/// and a Close button. The sliders themselves are NOT here yet - we'll
/// add them in class to learn the Slider widget API.
///

Widget settingsOverlay(BuildContext context, game) {
  return Center(
    child: Container(
      width: 350,
      height: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 180, 150, 200), // Purple
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Settings",
            style: TextStyle(color: Colors.black, fontSize: 48),
          ),
          const SizedBox(height: 20),

          // Music volume slider
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.music_note),
              ),
              Expanded(
                child: Slider(
                  value: 100,
                  min: 0,
                  max: 100,
                  divisions: 5,
                  label: "100",
                  onChanged: (value) {
                    // TODO: Connect to actual volume control (next class)
                  },
                ),
              ),
            ],
          ),

          // Sound effects volume slider
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.volume_up),
              ),
              Expanded(
                child: Slider(
                  value: 100,
                  min: 0,
                  max: 100,
                  divisions: 5,
                  label: "100",
                  onChanged: (value) {
                    // TODO: Connect to actual volume control (next class)
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              game.overlays.remove('settings');
              game.paused = false;
            },
            child: const Text("Close"),
          ),
        ],
      ),
    ),
  );
}
