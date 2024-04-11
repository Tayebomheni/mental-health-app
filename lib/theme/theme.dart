import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade100,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
  )
);

ThemeData darkMode  = ThemeData(
  brightness: Brightness.dark, 
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 53, 53, 54),
    primary: Color.fromARGB(255, 84, 82, 82),
     secondary: Colors.grey.shade700,
  )
  );