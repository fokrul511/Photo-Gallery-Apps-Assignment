import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xff2CAB00),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff2CAB00),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const PhotoGallery(),
    );
  }
}
