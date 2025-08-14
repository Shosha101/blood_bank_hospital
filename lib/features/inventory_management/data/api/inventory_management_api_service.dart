

import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'inventory_management_api_service.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class InventoryManagementApiService {
  factory InventoryManagementApiService(Dio dio) = _InventoryManagementApiService;

  // @GET(HospitalsApiConstants.hospitals)
  // Future<HospitalsResponseModel> getHospitals();
}