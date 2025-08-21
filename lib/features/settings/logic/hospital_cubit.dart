import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/settings/data/model/hospital_model.dart';
import 'package:blood_bank_hospital/features/settings/data/repo/hospital_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'hospital_state.dart';

class HospitalCubit extends Cubit<HospitalState> {
  final HospitalRepo _hospitalRepo;

  HospitalCubit(this._hospitalRepo) : super(const HospitalState.initial());

  Future<void> getHospitalData() async {
    emit(const HospitalState.loading());
    try {
      final response = await _hospitalRepo.getHospitalData();
      response.when(
        success: (hospital) {
          print('Hospital data: ${hospital.toJson()}');
          emit(HospitalState.success(hospital));
        },
        failure: (error) {
          print('Error fetching hospital data: ${error.apiErrorModel.message}');
          emit(HospitalState.error(error));
        },
      );
    } catch (e) {
      print('Unexpected error: $e');
      emit(HospitalState.error(ErrorHandler.handle( e.toString())));
    }
  }
}