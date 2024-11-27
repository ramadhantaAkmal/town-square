import 'package:flutter/material.dart';

/// A widget that displays different layouts based on the screen size.
///
/// The [Responsive] widget is used to render different child widgets based
/// on the width of the screen. It can handle mobile, mobile large, tablet,
/// and desktop layouts.
class Responsive extends StatelessWidget {
  /// The widget to display on mobile screens.
  final Widget mobile;

  /// The widget to display on mobile large screens (optional).
  final Widget? mobileLarge;

  /// The widget to display on tablet screens (optional).
  final Widget? tablet;

  /// The widget to display on desktop screens.
  final Widget desktop;

  /// Creates a [Responsive] widget.
  ///
  /// The [mobile] and [desktop] widgets are required.
  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.mobileLarge,
  });

  /// Returns `true` if the screen width is less than or equal to 500 pixels.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500;

  /// Returns `true` if the screen width is less than or equal to 700 pixels.
  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= 700;

  /// Returns `true` if the screen width is less than 1024 pixels.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024;

  /// Returns `true` if the screen width is greater than or equal to 1024 pixels.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1024) {
      return desktop;
    } else if (size.width >= 700 && tablet != null) {
      return tablet!;
    } else if (size.width >= 500 && mobileLarge != null) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }
}
