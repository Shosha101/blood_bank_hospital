// lib/features/summary_card/data/repo/summary_card_repo.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/summary_card_api_service.dart';

class SummaryCardRepo {
  final SummaryCardApiService _summaryCardApiService;

  SummaryCardRepo(this._summaryCardApiService);

  Future<ApiResult<int>> getOpenRequestsCount() async {
    try {
      final count = await _summaryCardApiService.getOpenRequestsCount();
      return ApiResult.success(count);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<int>> getPendingRequestsCount() async {
    try {
      final count = await _summaryCardApiService.getPendingRequestsCount();
      return ApiResult.success(count);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}