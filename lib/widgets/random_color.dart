import 'dart:math';
import 'package:flutter/material.dart';

Color getRandomLightColor() {
  final Random random = Random();
  final hue = random.nextDouble() * 360;
  final color = HSVColor.fromAHSV(
    1.0,                      // Opacity
    hue,                     // Hue: 0.0 to 360.0
    0.3 + random.nextDouble() * 0.3, // Saturation: 0.3 to 0.6
    0.85 + random.nextDouble() * 0.15, // Brightness: 0.85 to 1.0
  ).toColor();
  return color;
}
