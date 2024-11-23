import 'package:flutter/material.dart';
import 'package:town_square/features/activity_screen/main_activity.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainActivity(),
    );
  }
}
