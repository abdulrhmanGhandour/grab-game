import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame/game.dart';
import 'package:game/components/background_component.dart';
import 'package:game/components/gift_sprite_component.dart';
import 'package:game/components/ice_components.dart';
import 'package:game/components/santa_component.dart';
import 'package:game/constants/globals.dart';
import 'package:game/input/joystick.dart';
import 'package:game/view/game_over_menu.dart';

class GiftGrabGame extends FlameGame with DragCallbacks, HasCollisionDetection {
  int score = 0;
  late Timer _timer;
  int _remainingTime = 30;
  late TextComponent _scoreText;
  late TextComponent _timeText;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());
    add(SantaComponent(joystick: joystick));
    add(GiftSpriteComponent());
    add(joystick);

    FlameAudio.audioCache.loadAll(
      [Globals.itemGrabSound, Globals.freezeSound],
    );

    add(
      IceComponent(startPostion: Vector2(200, 200)),
    );
    add(
      IceComponent(
        startPostion: Vector2(size.x - 200, size.y - 200),
      ),
    );

    add(ScreenHitbox());

    _scoreText = TextComponent(
      text: 'Score: $score',
      position: Vector2(40, 50),
      anchor: Anchor.topLeft,
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.white.color,
          fontSize: 50,
        ),
      ),
    );
    add(_scoreText);

    _timeText = TextComponent(
      text: 'time: $_remainingTime seconds',
      position: Vector2(size.x - 40, 50),
      anchor: Anchor.topRight,
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.white.color,
          fontSize: 50,
        ),
      ),
    );
    add(_timeText);

    _timer = Timer(
      1,
      repeat: true,
      onTick: () {
        if (_remainingTime == 0) {
          pauseEngine();
          overlays.add(GameOverMenu.id);
        } else {
          _remainingTime -= 1;
        }
      },
    );
    _timer.start();
  }

  @override
  void update(double dt) {
    super.update(dt);

    _timer.update(dt);
    _scoreText.text = 'Score : $score';
    _timeText.text = 'Time : $_remainingTime sec';
  }
  void rest(){
    score = 0;
    _remainingTime =30;

  }
}
