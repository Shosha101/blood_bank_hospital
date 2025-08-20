// lib/features/summary_card/logic/summary_card_cubit.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/summary_card_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryCardCubit extends Cubit<SummaryCardState> {
  final SummaryCardRepo _summaryCardRepo;

  SummaryCardCubit(this._summaryCardRepo) : super(const SummaryCardState.initial());

  void getRequestCounts() async {
    emit(const SummaryCardState.loading());

    try {
      final openFuture = _summaryCardRepo.getOpenRequestsCount();
      final completedFuture = _summaryCardRepo.getCompletedRequestsCount();

      final results = await Future.wait([openFuture, completedFuture]);
      final openResult = results[0];
      final completedResult = results[1];

      openResult.when(
        success: (openCount) {
          completedResult.when(
            success: (completedCount) {
              emit(SummaryCardState.success(
                openRequestsCount: openCount,
                completedRequestsCount: completedCount,
              ));
            },
            failure: (errorHandler) {
              emit(SummaryCardState.error(errorHandler));
            },
          );
        },
        failure: (errorHandler) {
          emit(SummaryCardState.error(errorHandler));
        },
      );
    } catch (error) {
      emit(SummaryCardState.error(ErrorHandler.handle(error)));
    }
  }
}