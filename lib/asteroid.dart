import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';

///
/// Asteroid Sprite
/// This is our asteroid sprite that will bounce off the walls
/// When invoked it will create an instance of an Asteroid spritecomponent.
/// The position and velocity are randomized.
/// The update method ensures the asteroid stays on screen and bounces off the walls.
///

class Asteroid extends SpriteComponent with HasGameReference {
  late Vector2 velocity;

  // All asteroids are the same size
  static const double asteroidSize = 50.0;

  //
  // onLoad
  // sets up an asteroid with a random position and velocity
  //
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('asteroid.png'));
    anchor = Anchor.center;
    position = Vector2(
      Random().nextDouble() * game.size.x,
      Random().nextDouble() * game.size.y,
    );
    size = Vector2(asteroidSize, asteroidSize);
    velocity =
        Vector2(Random().nextDouble() * 200, Random().nextDouble() * 200);
  }

  //
  // update
  // moves the asteroid and bounces it off the walls
  //
  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    if (position.y < 0 || position.y > game.size.y) {
      velocity = Vector2(velocity.x, -velocity.y);
    }
    if (position.x < 0 || position.x > game.size.x) {
      velocity = Vector2(-velocity.x, velocity.y);
    }
  }
}
