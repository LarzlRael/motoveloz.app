import 'package:WaraShops/data/theme_colors.dart';
import 'package:flutter/material.dart';

const colorList = <Color>[
  primaryColor,
  /* hex color */

  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;
  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(selectedColor >= 0, 'Color index must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Color index must be less than ${colorList.length}');
  ThemeData getTheme() => ThemeData(
        /* useMaterial3: true, */
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: Color(0xFF8200),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) =>
      AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
