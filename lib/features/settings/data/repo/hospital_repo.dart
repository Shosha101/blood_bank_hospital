import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/settings/data/api/hospital_api_service.dart';
import 'package:blood_bank_hospital/features/settings/data/model/hospital_model.dart';

class HospitalRepo {
  final HospitalApiService _hospitalApiService;

  HospitalRepo(this._hospitalApiService);

  Future<ApiResult<HospitalModel>> getHospitalData() async {
    try {
      final hospitals = await _hospitalApiService.getHospitalData();
      if (hospitals.isNotEmpty) {
        return ApiResult.success(hospitals.first);
      } else {
        return ApiResult.failure(ErrorHandler.handle(Exception('No hospital data found')));
      }
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}