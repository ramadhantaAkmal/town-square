import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  //This is used for enabling scroll to be dragged by mouse
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
