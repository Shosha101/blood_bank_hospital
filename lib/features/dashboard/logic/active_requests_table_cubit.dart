
// lib/features/active_requests/logic/active_requests_cubit.dart
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/active_requests_table_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveRequestsCubit extends Cubit<ActiveRequestsState> {
  final ActiveRequestsRepo _activeRequestsRepo;

  ActiveRequestsCubit(this._activeRequestsRepo) : super(const ActiveRequestsState.initial());

  void getActiveRequests() async {
    emit(const ActiveRequestsState.loading());
    final result = await _activeRequestsRepo.getActiveRequests();
    result.when(
      success: (requests) => emit(ActiveRequestsState.success(requests)),
      failure: (errorHandler) => emit(ActiveRequestsState.error(errorHandler)),
    );
  }
}