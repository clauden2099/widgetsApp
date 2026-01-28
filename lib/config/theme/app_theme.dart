import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
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

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(selectedColor >= 0, "Selected color must be grater then 0"),
      assert(
        selectedColor < colorList.length,
        "Selected color must be less or equal than ${colorList.length - 1}",
      );

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(centerTitle: false),
  );

  //Sirve para copiar o regresa una nueva instancia de la clase
  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
