
// lib/features/past_requests/data/api/completed_requests_api_service.dart
import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:blood_bank_hospital/features/past_requests/data/model/pasts_requests_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'past_requests_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class PastRequestsApiService {
  factory PastRequestsApiService(Dio dio) = _PastRequestsApiService;

  @GET('DonationRequest/hospital/completed/16')
  Future<List<PastsRequestsModel>> getPastRequests();
}