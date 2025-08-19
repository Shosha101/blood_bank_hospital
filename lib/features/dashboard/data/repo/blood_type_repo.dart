
// lib/features/dashboard/data/repo/blood_type_repo.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/dashboard/data/api/blood_type_api_service.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/blood_type_model.dart';

class BloodTypeRepo {
  final BloodTypeApiService _bloodTypeApiService;

  BloodTypeRepo(this._bloodTypeApiService);

  Future<ApiResult<List<BloodTypeModel>>> getBloodTypes() async {
    try {
      final bloodTypes = await _bloodTypeApiService.getBloodTypes();
      return ApiResult.success(bloodTypes);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}