import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:game/components/santa_component.dart';
import 'package:game/constants/globals.dart';
import 'package:game/game/game.dart';

class GiftSpriteComponent extends SpriteComponent
    with HasGameRef<GiftGrabGame>, CollisionCallbacks {
  final double _spriteHeigh = 200;
  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.giftSprite);
    height = width = _spriteHeigh;
    position = _getRandomPostion();
    anchor = Anchor.center;

    add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is SantaComponent) {
      FlameAudio.play(Globals.itemGrabSound);

      removeFromParent();

      gameRef.score += 1;
      gameRef.add(GiftSpriteComponent());
    }
  }

  Vector2 _getRandomPostion() {
    double x = _random.nextInt(gameRef.size.x.toInt()).toDouble();
    double y = _random.nextInt(gameRef.size.x.toInt()).toDouble();

    return Vector2(x, y);
  }
}
