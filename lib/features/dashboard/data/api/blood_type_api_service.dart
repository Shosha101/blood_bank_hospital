
// lib/features/dashboard/data/api/blood_type_api_service.dart
import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/blood_type_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'blood_type_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class BloodTypeApiService {
  factory BloodTypeApiService(Dio dio) = _BloodTypeApiService;

  @GET('BloodType/')
  Future<List<BloodTypeModel>> getBloodTypes();
}