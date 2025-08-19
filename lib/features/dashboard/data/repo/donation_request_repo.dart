import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/core/networking/dio_factory.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/donation_request_api_service.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/donation_request_model.dart';
import 'package:dio/dio.dart';

class DonationRequestRepo {
  final DonationRequestApiService _apiService;

  DonationRequestRepo(this._apiService);

  Future<ApiResult<DonationRequestModel>> createDonationRequest(
      DonationRequestModel request) async {
    try {
      final response = await _apiService.createDonationRequest(request);
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException && (e.response?.statusCode == 403 || e.response?.statusCode == 404)) {
        try {
          final retryDio = await DioFactory.getDio(useCorsProxy: true); // Use CORS proxy
          final retryService = DonationRequestApiService(retryDio);
          final retryResponse = await retryService.createDonationRequest(request);
          return ApiResult.success(retryResponse);
        } catch (retryError) {
          return ApiResult.failure(ErrorHandler.handle(retryError));
        }
      }
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}