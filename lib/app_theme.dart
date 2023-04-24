// Flutter imports:
import 'package:flutter/material.dart';

import 'constants/values/values.dart';

// Project imports:

ThemeData buildLightTheme() => ThemeData(
      unselectedWidgetColor: Colors.white,
      brightness: Brightness.light,
      fontFamily: 'Inter',
      textTheme: const TextTheme().apply(
        fontFamily: 'Inter',
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: CustomColors.accent100,
        selectionHandleColor: CustomColors.accent100,
      ),
    );

ThemeData buildDarkTheme() => ThemeData(
      scaffoldBackgroundColor: CustomColors.dark100,
      appBarTheme: const AppBarTheme(backgroundColor: CustomColors.dark100),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: CustomColors.dark90,
      ),
      unselectedWidgetColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => CustomColors.accent100.withOpacity(.5),
          ),
        ),
      ),
      brightness: Brightness.dark,
      fontFamily: 'Inter',
      textTheme: const TextTheme().apply(
        fontFamily: 'Inter',
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: CustomColors.accent100,
        selectionHandleColor: CustomColors.accent100,
      ),
    );
