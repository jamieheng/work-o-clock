import 'dart:math';
import 'package:flutter/material.dart';

Color generateLightColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(128) + 127, // Red component (127 to 255)
    random.nextInt(128) + 127, // Green component (127 to 255)
    random.nextInt(128) + 127, // Blue component (127 to 255)
  );
}
