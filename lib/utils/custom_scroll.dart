import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///a scroll behavior used for enabling scroll to be dragged by mouse
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
