import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_management_state.freezed.dart';

@freezed
class InventoryManagementState with _$InventoryManagementState {
  const factory InventoryManagementState.initial() = _Initial;

  const factory InventoryManagementState.hospitalsLoading() = InventoryManagementStateLoading;
  // const factory HospitalsState.hospitalsSuccess(List<HospitalsData?>? specializationDataList) = HospitalsSuccess;
  const factory InventoryManagementState.hospitalsError(ErrorHandler errorHandler) = InventoryManagementStateError;

  // // Doctors
  // const factory HospitalsState.doctorsSuccess(List<Doctors?>? doctorsList) = DoctorsSuccess;
  // const factory HospitalsState.doctorsError(ErrorHandler errorHandler) = DoctorsError;
}