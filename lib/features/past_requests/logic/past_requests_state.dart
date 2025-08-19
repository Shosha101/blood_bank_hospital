
// lib/features/past_requests/logic/completed_requests_state.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/features/past_requests/data/model/pasts_requests_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'past_requests_state.freezed.dart';

@freezed
class PastRequestsState with _$PastRequestsState {
  const factory PastRequestsState.initial() = _Initial;
  const factory PastRequestsState.loading() = PastRequestsStateLoading;
  const factory PastRequestsState.success(List<PastsRequestsModel> pastRequests) = PastRequestsStateSuccess;
  const factory PastRequestsState.error(ErrorHandler errorHandler) = PastRequestsStateError;
}