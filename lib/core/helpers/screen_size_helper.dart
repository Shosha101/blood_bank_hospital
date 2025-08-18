import 'package:flutter/material.dart';

class ScreenSizeHelper {
  /// Get screen width
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// Get screen height
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// Get screen orientation
  static Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;
}
