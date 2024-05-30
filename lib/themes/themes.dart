import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTheme {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return isDarkTheme
        ? ThemeData(
            fontFamily: 'RedditMono-Bold',
            scaffoldBackgroundColor: Color.fromARGB(255, 194, 193, 193),
            primarySwatch: Colors.grey,
            primaryColorDark: const Color.fromARGB(255, 0, 0, 0),
            dividerColor: Colors.white,
            disabledColor: Colors.grey,
            cardColor: const Color(0xFF444654),
            canvasColor: const Color.fromARGB(255, 175, 175, 175),
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
              color: Color.fromARGB(255, 175, 175, 175),
            ),
            buttonTheme: Theme.of(context)
                .buttonTheme
                .copyWith(colorScheme: const ColorScheme.dark()),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black), // Default body text
              bodyMedium: TextStyle(color: Colors.black), // Secondary body text
              displayLarge: TextStyle(color: Colors.black),
              displayMedium: TextStyle(color: Colors.black),
              displaySmall: TextStyle(color: Colors.black),
              headlineMedium: TextStyle(color: Colors.black),
              headlineSmall: TextStyle(color: Colors.black),
              titleLarge: TextStyle(color: Colors.black),
              titleMedium: TextStyle(color: Colors.black),
              titleSmall: TextStyle(color: Colors.black),
              bodySmall: TextStyle(color: Colors.black),
              labelSmall: TextStyle(color: Colors.black),
              labelLarge: TextStyle(color: Colors.black),
            ),
          )
        : ThemeData(
            fontFamily: 'RedditMono-Bold',
            scaffoldBackgroundColor: Color.fromARGB(255, 208, 207, 207),
            primarySwatch: Colors.grey,
            primaryColorDark: const Color.fromARGB(255, 0, 0, 0),
            dividerColor: Colors.black,
            disabledColor: Colors.grey,
            cardColor: Colors.white,
            canvasColor: Colors.grey[50],
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            buttonTheme: Theme.of(context)
                .buttonTheme
                .copyWith(colorScheme: const ColorScheme.light()),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black), // Default body text
              bodyMedium: TextStyle(color: Colors.black), // Secondary body text
              displayLarge: TextStyle(color: Colors.black),
              displayMedium: TextStyle(color: Colors.black),
              displaySmall: TextStyle(color: Colors.black),
              headlineMedium: TextStyle(color: Colors.black),
              headlineSmall: TextStyle(color: Colors.black),
              titleLarge: TextStyle(color: Colors.black),
              titleMedium: TextStyle(color: Colors.black),
              titleSmall: TextStyle(color: Colors.black),
              bodySmall: TextStyle(color: Colors.black),
              labelSmall: TextStyle(color: Colors.black),
              labelLarge: TextStyle(color: Colors.black),
            ),
          );
  }
}
