
import 'package:blood_bank_hospital/core/di/dependency_injection.dart';
import 'package:blood_bank_hospital/hospital_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize dependency injection
  setupGetIt();
  // Initialize screen util
  await ScreenUtil.ensureScreenSize();
  // Remove splash screen after initialization
  FlutterNativeSplash.remove();

  runApp(HospitalApp(
    appRouter: AppRouter(),
  ));
}