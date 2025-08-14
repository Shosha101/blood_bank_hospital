

import 'package:blood_bank_hospital/features/dashboard/data/api/dashboard_api_service.dart';

class DashboardRepo {
  final DashboardApiService _dashboardApiService;

  DashboardRepo(this._dashboardApiService);

  // Future<ApiResult<HospitalsResponseModel>> getSpecialization() async {
  //   try {
  //     final response = await _hospitalsApiService.getHospitals();
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ErrorHandler.handle(error));
  //   }
  // }
}
