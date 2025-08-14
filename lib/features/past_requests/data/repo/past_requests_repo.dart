

import 'package:blood_bank_hospital/features/past_requests/data/api/past_requests_api_service.dart';

class PastRequestsRepo {
  final PastRequestsApiService _pastRequestsApiService;

  PastRequestsRepo(this._pastRequestsApiService);

  // Future<ApiResult<HospitalsResponseModel>> getSpecialization() async {
  //   try {
  //     final response = await _hospitalsApiService.getHospitals();
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ErrorHandler.handle(error));
  //   }
  // }
}
