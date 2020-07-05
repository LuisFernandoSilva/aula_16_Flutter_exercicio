import 'package:aula_16_flutter_exercicio/card_screen.dart';
import 'package:aula_16_flutter_exercicio/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    String numberCard;
    String name;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "home_screen": (context) => Home(),
        "card_screen": (context) => CardScreen(name, numberCard),
      },
      home: Home(),
    );
  }

  @override
  void dispose() {
    _enableRotation();
  }
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _enableRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
