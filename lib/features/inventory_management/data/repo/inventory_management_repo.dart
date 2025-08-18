
// lib/features/inventory_management/data/repo/inventory_repo.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/api/inventory_management_api_service.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/model/inventory_management_model.dart';

class InventoryRepo {
  final InventoryApiService _inventoryApiService;

  InventoryRepo(this._inventoryApiService);

  Future<ApiResult<List<InventoryModel>>> getInventory() async {
    try {
      final inventory = await _inventoryApiService.getInventory();
      return ApiResult.success(inventory);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  
  Future<ApiResult<void>> updateInventory(InventoryModel inventory) async {
    try {
      await _inventoryApiService.updateInventory(inventory.id, inventory);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}