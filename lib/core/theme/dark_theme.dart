import 'package:flutter/material.dart';

ThemeData getDarkThemeData() => ThemeData(
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
        backgroundColor: Color(0XFF262626),
        /*
      Color MainColor = Color(0XFFF4C750);
      Color PrimaryColor = Color(0XFF1E1E1E);
      Color SecondaryColor = Color(0XFF2C2C2C);
      Color tColor = Color(0XFF161616);
      Color iconBack = Color(0XFF262626);

     */
      ),
      scaffoldBackgroundColor: const Color(0XFF262626),
      colorScheme: const ColorScheme.dark(
        primary: Color(0XFFFFD369),
        onPrimary: Color(0XFF161616),
        secondary: Colors.white,
        onSecondary: Color(0XFF2C2C2C),
        surface: Color(0XFF161616),
        onSurface: Colors.white,
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
          fontSize: 15,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontFamily: "Cairo",
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: const TextStyle(
          fontSize: 20,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
          color: Color(0XFFF4C750),
        ),
        labelMedium: const TextStyle(
          fontSize: 15,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
          color: Color(0XFFF4C750),
        ),
        labelSmall: const TextStyle(
          fontSize: 12,
          fontFamily: "Cairo",
          color: Color(0XFFF4C750),
          fontWeight: FontWeight.bold,
        ),
        displayLarge: TextStyle(
            letterSpacing: 1,
            fontSize: 34,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
            color: Colors.white,
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
            color: Colors.white,
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
            color: Colors.white,
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
      listTileTheme: ListTileThemeData(
          iconColor: Colors.white,
          subtitleTextStyle: TextStyle(
            fontSize: 14,
            fontFamily: "Cairo",
            color: Colors.grey[400],
            fontWeight: FontWeight.bold,
          )),
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
      tabBarTheme: const TabBarTheme(labelStyle: TextStyle(fontSize: 2)),
      fontFamily: "Cairo",
    );
