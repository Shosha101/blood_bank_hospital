import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/features/settings/data/model/hospital_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_state.freezed.dart';

@freezed
class HospitalState with _$HospitalState {
  const factory HospitalState.initial() = _Initial;
  const factory HospitalState.loading() = HospitalStateLoading;
  const factory HospitalState.success(HospitalModel hospital) = HospitalStateSuccess;
  const factory HospitalState.error(ErrorHandler errorHandler) = HospitalStateError;
}