
// lib/core/di/setup_get_it.dart
import 'package:blood_bank_hospital/core/networking/api_service.dart';
import 'package:blood_bank_hospital/core/networking/dio_factory.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/active_requests_table_api_service.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/summary_card_api_service.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/active_requests_table_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/summary_card_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_cubit.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Summary Card
  getIt.registerLazySingleton<SummaryCardApiService>(() => SummaryCardApiService(dio));
  getIt.registerLazySingleton<SummaryCardRepo>(() => SummaryCardRepo(getIt()));
  getIt.registerFactory<SummaryCardCubit>(() => SummaryCardCubit(getIt()));

  // Active Requests
  getIt.registerLazySingleton<ActiveRequestsApiService>(() => ActiveRequestsApiService(dio));
  getIt.registerLazySingleton<ActiveRequestsRepo>(() => ActiveRequestsRepo(getIt()));
  getIt.registerFactory<ActiveRequestsCubit>(() => ActiveRequestsCubit(getIt()));
}