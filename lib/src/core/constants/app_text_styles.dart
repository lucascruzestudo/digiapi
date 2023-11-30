import 'package:flutter/material.dart';

class AppTextStyles {
  static const double smallFontSize = 14.0;
  static const double defaultFontSize = 17.0;
  static const double bigFontSize = 20.0;

  static const FontWeight defaultFontWeight = FontWeight.w400;
  static const FontWeight defaultSemiBoldFontWeight = FontWeight.w500;
  static const FontWeight defaultBoldFontWeight = FontWeight.w600;

  static TextStyle regular = const TextStyle(
    fontSize: defaultFontSize,
  );

  static TextStyle title = const TextStyle(
    fontSize: bigFontSize,
    fontWeight: defaultSemiBoldFontWeight,
  );
}
