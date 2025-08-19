
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/active_requests_table_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveRequestsCubit extends Cubit<ActiveRequestsState> {
  final ActiveRequestsRepo _activeRequestsRepo;

  ActiveRequestsCubit(this._activeRequestsRepo) : super(const ActiveRequestsState.initial());

  Future<void> getActiveRequests() async {
    emit(const ActiveRequestsState.loading());
    try {
      final result = await _activeRequestsRepo.getActiveRequests();
      result.when(
        success: (requests) {
          // Filter requests to match summary card criteria
          final filteredRequests = requests.where((req) => ['Open', 'Pending'].contains(req.status)).toList();
          print('Filtered active requests: ${filteredRequests.length}'); // Debug log
          emit(ActiveRequestsState.success(filteredRequests));
        },
        failure: (errorHandler) {
          print('Error fetching active requests: ${errorHandler.apiErrorModel.message}');
          emit(ActiveRequestsState.error(errorHandler));
        },
      );
    } catch (e) {
      print('Unexpected error in ActiveRequestsCubit: $e');
      emit(ActiveRequestsState.error(ErrorHandler.handle(e)));
    }
  }
}