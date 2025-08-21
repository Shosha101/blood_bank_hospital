import 'package:blood_bank_hospital/core/di/dependency_injection.dart';
import 'package:blood_bank_hospital/hospital_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  try {
    await setupGetIt();
    await ScreenUtil.ensureScreenSize();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  } catch (e) {
    print('Critical error during initialization: $e');
    runApp(const MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Initialization failed. Please try again.')),
      ),
    ));
    return;
  }

  runApp(HospitalApp(
    appRouter: AppRouter(),
  ));
}

