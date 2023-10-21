import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game/constants/globals.dart';
import 'package:game/game/game.dart';

class GameOverMenu extends StatelessWidget {
  const GameOverMenu({super.key, required this.gameRef});

  static const String id = 'GameOverMenu';
  final GiftGrabGame gameRef;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/${Globals.backgroundSprite}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Game Over',
                  style: TextStyle(
                    fontSize: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Score: ${gameRef.score}',
                  style: const TextStyle(
                    fontSize: 100,
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.remove(GameOverMenu.id);
                    gameRef.rest();
                    gameRef.resumeEngine();
                  },
                  child: const Text(
                    'Play Again?',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
