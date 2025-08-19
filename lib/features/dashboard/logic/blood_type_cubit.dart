// lib/features/dashboard/logic/blood_type_cubit.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/dashboard/data/repo/blood_type_repo.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/blood_type_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloodTypeCubit extends Cubit<BloodTypeState> {
  final BloodTypeRepo _bloodTypeRepo;

  BloodTypeCubit(this._bloodTypeRepo) : super(const BloodTypeState.initial());

  void getBloodTypes() async {
    print('Fetching blood types...');
    emit(const BloodTypeState.loading());
    try {
      final result = await _bloodTypeRepo.getBloodTypes();
      result.when(
        success: (bloodTypes) {
          print('Blood types fetched: ${bloodTypes.map((e) => e.name).toList()}');
          emit(BloodTypeState.success(bloodTypes));
        },
        failure: (errorHandler) {
          print('Error fetching blood types: ${errorHandler.apiErrorModel.message}');
          emit(BloodTypeState.error(errorHandler));
        },
      );
    } catch (e) {
      print('Unexpected error in BloodTypeCubit: $e');
      emit(BloodTypeState.error(ErrorHandler.handle(e)));
    }
  }
}