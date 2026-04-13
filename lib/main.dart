import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';
import 'overlay_main.dart';
import 'overlay_title.dart';
import 'overlay_pause.dart';
import 'game.dart';
import 'overlay_info.dart';
import 'overlay_settings.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';
import 'highscore_page.dart';

//week 13
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen(); // Makes game fullscreen
  //runApp(const MainApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  int _currentNavScreen = 0;

  final List<Widget> _bottomNavScreens = [
    const MainGame(),
    const HighScorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flame Demo"),
          backgroundColor: Colors.red,
        ),

        //body: const MainGame(),
        body: IndexedStack(
          index: _currentNavScreen,
          children: _bottomNavScreens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentNavScreen,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "High Scores",
            ),
          ],
   onTap: (value) {
  final gameProvider = context.read<GameProvider>();

  setState(() {
    _currentNavScreen = value;
    gameProvider.game?.paused = true;       // Stop the game loop
    gameProvider.game?.overlays.add('pause'); // Show the pause overlay
  });
},
        ),
      ),
    );
  }
}

class MainGame extends StatelessWidget {
  const MainGame({super.key});

  int _currentNavScreen = 0;

  final List<Widget> _bottomNavScreens = [
    const MainGame(),
    const HighScorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final gameProvider = context.read<GameProvider>();
    final game = OverlayTutorial(context)..paused = true;
    gameProvider.game = game;
    return GameWidget(
      //game: OverlayTutorial(context)..paused = true,
        game: game,
      overlayBuilderMap: {
        'title': (context, game) {
          return OverlayTitle(game: game);
        },
        'main': (context, game) {
          return mainOverlay(context, game);
        },
        
        'pause': (context, game) {
          return pauseOverlay(context, game);
        },
        
        'info': (context, game) {
          return InfoOverlay(game: game as OverlayTutorial);
        },
        'settings': (context, game) {
          return settingsOverlay(context, game);
        },
      },
      initialActiveOverlays: const ['title'],
    );
  }
}
