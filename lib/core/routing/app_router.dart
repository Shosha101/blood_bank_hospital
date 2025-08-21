import 'package:blood_bank_hospital/core/helpers/shared_preference.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/features/dashboard/ui/dashboard_screen.dart';
import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_cubit.dart';
import 'package:blood_bank_hospital/features/inventory_management/ui/inventory_management_screen.dart';
import 'package:blood_bank_hospital/features/login/logic/login_cubit.dart';
import 'package:blood_bank_hospital/features/login/ui/login_screen.dart';
import 'package:blood_bank_hospital/features/past_requests/logic/past_requests_cubit.dart';
import 'package:blood_bank_hospital/features/past_requests/ui/past_requests_screen.dart';
import 'package:blood_bank_hospital/features/settings/logic/hospital_cubit.dart';
import 'package:blood_bank_hospital/features/settings/ui/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    final getIt = GetIt.instance;

    // Store the current route in SharedPreferences
    _saveCurrentRoute(settings.name);

    switch (settings.name) {
      case Routes.dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashBoardScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.pastRequestsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<PastRequestsCubit>(),
            child: const PastRequestsScreen(),
          ),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<HospitalCubit>()..getHospitalData(),
            child: const SettingsScreen(),
          ),
        );
      case Routes.inventoryManagementScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<InventoryCubit>(),
            child: const InventoryManagementScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }

  Future<void> _saveCurrentRoute(String? routeName) async {
    if (routeName != null && routeName != Routes.loginScreen) {
      await SharedPrefHelper.setSecuredString('currentRoute', routeName);
      print('Stored currentRoute: $routeName');
    }
  }
}