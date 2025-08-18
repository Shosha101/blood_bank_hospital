
// lib/features/inventory_management/logic/inventory_state.dart
import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/model/inventory_management_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_management_state.freezed.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = _Initial;
  const factory InventoryState.loading() = InventoryStateLoading;
  const factory InventoryState.success(List<InventoryModel> inventory) = InventoryStateSuccess;
  const factory InventoryState.error(ErrorHandler errorHandler) = InventoryStateError;
}