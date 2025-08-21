import 'package:blood_bank_hospital/core/constants/keys/constants.dart';
import 'package:blood_bank_hospital/core/helpers/shared_preference.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/core/networking/dio_factory.dart';
import 'package:blood_bank_hospital/features/login/data/model/login_request_body.dart';
import 'package:blood_bank_hospital/features/login/data/model/login_response.dart';
import 'package:blood_bank_hospital/features/login/data/repo/login_repo.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial()) {
    _restoreSession();
  }

  Future<void> _restoreSession() async {
    emit(const LoginState.loading());
    final userId = await SharedPrefHelper.getSecuredString('userId');
    if (userId != null && int.tryParse(userId) != null) {
      try {
        // Validate session with a working authenticated endpoint
        final dio = await DioFactory.getDio();
        final response = await dio.get('/DonationRequest/hospital/open-requests');
        if (response.statusCode == 200) {
          emit(LoginState.success(LoginResponse(
            userId: int.parse(userId),
            message: 'Session restored',
          )));
        } else {
          await SharedPrefHelper.clearAllSecuredData();
          emit(const LoginState.initial());
        }
      } catch (e) {
        print('Session restoration failed: $e');
        await SharedPrefHelper.clearAllSecuredData();
        emit(const LoginState.initial());
      }
    } else {
      emit(const LoginState.initial());
    }
  }

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
        await SharedPrefHelper.clearAllSecuredData();
        DioFactory.resetDio();
        if (!kIsWeb && DioFactory.cookieJar != null) {
          DioFactory.cookieJar!.deleteAll();
        }
        if (kIsWeb) {
          try {
            final dio = await DioFactory.getDio();
            await dio.get('/api/user/logout');
          } catch (e) {
            print('Web logout cookie clear failed: $e');
          }
        }
        emit(const LoginState.logoutSuccess());
      },
      failure: (error) => emit(LoginState.error(error)),
    );
  }
}