import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData bookThemeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.amber[700],
      fontFamily: GoogleFonts.ubuntu().fontFamily,
      textTheme: TextTheme(
          headline1: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText1: const TextStyle(fontSize: 14, color: Colors.black87),
          subtitle1: const TextStyle(fontSize: 14, color: Colors.black54),
          headline2: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.oswald().fontFamily),
          button: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)));
}
