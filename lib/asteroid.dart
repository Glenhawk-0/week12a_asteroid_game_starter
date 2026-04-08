import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

///
/// Asteroid Sprite
/// This is our asteroid sprite that will bounce off the walls
/// When invoked it will create an instance of an Asteroid spritecomponent.
/// The position and velocity are randomized.
/// The update method ensures the asteroid stays on screen and bounces off the walls.
///
///
///

class Asteroid extends SpriteComponent
    with HasGameReference, CollisionCallbacks {
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
    velocity = Vector2(
      Random().nextDouble() * 200,
      Random().nextDouble() * 200,
    );

    // Add a circular hitbox for collision detection
    add(CircleHitbox());
  }

  //
  // update
  // moves the asteroid and bounces it off the walls
  //
  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    /*
    if (position.y < 0 || position.y > game.size.y) {
      velocity = Vector2(velocity.x, -velocity.y);
    }
    if (position.x < 0 || position.x > game.size.x) {
      velocity = Vector2(-velocity.x, velocity.y);
    }
*/

    if (position.y < 0) {
      velocity = Vector2(velocity.x, (velocity.y).abs());
    }
    if (position.y > game.size.y) {
      velocity = Vector2(velocity.x, -1 * ((velocity.y).abs()));
    }
    //
    if (position.x < 0) {
      velocity = Vector2((velocity.x).abs(), velocity.y);
    }
    if (position.x > game.size.x) {
      velocity = Vector2(-1 * ((velocity.x).abs()), velocity.y);
    }
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);

    if (other is Asteroid) {
      // Get the direction from this asteroid to the other
      final normal = (other.position - position).normalized();

      // Calculate relative velocity
      final relativeVelocity = velocity - other.velocity;

      // How much velocity is along the collision axis
      final impulse = relativeVelocity.dot(normal);

      // Only bounce if asteroids are moving toward each other
      if (impulse > 0) {
        velocity -= normal * impulse;
        other.velocity += normal * impulse;
      }
    }
  }
}
