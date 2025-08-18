
// lib/features/active_requests/logic/active_requests_state.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/active_requests_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_requests_table_state.freezed.dart';

@freezed
class ActiveRequestsState with _$ActiveRequestsState {
  const factory ActiveRequestsState.initial() = _Initial;
  const factory ActiveRequestsState.loading() = ActiveRequestsStateLoading;
  const factory ActiveRequestsState.success(List<ActiveRequestsModel> requests) = ActiveRequestsStateSuccess;
  const factory ActiveRequestsState.error(ErrorHandler errorHandler) = ActiveRequestsStateError;
}