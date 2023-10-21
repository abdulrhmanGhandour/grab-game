import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/painting.dart';

JoystickComponent joystick = JoystickComponent(
  knob: CircleComponent(
    radius: 30,
    paint: BasicPalette.red.withAlpha(200).paint(),
  ),
  background: CircleComponent(
    radius: 100,
    paint: BasicPalette.red.withAlpha(200).paint(),
  ),
  margin: const EdgeInsets.only(bottom: 40, left: 40),
);
