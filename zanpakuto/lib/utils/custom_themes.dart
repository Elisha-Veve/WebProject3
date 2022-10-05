import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      drawerTheme: DrawerThemeData(backgroundColor: const Color(0xFF053B52)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFF053B52),
          selectedItemColor: const Color(0xFFFFFFFF),
          unselectedItemColor: const Color(0xFFB0B0B0)),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF049DBF),
        secondary: const Color(0xFF025E73),
      ));

  static final darkTheme = ThemeData(
      drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF053B52)),
      scaffoldBackgroundColor: const Color(0xFF053B52),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color(0xFF89CAD9),
        secondary: const Color(0xFF025E73),
        tertiary: Color.fromARGB(255, 4, 63, 77),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.resolveWith((state) => Colors.white)),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.resolveWith((state) => Colors.white))));
}
