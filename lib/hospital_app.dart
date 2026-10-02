import 'package:blood_bank_hospital/core/helpers/shared_preference.dart';
import 'package:blood_bank_hospital/core/routing/app_router.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:blood_bank_hospital/features/login/logic/login_cubit.dart';
import 'package:blood_bank_hospital/features/login/logic/login_state.dart';
import 'package:blood_bank_hospital/features/login/ui/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class HospitalApp extends StatefulWidget {
  final AppRouter appRouter;
  const HospitalApp({super.key, required this.appRouter});

  @override
  State<HospitalApp> createState() => _HospitalAppState();
}

class _HospitalAppState extends State<HospitalApp> {
  // Created once, so switching the language does not restart the session check.
  late final LoginCubit _loginCubit = GetIt.I<LoginCubit>();
  late final Future<String?> _storedRoute = SharedPrefHelper.getSecuredString(
    'currentRoute',
  );

  // True until the saved session has been checked. A later loading state is a
  // sign-in in progress, and the login screen stays up to show its result.
  bool _restoringSession = true;

  @override
  void dispose() {
    _loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginCubit,
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
                onGenerateTitle: (context) => context.tr('app_name'),
                theme: AppTheme.light,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                home: FutureBuilder<String?>(
                  future: _storedRoute,
                  builder: (context, snapshot) {
                    return BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is! LoginStateLoading) {
                          _restoringSession = false;
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginStateSuccess) {
                          // Use stored route if available, else default to DashBoardScreen
                          final route = snapshot.data ?? Routes.dashboardScreen;
                          return Navigator(
                            initialRoute: route,
                            onGenerateRoute: widget.appRouter.generateRoute,
                          );
                        } else if (state is LoginStateLoading &&
                            _restoringSession) {
                          return const Scaffold(
                            body: Center(child: CircularProgressIndicator()),
                          );
                        } else {
                          return const LoginScreen();
                        }
                      },
                    );
                  },
                ),
                onGenerateRoute: widget.appRouter.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
