
// lib/features/active_requests/data/api/active_requests_api_service.dart
import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/active_requests_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'active_requests_table_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ActiveRequestsApiService {
  factory ActiveRequestsApiService(Dio dio) = _ActiveRequestsApiService;

  @GET('DonationRequest/hospital/active/14')
  Future<List<ActiveRequestsModel>> getActiveRequests();
}