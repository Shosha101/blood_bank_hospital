import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/active_requests_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'donation_request_state.freezed.dart';

@freezed
class DonationRequestState with _$DonationRequestState {
  const factory DonationRequestState.initial() = _Initial;
  const factory DonationRequestState.loading() = DonationRequestStateLoading;
  const factory DonationRequestState.success() = DonationRequestStateSuccess;
  const factory DonationRequestState.successWithRequests(List<ActiveRequestsModel> requests) =
      DonationRequestStateSuccessWithRequests;
  const factory DonationRequestState.error(ErrorHandler errorHandler) = DonationRequestStateError;
}