import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;

  const factory SettingsState.hospitalsLoading() = SettingsStateLoading;
  // const factory HospitalsState.hospitalsSuccess(List<HospitalsData?>? specializationDataList) = HospitalsSuccess;
  const factory SettingsState.hospitalsError(ErrorHandler errorHandler) = SettingsStateError;

  // // Doctors
  // const factory HospitalsState.doctorsSuccess(List<Doctors?>? doctorsList) = DoctorsSuccess;
  // const factory HospitalsState.doctorsError(ErrorHandler errorHandler) = DoctorsError;
}