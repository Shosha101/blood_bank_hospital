import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/donation_request_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'donation_request_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class DonationRequestApiService {
  factory DonationRequestApiService(Dio dio) = _DonationRequestApiService;

  @POST('/DonationRequest/')
  Future<DonationRequestModel> createDonationRequest(@Body() DonationRequestModel request);
}