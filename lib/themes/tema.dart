import 'package:flutter/material.dart';

class Tema {
  static const Color primario = Colors.black;
  static final ThemeData TemaApp = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: primario,
      iconTheme: IconThemeData(color: Colors.white), // Añadido para que los iconos sean blancos
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white), // Añadido para que el texto sea blanco
    ),
  );
}
