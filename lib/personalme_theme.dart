import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Holds application theme definition.
///
/// Two definitions, light and dark mode.
class MonitoRingTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.openSans(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineLarge: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleSmall: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    labelLarge: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelMedium: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelSmall: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.openSans(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.grey[400],
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.grey[400],
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.grey[400],
    ),
    headlineLarge: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey[400],
    ),
    headlineMedium: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey[400],
    ),
    headlineSmall: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[400],
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[400],
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[400],
    ),
    titleSmall: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[400],
    ),
    labelLarge: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.grey[400],
    ),
    labelMedium: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.grey[400],
    ),
    labelSmall: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.grey[400],
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[400],
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[400],
    ),
    bodySmall: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[400],
    ),
  );

  // Custom color used for dark theme swatch
  static Map<int, Color> colorLightSwatch = {
    50: const Color.fromRGBO(250, 250, 250, 1),
    100: const Color.fromRGBO(250, 250, 250, 0.9),
    200: const Color.fromRGBO(250, 250, 250, 0.8),
    300: const Color.fromRGBO(250, 250, 250, 0.7),
    400: const Color.fromRGBO(250, 250, 250, 0.6),
    500: const Color.fromRGBO(250, 250, 250, 0.5),
    600: const Color.fromRGBO(250, 250, 250, 0.4),
    700: const Color.fromRGBO(250, 250, 250, 0.3),
    800: const Color.fromRGBO(250, 250, 250, 0.2),
    900: const Color.fromRGBO(250, 250, 250, 0.1),
  };

  static MaterialColor customLightSwatch =
      MaterialColor(0xFF90A4AE, colorLightSwatch);

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: customLightSwatch,
      scaffoldBackgroundColor: Colors.grey[200],
      appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(fontSize: 14.0, color: Colors.black),
        centerTitle: true,
        foregroundColor: Colors.grey[800],
        backgroundColor: Color.fromARGB(255, 124, 143, 145),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            const Size(165, 40),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[800],
      ),
      cardColor: Colors.grey.shade400,
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        textColor: Colors.black,
        collapsedBackgroundColor: Colors.grey[300],
        backgroundColor: Colors.grey[350],
      ),
      listTileTheme: const ListTileThemeData(
          style: ListTileStyle.list,
          tileColor: Colors.white,
          textColor: Colors.black,
          titleTextStyle: TextStyle(fontSize: 14.0)),
      textTheme: lightTextTheme,
    );
  }

  // Custom color used for dark theme swatch
  static Map<int, Color> colorDarkSwatch = {
    50: const Color.fromRGBO(250, 250, 250, 0.1),
    100: const Color.fromRGBO(250, 250, 250, 0.2),
    200: const Color.fromRGBO(250, 250, 250, 0.3),
    300: const Color.fromRGBO(250, 250, 250, 0.4),
    400: const Color.fromRGBO(250, 250, 250, 0.5),
    500: const Color.fromRGBO(250, 250, 250, 0.6),
    600: const Color.fromRGBO(250, 250, 250, 0.7),
    700: const Color.fromRGBO(250, 250, 250, 0.8),
    800: const Color.fromRGBO(250, 250, 250, 0.9),
    900: const Color.fromRGBO(250, 250, 250, 1),
  };

  static MaterialColor customDarkSwatch =
      MaterialColor(0x99FFFFFF, colorDarkSwatch);

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: customDarkSwatch,
      scaffoldBackgroundColor: Colors.grey[800],
      appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(fontSize: 14.0, color: Colors.white),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 63, 60, 60),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            const Size(165, 40),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey,
      ),
      cardColor: Colors.blueGrey,
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        textColor: Colors.white,
        collapsedBackgroundColor: Colors.grey[600],
        backgroundColor: Colors.grey[700],
      ),
      listTileTheme: ListTileThemeData(
          style: ListTileStyle.list,
          tileColor: Colors.grey[800],
          textColor: Colors.white,
          titleTextStyle: const TextStyle(fontSize: 14.0)),
      textTheme: darkTextTheme,
    );
  }
}
