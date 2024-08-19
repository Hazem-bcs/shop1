import 'package:flutter/material.dart';

ThemeData getLightThemeData() => ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 17,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 22,
        ),
      ),
      scaffoldBackgroundColor: const Color(0x163978FF),
      colorScheme: const ColorScheme.light(
        primary: Colors.orange,
        onPrimary: Colors.white,
        secondary: Colors.black,
        onSecondary: Colors.orange,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      textTheme: TextTheme(
        titleLarge: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            shadows: [
              BoxShadow(offset: Offset(1, 2)),
            ],
            color: Colors.white),
        titleMedium: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white,
          shadows: [
            BoxShadow(offset: Offset(1, 2)),
          ],
        ),
        titleSmall: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            shadows: [
              BoxShadow(offset: Offset(1, 2)),
            ],
            color: Colors.white),
        bodyLarge: const TextStyle(
          fontSize: 20,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: const TextStyle(
          fontSize: 16,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodySmall: const TextStyle(
          fontSize: 14,
          fontFamily: "Cairo",
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white,
        ),
        labelMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white,
        ),
        labelSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          color: Colors.white70,
        ),
        displayLarge: TextStyle(
            letterSpacing: 1,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            color: Colors.black,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 4),
              ),
            ]),
        displayMedium: TextStyle(
            letterSpacing: 2,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            color: Colors.black,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 4),
              ),
            ]),
        displaySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            color: Colors.black,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 4),
              ),
            ]),
      ),
      iconTheme: const IconThemeData(
        size: 25,
        color: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.white,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        iconTheme: WidgetStatePropertyAll(
          IconThemeData(color: Colors.white, size: 25),
        ),
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(color: Colors.white70, fontFamily: 'Roboto'),
        ),
        backgroundColor: Colors.transparent,
        height: 60,
      ),
      fontFamily: "Cairo",
    );
