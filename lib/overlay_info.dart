import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'game.dart';

///
/// Info Overlay
/// A stateless widget that displays HTML content in a WebView.
/// Uses STRICT TYPING (final OverlayTutorial game) to demonstrate the
/// alternative approach to the title overlay's generic typing.
/// NOTE: WebView does NOT work on Chrome/Web builds - mobile/desktop only.
///

class InfoOverlay extends StatelessWidget {
  final OverlayTutorial game; // Explicitly typed (Approach 2)

  InfoOverlay({super.key, required this.game});

  // Embedded HTML content
  final String infoText = """
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
      background-color: #f0f0f0;
    }
    h1 {
      color: #333;
    }
    p {
      line-height: 1.6;
    }
  </style>
</head>
<body>
  <h1>Game Information</h1>
  <p>This is a demo of Flame overlays showing how you can integrate web content into your game.</p>
  <p>You can use this for tutorials, credits, help documentation, or any HTML-based content.</p>
</body>
</html>
  """;

  @override
  Widget build(BuildContext context) {
    // Initialize WebView controller
    final WebViewController webViewController = WebViewController()
      ..loadHtmlString(infoText);

    return Material(
      color: Colors.transparent, // Important! Makes background transparent
      child: Center(
        child: Container(
          width: 350,
          height: 400,
          decoration: BoxDecoration(
            color: Color.fromARGB(220, 244, 243, 164),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: WebViewWidget(
                  controller: webViewController,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TODO: Close (remove info overlay + unpause)
                },
                child: const Text("Close"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
