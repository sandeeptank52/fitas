import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData myTheme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: const Color(0xFFF1F3F4),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan)
        .copyWith(secondary: Colors.tealAccent),
  );

  static final ThemeData myDarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.grey[800],
    dividerColor: Colors.grey[600],
    highlightColor: Colors.blue[300],
    splashColor: Colors.blue[300],
    indicatorColor: Colors.white,
    textTheme: TextTheme(
      bodyLarge: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        color: Colors.grey[400],
        fontSize: 14.0,
      ),
      titleLarge: const TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ).titleLarge,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: Colors.white),
    colorScheme: const ColorScheme.dark(
      primary: Colors.grey,
      secondary: Colors.green,
    ).copyWith(secondary: Colors.grey).copyWith(background: Colors.grey[900]),
  );

}

class HexColor{
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
