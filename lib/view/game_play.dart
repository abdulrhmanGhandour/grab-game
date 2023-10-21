import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:game/game/game.dart';
import 'package:game/view/game_over_menu.dart';

final GiftGrabGame _giftGrabGame = GiftGrabGame();

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _giftGrabGame,
      overlayBuilderMap: {
        GameOverMenu.id: (BuildContext context, GiftGrabGame gameRef) =>
            GameOverMenu(gameRef: gameRef),
      },
    );
  }
}
