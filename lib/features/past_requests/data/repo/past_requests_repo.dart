
// lib/features/past_requests/data/repo/completed_requests_repo.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/past_requests/data/api/past_requests_api_service.dart';
import 'package:blood_bank_hospital/features/past_requests/data/model/pasts_requests_model.dart';

class PastRequestsRepo {
  final PastRequestsApiService _pastRequestsApiService;

  PastRequestsRepo(this._pastRequestsApiService);

  Future<ApiResult<List<PastsRequestsModel>>> getPastRequests() async {
    try {
      final pastRequests = await _pastRequestsApiService.getPastRequests();
      return ApiResult.success(pastRequests);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}