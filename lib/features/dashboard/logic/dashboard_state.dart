import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;

  const factory DashboardState.hospitalsLoading() = DashboardStateLoading;
  // const factory HospitalsState.hospitalsSuccess(List<HospitalsData?>? specializationDataList) = HospitalsSuccess;
  const factory DashboardState.hospitalsError(ErrorHandler errorHandler) = DashboardStateError;

  // // Doctors
  // const factory HospitalsState.doctorsSuccess(List<Doctors?>? doctorsList) = DoctorsSuccess;
  // const factory HospitalsState.doctorsError(ErrorHandler errorHandler) = DoctorsError;
}