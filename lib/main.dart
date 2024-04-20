import 'package:flutter/material.dart';
import 'pages/greeting_page.dart';
import 'pages/calculator_page.dart';
import 'pages/api_page.dart';
import 'pages/notes_page.dart';
import 'pages/measurement_converter_page.dart';  // Import the new page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tools App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GreetingPage(),
        '/calculator': (context) => CalculatorPage(),
        '/api': (context) => ApiPage(),
        '/notes': (context) => NotesPage(),
        '/converter': (context) => MeasurementConverterPage(),  // Add new route
      },
    );
  }
}
