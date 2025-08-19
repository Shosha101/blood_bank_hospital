import 'package:blood_bank_hospital/core/networking/api_constants.dart';
import 'package:blood_bank_hospital/features/settings/data/model/hospital_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'hospital_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HospitalApiService {
  factory HospitalApiService(Dio dio) = _HospitalApiService;

  @GET('hospital')
  Future<List<HospitalModel>> getHospitalData();
}