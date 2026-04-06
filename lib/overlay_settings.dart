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
            style: TextStyle(
              color: Colors.black,
              fontSize: 48,
            ),
          ),
          const SizedBox(height: 20),

          // TODO: Add music volume slider here (Row with music_note Icon + Slider)

          // TODO: Add sound effects volume slider here (Row with volume_up Icon + Slider)

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Close (remove settings overlay + unpause)
            },
            child: const Text("Close"),
          ),
        ],
      ),
    ),
  );
}
