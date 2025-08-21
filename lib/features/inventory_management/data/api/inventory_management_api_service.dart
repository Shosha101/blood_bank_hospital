
// lib/features/inventory_management/data/api/inventory_api_service.dart
import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/model/inventory_management_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'inventory_management_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class InventoryApiService {
  factory InventoryApiService(Dio dio) = _InventoryApiService;

  @GET('Inventory')
  Future<List<InventoryModel>> getInventory();
  
  
  @PUT('Inventory/{id}')
  Future<void> updateInventory(@Path('id') int id, @Body() InventoryModel inventory);

}