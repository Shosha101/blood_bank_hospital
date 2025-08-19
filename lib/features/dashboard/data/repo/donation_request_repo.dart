
// lib/features/dashboard/data/repo/donation_request_repo.dart
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/donation_request_api_service.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/donation_request_model.dart';

class DonationRequestRepo {
  final DonationRequestApiService _apiService;

  DonationRequestRepo(this._apiService);

  Future<ApiResult<DonationRequestModel>> createDonationRequest(
      DonationRequestModel request) async {
    return _apiService.createDonationRequest(request);
  }
}