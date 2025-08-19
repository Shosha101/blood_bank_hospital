
// lib/features/dashboard/logic/blood_type_state.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/blood_type_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_type_state.freezed.dart';

@freezed
class BloodTypeState with _$BloodTypeState {
  const factory BloodTypeState.initial() = _Initial;
  const factory BloodTypeState.loading() = BloodTypeStateLoading;
  const factory BloodTypeState.success(List<BloodTypeModel> bloodTypes) = BloodTypeStateSuccess;
  const factory BloodTypeState.error(ErrorHandler errorHandler) = BloodTypeStateError;
}