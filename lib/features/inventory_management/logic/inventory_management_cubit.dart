
// lib/features/inventory_management/logic/inventory_cubit.dart
import 'package:blood_bank_hospital/core/networking/api_result.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/model/inventory_management_model.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/repo/inventory_management_repo.dart';
import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryCubit extends Cubit<InventoryState> {
  final InventoryRepo _inventoryRepo;

  InventoryCubit(this._inventoryRepo) : super(const InventoryState.initial());

  void getInventory() async {
    emit(const InventoryState.loading());
    final result = await _inventoryRepo.getInventory();
    result.when(
      success: (inventory) => emit(InventoryState.success(inventory)),
      failure: (errorHandler) => emit(InventoryState.error(errorHandler)),
    );
  }

  void updateInventory(InventoryModel updatedInventory) async {
    emit(const InventoryState.loading());
    final result = await _inventoryRepo.updateInventory(updatedInventory);
    result.when(
      success: (_) async {
        // Refetch inventory to update UI
        final inventoryResult = await _inventoryRepo.getInventory();
        inventoryResult.when(
          success: (inventory) => emit(InventoryState.success(inventory)),
          failure: (errorHandler) => emit(InventoryState.error(errorHandler)),
        );
      },
      failure: (errorHandler) => emit(InventoryState.error(errorHandler)),
    );
  }
}