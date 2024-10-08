import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Light Mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.outfitTextTheme(
    ThemeData.light().textTheme,
  ),
  colorScheme: ColorScheme.light(
    surface: const Color(0xFFfafaf4),
    primary: Colors.grey.shade500,
    secondary: const Color(0xFF13131A),
    onPrimary: const Color(0xFFff0000),
    inversePrimary: Colors.yellow,
  ),
);

// Dark Mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  textTheme: GoogleFonts.outfitTextTheme(
    ThemeData.light().textTheme,
  ),
  colorScheme: ColorScheme.dark(
    surface: const Color(0xFF13131A),
    primary: Colors.grey.shade900,
    secondary: const Color(0xFFfafaf4),
    onPrimary: Colors.yellow,
    inversePrimary: const Color(0xFFff0000),
  ),
);
