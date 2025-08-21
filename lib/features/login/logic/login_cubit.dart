import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/login/data/model/login_request_body.dart';
import 'package:blood_bank_hospital/features/login/data/model/login_response.dart';
import 'package:blood_bank_hospital/features/login/data/repo/login_repo.dart';
import 'package:blood_bank_hospital/features/login/logic/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  Future<void> login(String phoneNumber, String password) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(phoneNumber: phoneNumber, password: password),
    );
    response.when(
      success: (loginResponse) => emit(LoginState.success(loginResponse)),
      failure: (error) => emit(LoginState.error(error)),
    );
  }

  Future<void> logout() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.logout();
    response.when(
      success: (message) => emit(const LoginState.logoutSuccess()),
      failure: (error) => emit(LoginState.error(error)),
    );
  }
}