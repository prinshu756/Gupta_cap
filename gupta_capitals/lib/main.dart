import 'package:flutter/material.dart';
import 'pages/landing_page.dart';

void main() {
  runApp(const GuptaCapitalsApp());
}

class GuptaCapitalsApp extends StatelessWidget {
  const GuptaCapitalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gupta Capitals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A3A5C),
          primary: const Color(0xFF1A3A5C),
          secondary: const Color(0xFFD4A843),
          surface: const Color(0xFFF7F4EF),
        ),
        fontFamily: 'Roboto',
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFD0C9BC), width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFD0C9BC), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF1A3A5C), width: 2.0),
          ),
          labelStyle: const TextStyle(fontSize: 16, color: Color(0xFF6B6154)),
        ),
      ),
      home: const LandingPage(),
    );
  }
}