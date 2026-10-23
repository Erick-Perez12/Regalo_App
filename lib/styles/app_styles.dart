import 'package:flutter/material.dart';

class AppStyles {
  static const Color backgroundColor = Color(0xFF160B1D);
  static const Color wineColor = Color(0xFF8F355D);
  static const Color deepBlue = Color(0xFF355C9D);
  static const Color skyBlue = Color(0xFF87B7F5);
  static const Color softRose = Color(0xFFF0C8D8);
  static const Color textColor = Color(0xFFF7F1F8);
  static const Color secondaryTextColor = Color(0xFFE5D8E8);
  static const Color buttonYesColor = Color(0xFF4E7DC8);
  static const Color buttonNoColor = Color(0xFFB66A8B);

  static const TextStyle titleStyle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.6,
    height: 1.2,
    color: textColor,
    fontFamily: 'Georgia',
  );

  static const TextStyle messageStyle = TextStyle(
    fontSize: 21,
    height: 1.6,
    fontStyle: FontStyle.italic,
    color: secondaryTextColor,
    fontFamily: 'Georgia',
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    letterSpacing: 0.4,
  );

  static final ButtonStyle buttonStyleYes = ElevatedButton.styleFrom(
    backgroundColor: buttonYesColor,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    textStyle: buttonTextStyle,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 8,
    shadowColor: skyBlue.withValues(alpha: 0.25),
  );

  static final ButtonStyle buttonStyleNo = ElevatedButton.styleFrom(
    backgroundColor: buttonNoColor,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    textStyle: buttonTextStyle,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 8,
    shadowColor: wineColor.withValues(alpha: 0.25),
  );

  static final ButtonStyle buttonStylePrimary = ElevatedButton.styleFrom(
    backgroundColor: skyBlue.withValues(alpha: 0.94),
    foregroundColor: backgroundColor,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    textStyle: buttonTextStyle.copyWith(
      color: backgroundColor,
      fontWeight: FontWeight.w800,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 10,
    shadowColor: skyBlue.withValues(alpha: 0.35),
  );
}
