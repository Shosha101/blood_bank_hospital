// lib/features/dashboard/data/api/donation_request_api_service.dart
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/dio_factory.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/donation_request_model.dart';
import 'package:dio/dio.dart';

class DonationRequestApiService {
  final Dio _dio;

  DonationRequestApiService(this._dio);

  Future<ApiResult<DonationRequestModel>> createDonationRequest(
      DonationRequestModel request) async {
    try {
      final response = await _dio.post(
        '/DonationRequest/',
        data: request.toJson(),
      );
      print('Raw response data: ${response.data}');
      if (response.data is String) {
        return ApiResult.failure(
          ErrorHandler.handle(DioException(
            requestOptions: response.requestOptions,
            error: 'Server returned string instead of JSON: ${response.data}',
            type: DioExceptionType.badResponse,
            response: response,
          )),
        );
      }
      return ApiResult.success(DonationRequestModel.fromJson(response.data));
    } catch (e) {
      print('API service error: $e');
      if (e is DioException && (e.response?.statusCode == 403 || e.response?.statusCode == 404)) {
        print('Retrying with CORS proxy...');
        try {
          final retryDio = await DioFactory.getDio(useCorsProxy: true);
          final retryResponse = await retryDio.post(
            '/DonationRequest/',
            data: request.toJson(),
          );
          print('Retry response data: ${retryResponse.data}');
          if (retryResponse.data is String) {
            return ApiResult.failure(
              ErrorHandler.handle(DioException(
                requestOptions: retryResponse.requestOptions,
                error: 'Server returned string instead of JSON: ${retryResponse.data}',
                type: DioExceptionType.badResponse,
                response: retryResponse,
              )),
            );
          }
          return ApiResult.success(DonationRequestModel.fromJson(retryResponse.data));
        } catch (retryError) {
          print('Retry error: $retryError');
          if (retryError is DioException && retryError.response?.statusCode == 403) {
            return ApiResult.failure(
              ErrorHandler.handle(DioException(
                requestOptions: retryError.requestOptions,
                error: 'CORS proxy blocked request. Visit https://cors-anywhere.herokuapp.com/corsdemo to request temporary access.',
                type: DioExceptionType.badResponse,
                response: retryError.response,
              )),
            );
          }
          return ApiResult.failure(ErrorHandler.handle(retryError));
        }
      }
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
