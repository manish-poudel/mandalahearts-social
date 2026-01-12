import 'package:flutter/material.dart';

/// 🌿 Calm, spiritual green color scheme
final ColorScheme lightColorScheme = const ColorScheme(
  brightness: Brightness.light,

  /// Primary actions & highlights
  primary: Color(0xFF228B22), // sage green
  onPrimary: Colors.white,

  /// Secondary backgrounds & subtle surfaces
  secondary: Color(0xFFEEF3F1), // soft mint-grey
  onSecondary: Color(0xFF1E2A26),

  /// Accent color (sparingly used)
  tertiary: Color(0xFF6FAF8E),
  onTertiary: Colors.white,

  /// Main surfaces
  surface: Color(0xFFFAFBFA), // warm white
  onSurface: Color(0xFF1E2A26),

  /// Error
  error: Color(0xFFD32F2F),
  onError: Colors.white,
);

/// ✍️ Typography — soft & readable
// final TextTheme lightTextTheme = const TextTheme(
//   bodyMedium: TextStyle(fontSize: 15, height: 1.5, color: Color(0xFF1E2A26)),
//   bodyLarge: TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF1E2A26)),
//   headlineSmall: TextStyle(
//     fontSize: 24,
//     fontWeight: FontWeight.w300,
//     height: 1.3,
//     color: Color(0xFF1E2A26),
//   ),
// );

/// 🔘 Primary CTA button (soft & grounded)
final OutlinedButtonThemeData outlinedLightButtonTheme =
    OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        // Using primary for background and onPrimary for text/icons
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,

        // Borders and Shapes
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),

        // Layout and Sizing
        minimumSize: const Size(double.infinity, 52), // Default app-wide height
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );

/// 🧭 AppBar — airy, quiet
final AppBarTheme lightAppBarTheme = const AppBarTheme(
  backgroundColor: Color(0xFFFAFBFA),
  elevation: 0,
  centerTitle: false,
  titleTextStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1E2A26),
  ),
  iconTheme: IconThemeData(color: Color(0xFF1E2A26)),
);

/// ✍️ Inputs — soft focus, no harsh borders
final InputDecorationThemeData lightInputDecorationTheme =
    InputDecorationThemeData(
      hintStyle: TextStyle(color: Color(0xFF8FA6A0), fontSize: 15),
      labelStyle: TextStyle(color: Color(0xFF1E2A26)),
      floatingLabelStyle: TextStyle(color: Color(0xFF2F6F59)),
      border: InputBorder.none,
    );

/// 🎯 Final ThemeData
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surface,

  outlinedButtonTheme: outlinedLightButtonTheme,
  appBarTheme: lightAppBarTheme,
  inputDecorationTheme: lightInputDecorationTheme,

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: lightColorScheme.primary,
    selectionColor: lightColorScheme.secondary,
    selectionHandleColor: lightColorScheme.primary,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: const CircleBorder(),
    backgroundColor: lightColorScheme.primary,
    foregroundColor: Colors.white,
    elevation: 4,
  ),
);
