import 'package:blood_bank_hospital/core/networking/api_service.dart';
import 'package:blood_bank_hospital/core/networking/dio_factory.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/active_requests_table_api_service.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/blood_type_api_service.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/donation_request_api_service.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/summary_card_api_service.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/active_requests_table_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/blood_type_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/donation_request_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/summary_card_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/blood_type_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_cubit.dart';
import 'package:blood_bank_hospital/features/login/data/api/login_api_service.dart';
import 'package:blood_bank_hospital/features/login/data/repo/login_repo.dart';
import 'package:blood_bank_hospital/features/login/logic/login_cubit.dart';
import 'package:blood_bank_hospital/features/settings/data/api/hospital_api_service.dart';
import 'package:blood_bank_hospital/features/settings/data/repo/hospital_repo.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/api/inventory_management_api_service.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/repo/inventory_management_repo.dart';
import 'package:blood_bank_hospital/features/settings/logic/hospital_cubit.dart';
import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_cubit.dart';
import 'package:blood_bank_hospital/features/past_requests/data/api/past_requests_api_service.dart';
import 'package:blood_bank_hospital/features/past_requests/data/repo/past_requests_repo.dart';
import 'package:blood_bank_hospital/features/past_requests/logic/past_requests_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  try {
    DioFactory.resetDio();
    Dio dio = await DioFactory.getDio(useCorsProxy: false);
    getIt.registerLazySingleton<Dio>(() => dio);
    getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

    // Summary Card
    getIt.registerLazySingleton<SummaryCardApiService>(
      () => SummaryCardApiService(dio),
    );
    getIt.registerLazySingleton<SummaryCardRepo>(
      () => SummaryCardRepo(getIt()),
    );
    getIt.registerFactory<SummaryCardCubit>(() => SummaryCardCubit(getIt()));

    // Active Requests
    getIt.registerLazySingleton<ActiveRequestsApiService>(
      () => ActiveRequestsApiService(dio),
    );
    getIt.registerLazySingleton<ActiveRequestsRepo>(
      () => ActiveRequestsRepo(getIt()),
    );
    getIt.registerFactory<ActiveRequestsCubit>(
      () => ActiveRequestsCubit(getIt()),
    );

    // Inventory
    getIt.registerLazySingleton<InventoryApiService>(
      () => InventoryApiService(dio),
    );
    getIt.registerLazySingleton<InventoryRepo>(() => InventoryRepo(getIt()));
    getIt.registerFactory<InventoryCubit>(() => InventoryCubit(getIt()));

    // Completed Requests
    getIt.registerLazySingleton<PastRequestsApiService>(
      () => PastRequestsApiService(dio),
    );
    getIt.registerLazySingleton<PastRequestsRepo>(
      () => PastRequestsRepo(getIt()),
    );
    getIt.registerFactory<PastRequestsCubit>(() => PastRequestsCubit(getIt()));

    // Donation Request
    getIt.registerLazySingleton<DonationRequestApiService>(
      () => DonationRequestApiService(dio),
    );
    getIt.registerLazySingleton<DonationRequestRepo>(
      () => DonationRequestRepo(getIt()),
    );
    getIt.registerFactory<DonationRequestCubit>(
      () => DonationRequestCubit(
        getIt<DonationRequestRepo>(),
        getIt<ActiveRequestsRepo>(),
      ),
    );

    // Blood Types
    getIt.registerLazySingleton<BloodTypeApiService>(
      () => BloodTypeApiService(dio),
    );
    getIt.registerLazySingleton<BloodTypeRepo>(() => BloodTypeRepo(getIt()));
    getIt.registerFactory<BloodTypeCubit>(() => BloodTypeCubit(getIt()));

    // Hospital
    getIt.registerLazySingleton<HospitalApiService>(
      () => HospitalApiService(dio),
    );
    getIt.registerLazySingleton<HospitalRepo>(() => HospitalRepo(getIt()));
    getIt.registerFactory<HospitalCubit>(() => HospitalCubit(getIt()));

    // Login
    getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
    getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepo(getIt<LoginApiService>(), getIt<Dio>()),
    );
    getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  } catch (e) {
    print('Error initializing setupGetIt: $e');
  }
}
