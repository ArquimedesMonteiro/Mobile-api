import 'package:flutter/material.dart';
import 'package:api_mercado/screens/HomeScreen.dart';
import 'package:api_mercado/screens/PerfilScreen.dart';
import 'package:api_mercado/screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        "/": (context) => const Splashscreen(),
        "/home": (context) => const Homescreen(),
        "/perfil": (context) => const Perfilscreen(),
      },
    );
  }
}