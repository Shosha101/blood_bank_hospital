// lib/features/summary_card/logic/summary_card_state.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_card_state.freezed.dart';

@freezed
class SummaryCardState with _$SummaryCardState {
  const factory SummaryCardState.initial() = _Initial;

  const factory SummaryCardState.loading() = SummaryCardStateLoading;

  const factory SummaryCardState.success({
    required int openRequestsCount,
    required int pendingRequestsCount,
  }) = SummaryCardStateSuccess;

  const factory SummaryCardState.error(ErrorHandler errorHandler) = SummaryCardStateError;
} 