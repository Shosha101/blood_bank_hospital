

import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'settings_api_service.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class SettingsApiService {
  factory SettingsApiService(Dio dio) = _SettingsApiService;

  // @GET(HospitalsApiConstants.hospitals)
  // Future<HospitalsResponseModel> getHospitals();
}