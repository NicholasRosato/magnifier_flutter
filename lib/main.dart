// Code written by Nicholas Rosato
// main.dart
// Magnifier client application
// last updated 11/16/2021

import 'package:flutter/material.dart';
import 'route/route.dart' as route;

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magnifier App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: route.controller,
      initialRoute: route.homePage,
    );
  }
}

