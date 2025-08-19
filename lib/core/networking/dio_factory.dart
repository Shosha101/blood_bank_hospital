
// lib/core/networking/dio_factory.dart
import 'package:blood_bank_hospital/core/constants/keys/constants.dart';
import 'package:blood_bank_hospital/core/helpers/shared_preference.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio({bool useCorsProxy = false}) async {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.baseUrl = useCorsProxy
            ? 'https://cors-anywhere.herokuapp.com/http://hemolink.runasp.net/api'
            : 'http://hemolink.runasp.net/api'
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        };
      await addDioHeaders();
      addDioInterceptor();
      return dio!;
    }
    return dio!;
  }

  static void resetDio() {
    dio = null;
  }

  static Future<void> addDioHeaders() async {
    String? token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }
}