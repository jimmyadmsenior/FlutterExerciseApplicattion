import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/counter_screen_page.dart';
import 'package:flutter_application_2/pages/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: HomeScreen()),
      ),
    );
  }
}
