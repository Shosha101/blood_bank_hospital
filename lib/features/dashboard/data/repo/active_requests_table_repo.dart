
// lib/features/active_requests/data/repo/active_requests_repo.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/active_requests_table_api_service.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/active_requests_model.dart';

class ActiveRequestsRepo {
  final ActiveRequestsApiService _activeRequestsApiService;

  ActiveRequestsRepo(this._activeRequestsApiService);

  Future<ApiResult<List<ActiveRequestsModel>>> getActiveRequests() async {
    try {
      final requests = await _activeRequestsApiService.getActiveRequests();
      return ApiResult.success(requests);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}