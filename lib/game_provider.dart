import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame/game.dart';

class GameProvider extends ChangeNotifier {
  // Private variables for settings
  double _musicVolume = 1.0;
  double _sfxVolume = 1.0;
  int _score = 0;
  int _lastScore = 0;
  bool _inGame = false;
  //
    FlameGame? _game;
  // Getters to access private variables
  double get musicVolume => _musicVolume;
  double get sfxVolume => _sfxVolume;
  int get score => _score;
  int get lastScore => _lastScore;
  bool get inGame => _inGame;
// Game reference getter
FlameGame? get game => _game;





  // Setters with notifyListeners
  void setMusicVolume(double value) {
    _musicVolume = value;
    FlameAudio.bgm.audioPlayer.setVolume(value);
    notifyListeners();
  }

  void setSfxVolume(double value) {
    _sfxVolume = value;
    notifyListeners();
  }

  void incrementScore(int value) {
    _score += value;
    notifyListeners();
  }

  void setLastScore(int value) {
    _lastScore = value;
    notifyListeners();
  }
  //
  set game(FlameGame? value) {
  _game = value;
  // NO notifyListeners() needed here!
}

  // Play background music (loops automatically)
  Future<void> playBgm(String url) async {
    await FlameAudio.bgm.play(url, volume: _musicVolume);
  }

  // Play sound effect (one-shot)
  Future<void> playSfx(String url) async {
    await FlameAudio.play(url, volume: _sfxVolume);
  }
}
