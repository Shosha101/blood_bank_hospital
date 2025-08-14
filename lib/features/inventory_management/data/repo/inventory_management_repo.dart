

import 'package:blood_bank_hospital/features/inventory_management/data/api/inventory_management_api_service.dart';

class InventoryManagementRepo {
  final InventoryManagementApiService _inventoryManagementApiService;

  InventoryManagementRepo(this._inventoryManagementApiService);

  // Future<ApiResult<HospitalsResponseModel>> getSpecialization() async {
  //   try {
  //     final response = await _hospitalsApiService.getHospitals();
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ErrorHandler.handle(error));
  //   }
  // }
}
