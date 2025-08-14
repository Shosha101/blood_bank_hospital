

import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'dashboard_api_service.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class DashboardApiService {
  factory DashboardApiService(Dio dio) = _DashboardApiService;

  // @GET(HospitalsApiConstants.hospitals)
  // Future<HospitalsResponseModel> getHospitals();
}