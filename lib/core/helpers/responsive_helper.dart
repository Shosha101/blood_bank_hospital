import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveHelper {
  /// Calculates responsive form width based on screen width.
  /// - Mobile (<600px): 90% of screen width
  /// - Tablet (600–900px): 70% of screen width, capped at 600.w
  /// - Web (≥900px): Fixed at 460.w
  static double getFormWidth(double screenWidth) {
    if (screenWidth < 600) {
      return screenWidth * 0.9;
    } else if (screenWidth < 900) {
      return screenWidth * 0.7 > 600.w ? 600.w : screenWidth * 0.7;
    } else {
      return 460.w;
    }
  }

  /// Returns responsive padding based on device type.
  /// - Mobile (<600px): 16.w
  /// - Tablet/Web (≥600px): 24.w
  static double getHorizontalPadding(double screenWidth) {
    return screenWidth < 600 ? 16.w : 24.w;
  }

  /// Returns responsive title font size.
  /// - Mobile (<600px): 28.sp
  /// - Tablet/Web (≥600px): 32.sp
  static double getTitleFontSize(double screenWidth) {
    return screenWidth < 600 ? 28.sp : 32.sp;
  }
}