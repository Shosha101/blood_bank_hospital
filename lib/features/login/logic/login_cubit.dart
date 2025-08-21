import 'package:blood_bank_hospital/core/constants/keys/constants.dart';
import 'package:blood_bank_hospital/core/helpers/shared_preference.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/login/data/model/login_request_body.dart';

import 'package:blood_bank_hospital/features/login/data/repo/login_repo.dart';
import 'package:blood_bank_hospital/core/networking/dio_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'login_state.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  Future<void> login(String phoneNumber, String password) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(phoneNumber: phoneNumber, password: password),
    );
    response.when(
      success: (loginResponse) async {
        print('Login response: $loginResponse');
        // Save userId
        if (loginResponse.userId != null) {
          await SharedPrefHelper.setSecuredString(
            'userId',
            loginResponse.userId.toString(),
          );
        }

        // Fetch profile and hospitalId
        try {
          final dio = await DioFactory.getDio();
          final profileResponse = await dio.get('/user/profile');
          final hospitalId = profileResponse.data['id']?.toString();
          if (hospitalId != null) {
            await SharedPrefHelper.setSecuredString('hospitalId', hospitalId);
            print('Stored hospitalId: $hospitalId');
          }
        } catch (e) {
          print('Error fetching hospitalId: $e');
        }

        // Optional: store .AspNetCore.Cookies manually for debugging
        if (!kIsWeb && DioFactory.cookieJar != null) {
          final cookies = await DioFactory.cookieJar!.loadForRequest(
            Uri.parse('http://hemolink.runasp.net/api'),
          );
          final authCookie = cookies.firstWhere(
            (cookie) => cookie.name == '.AspNetCore.Cookies',
            orElse: () => Cookie('.AspNetCore.Cookies', ''),
          );
          if (authCookie.value.isNotEmpty) {
            print('Found .AspNetCore.Cookies: ${authCookie.value}');
            await SharedPrefHelper.setSecuredString(
              SharedPrefKeys.userToken,
              authCookie.value,
            );
          }
        }

        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        print('Login error: ${error.apiErrorModel.message}');
        emit(LoginState.error(error));
      },
    );
  }

  Future<void> logout() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.logout();
    response.when(
      success: (message) async {
        SharedPrefHelper.clearAllSecuredData();
        DioFactory.resetDio();
        if (!kIsWeb && DioFactory.cookieJar != null) {
          DioFactory.cookieJar!.deleteAll();
        }
        emit(const LoginState.logoutSuccess());
      },
      failure: (error) => emit(LoginState.error(error)),
    );
  }
}
