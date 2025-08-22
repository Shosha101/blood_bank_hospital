import 'package:blood_bank_hospital/core/helpers/shared_preference.dart';
import 'package:blood_bank_hospital/core/routing/app_router.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/core/theming/colors.dart';
import 'package:blood_bank_hospital/features/login/logic/login_cubit.dart';
import 'package:blood_bank_hospital/features/login/logic/login_state.dart';
import 'package:blood_bank_hospital/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class HospitalApp extends StatelessWidget {
  final AppRouter appRouter;
  const HospitalApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: GetIt.I<LoginCubit>()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Determine device type based on screen width
          final width = constraints.maxWidth;
          Size designSize;
          if (width < 390) {
            designSize = const Size(390, 844); // Mobile
          } else if (width < 600) {
            designSize = const Size(768, 1024); // Tablet
          } else {
            designSize = const Size(1280, 800); // Web
          }

          return ScreenUtilInit(
            designSize: designSize,
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'Hospital App',
                theme: ThemeData(
                  primaryColor: ColorsManager.mainBlue,
                  scaffoldBackgroundColor: Colors.white,
                  textTheme: TextTheme(
                    bodyMedium: TextStyle(fontSize: 16.sp),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: FutureBuilder<String?>(
                  future: SharedPrefHelper.getSecuredString('currentRoute'),
                  builder: (context, snapshot) {
                    return BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state is LoginStateSuccess) {
                          // Use stored route if available, else default to DashBoardScreen
                          final route = snapshot.data ?? Routes.dashboardScreen;
                          return Navigator(
                            initialRoute: route,
                            onGenerateRoute: appRouter.generateRoute,
                          );
                        } else if (state is LoginStateLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return const LoginScreen();
                        }
                      },
                    );
                  },
                ),
                onGenerateRoute: appRouter.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}