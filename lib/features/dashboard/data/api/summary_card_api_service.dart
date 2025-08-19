// lib/features/summary_card/data/api/summary_card_api_service.dart
import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'summary_card_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SummaryCardApiService {
  factory SummaryCardApiService(Dio dio) = _SummaryCardApiService;

  @GET('DonationRequest/hospital/open-requests/4')
  Future<int> getOpenRequestsCount();

  @GET('DonationRequest/hospital/pending-requests/4')
  Future<int> getPendingRequestsCount();
}