import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/settings/data/repo/hospital_repo.dart';
import 'package:blood_bank_hospital/features/settings/logic/hospital_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalCubit extends Cubit<HospitalState> {
  final HospitalRepo _hospitalRepo;

  HospitalCubit(this._hospitalRepo) : super(const HospitalState.initial());

  void getHospitalData() async {
    emit(const HospitalState.loading());
    final result = await _hospitalRepo.getHospitalData();
    result.when(
      success: (hospital) => emit(HospitalState.success(hospital)),
      failure: (errorHandler) => emit(HospitalState.error(errorHandler)),
    );
  }
}