import 'package:flutter/material.dart';
import 'package:town_square/features/activity_screen/view/main_activity.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.amber)),
      home: MainActivity(),
    );
  }
}
