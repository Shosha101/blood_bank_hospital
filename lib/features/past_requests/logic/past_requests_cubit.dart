
// lib/features/past_requests/logic/completed_requests_cubit.dart
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/past_requests/data/repo/past_requests_repo.dart';
import 'package:blood_bank_hospital/features/past_requests/logic/past_requests_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PastRequestsCubit extends Cubit<PastRequestsState> {
  final PastRequestsRepo _pastRequestsRepo;

  PastRequestsCubit(this._pastRequestsRepo) : super(const PastRequestsState.initial());

  void getPastRequests() async {
    emit(const PastRequestsState.loading());
    final result = await _pastRequestsRepo.getPastRequests();
    result.when(
      success: (pastRequests) => emit(PastRequestsState.success(pastRequests)),
      failure: (errorHandler) => emit(PastRequestsState.error(errorHandler)),
    );
  }
}