import 'package:flutter/material.dart';

// Colores
const Color backgroundColor = Color(0xFF160B1D);
const Color primaryColor = Color(0xFF8F355D);
const Color textColor = Color(0xFF3A3A4E);
const Color accentColor = Color(0xFF87B7F5);

//  Textos
const TextStyle titleStyle = TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.bold,
  color: Color(0xFFF7F1F8),

);

const TextStyle messageStyle = TextStyle(
  fontSize: 26,
  height: 1.5,
  fontStyle: FontStyle.italic,
  color: textColor,
);

const TextStyle buttonTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

// Estilo del botón
final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: primaryColor,
  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
  textStyle: buttonTextStyle,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
  ),
  elevation: 8,
);
