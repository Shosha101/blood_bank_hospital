import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/donation_request_model.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/active_requests_table_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/donation_request_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonationRequestCubit extends Cubit<DonationRequestState> {
  final DonationRequestRepo _donationRequestRepo;
  final ActiveRequestsRepo _activeRequestsRepo;

  DonationRequestCubit(this._donationRequestRepo, this._activeRequestsRepo)
      : super(const DonationRequestState.initial());

  void createDonationRequest(DonationRequestModel request) async {
    emit(const DonationRequestState.loading());
    final result = await _donationRequestRepo.createDonationRequest(request);
    result.when(
      success: (response) async {
        // Refetch active requests to update UI
        final activeRequestsResult = await _activeRequestsRepo.getActiveRequests();
        activeRequestsResult.when(
          success: (requests) {
            emit(DonationRequestState.successWithRequests(requests));
          },
          failure: (errorHandler) {
            emit(DonationRequestState.error(errorHandler));
          },
        );
      },
      failure: (errorHandler) {
        emit(DonationRequestState.error(errorHandler));
      },
    );
  }
}