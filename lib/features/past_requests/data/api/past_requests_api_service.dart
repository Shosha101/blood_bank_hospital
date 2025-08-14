

import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'past_requests_api_service.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class PastRequestsApiService {
  factory PastRequestsApiService(Dio dio) = _PastRequestsApiService;

  // @GET(HospitalsApiConstants.hospitals)
  // Future<HospitalsResponseModel> getHospitals();
}