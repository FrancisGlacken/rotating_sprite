import 'dart:ui';
import 'package:flame/anchor.dart';
import 'package:flame/game.dart';
import 'package:flame/components/sprite_component.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flame/game/base_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final game = ExampleGame();
  runApp(GameWidget(game: game));
}

class ExampleGame extends BaseGame {
  SpriteComponent planetComponent; 

  @override
  Future<void> onLoad() async {
    final Image planetImage = await images.load('planet.png');
    final Vector2 spriteSize = Vector2(100, 100);

    // Create a SpriteComponent with size and image, then center the component's position and anchor
    planetComponent = SpriteComponent.fromImage(spriteSize, planetImage)
    ..x = size.x/2
    ..y = size.y/2
    ..anchor = Anchor.center;

    // Add the component to game
    add(planetComponent);
  }

  @override
    void update(double t) {
      super.update(t);

      // Rotate the component(Rotate clockwise)
      planetComponent.angle = planetComponent.angle + t; 
    } 

}
