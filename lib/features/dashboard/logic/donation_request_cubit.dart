
// lib/features/dashboard/logic/donation_request_cubit.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/donation_request_model.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/donation_request_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonationRequestCubit extends Cubit<DonationRequestState> {
  final DonationRequestRepo _donationRequestRepo;

  DonationRequestCubit(this._donationRequestRepo) : super(const DonationRequestState.initial());

  void createDonationRequest(DonationRequestModel request) async {
    print('Sending POST request: ${request.toJson()} to /api/DonationRequest/');
    emit(const DonationRequestState.loading());
    try {
      final result = await _donationRequestRepo.createDonationRequest(request);
      result.when(
        success: (response) {
          print('POST response: ${response.toJson()}, id: ${response.id}, createdAt: ${response.createdAt}');
          emit(const DonationRequestState.success());
        },
        failure: (errorHandler) {
          print('POST error: ${errorHandler.apiErrorModel.message}, code: ${errorHandler.apiErrorModel.code}');
          emit(DonationRequestState.error(errorHandler));
        },
      );
    } catch (e) {
      print('Unexpected error in DonationRequestCubit: $e');
      if (e is DioException) {
        print('DioException details: type=${e.type}, message=${e.message}, response=${e.response?.data}, statusCode=${e.response?.statusCode}');
      }
      emit(DonationRequestState.error(ErrorHandler.handle(e)));
    }
  }
}