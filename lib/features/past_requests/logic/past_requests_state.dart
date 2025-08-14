import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'past_requests_state.freezed.dart';

@freezed
class PastRequestsState with _$PastRequestsState {
  const factory PastRequestsState.initial() = _Initial;

  const factory PastRequestsState.hospitalsLoading() = PastRequestsStateLoading;
  // const factory HospitalsState.hospitalsSuccess(List<HospitalsData?>? specializationDataList) = HospitalsSuccess;
  const factory PastRequestsState.hospitalsError(ErrorHandler errorHandler) = PastRequestsStateError;

  // // Doctors
  // const factory HospitalsState.doctorsSuccess(List<Doctors?>? doctorsList) = DoctorsSuccess;
  // const factory HospitalsState.doctorsError(ErrorHandler errorHandler) = DoctorsError;
}