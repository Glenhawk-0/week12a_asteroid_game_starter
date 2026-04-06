import 'package:flutter/material.dart';
import 'game.dart';

///
///
/// Title Overlay
/// A centered container with title text and two buttons (Start Game, Settings).
/// In class we'll refactor this to accept a game reference and wire the buttons.
///

class OverlayTitle extends StatelessWidget {
  const OverlayTitle({super.key, required this.game});

  final game; // Accept any game type (generic/untyped)

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 400,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 236, 203),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Overlay Tutorial",
              style: TextStyle(color: Colors.black, fontSize: 48),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                game.paused = false;
                game.overlays.remove('title');
                game.overlays.add('main'); // Show HUD
              },
              child: const Text("Start Game"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                game.overlays.add('settings');
              },
              child: const Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
