import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:town_square/features/activity_screen/view/main_activity.dart';
import 'package:town_square/features/activity_screen/viewmodel/bloc/activity_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "SFProDisplay",
        ),
        home: const MainActivity(),
      ),
    );
  }
}
