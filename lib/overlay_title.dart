import 'package:flutter/material.dart';

///
/// Title Overlay
/// A centered container with title text and two buttons (Start Game, Settings).
/// In class we'll refactor this to accept a game reference and wire the buttons.
///

class OverlayTitle extends StatelessWidget {
  const OverlayTitle({super.key});

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
              style: TextStyle(
                color: Colors.black,
                fontSize: 48,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Start game
              },
              child: const Text("Start Game"),
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
}
