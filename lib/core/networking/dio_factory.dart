import 'package:blood_bank_hospital/core/constants/keys/constants.dart';
import 'package:blood_bank_hospital/core/helpers/shared_preference.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart' if (dart.library.html) 'package:path_provider/path_provider.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static CookieJar? cookieJar;

  static Future<Dio> getDio({bool useCorsProxy = false}) async {
    const Duration timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      try {
        cookieJar = await _initializeCookieJar();
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
        if (!kIsWeb) {
          dio!.interceptors.add(CookieManager(cookieJar!));
        }
        await addDioHeaders(excludeAuth: true);
        addDioInterceptor();
      } catch (e) {
        print('Error initializing Dio: $e');
        rethrow;
      }
    }
    return dio!;
  }

  static Future<CookieJar> _initializeCookieJar() async {
    if (kIsWeb) {
      return CookieJar();
    } else {
      try {
        final directory = await getApplicationDocumentsDirectory();
        return PersistCookieJar(
          ignoreExpires: true,
          storage: FileStorage("${directory.path}/cookies"),
        );
      } catch (e) {
        print('Error initializing PersistCookieJar: $e');
        throw Exception('Failed to initialize cookie storage: $e');
      }
    }
  }

  static void resetDio() {
    dio = null;
    cookieJar = null;
  }

  static Future<void> addDioHeaders({bool excludeAuth = false}) async {
    try {
      const String tokenKey = SharedPrefKeys.userToken;
      if (tokenKey.isEmpty) {
        print('Error: SharedPrefKeys.userToken is empty or undefined');
        return;
      }
      String? token = await SharedPrefHelper.getSecuredString(tokenKey);
      print('Retrieved token for key "$tokenKey": $token');
      dio?.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        if (!excludeAuth && token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      };
      // Ensure cookies are sent with requests
      if (!kIsWeb && cookieJar != null) {
        final cookies = await cookieJar!.loadForRequest(
          Uri.parse('http://hemolink.runasp.net/api'),
        );
        if (cookies.isNotEmpty) {
          dio?.options.headers['Cookie'] = cookies.map((c) => '${c.name}=${c.value}').join('; ');
        }
      }
    } catch (e) {
      print('Error retrieving token in addDioHeaders: $e');
    }
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    print('Set token in headers: $token');
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