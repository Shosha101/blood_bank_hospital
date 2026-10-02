import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:blood_bank_hospital/core/widgets/app_widgets.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/model/inventory_management_model.dart';
import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_cubit.dart';
import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_state.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

/// Current stock of every blood type as a row of tiles, read from the inventory.
class BloodAvailabilityPanel extends StatelessWidget {
  const BloodAvailabilityPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<InventoryCubit>()..getInventory(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(
            title: context.tr('availability_title'),
            subtitle: context.tr('availability_subtitle'),
          ),
          const SizedBox(height: 14),
          BlocBuilder<InventoryCubit, InventoryState>(
            builder: (context, state) {
              return state.maybeWhen(
                success: (inventory) => inventory.isEmpty
                    ? AppCard(
                        child: Text(
                          context.tr('availability_empty'),
                          style: const TextStyle(color: AppColors.muted),
                        ),
                      )
                    : _Tiles(inventory: inventory),
                error: (errorHandler) => AppCard(
                  child: Text(
                    errorHandler.apiErrorModel.message ??
                        context.tr('inventory_error'),
                    style: const TextStyle(color: AppColors.primary),
                  ),
                ),
                orElse: () => const SizedBox(
                  height: 120,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Tiles extends StatelessWidget {
  final List<InventoryModel> inventory;
  const _Tiles({required this.inventory});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const gap = 14.0;
        final perRow = constraints.maxWidth >= 900
            ? 4
            : constraints.maxWidth >= 520
            ? 2
            : 1;
        final width = (constraints.maxWidth - gap * (perRow - 1)) / perRow;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final item in inventory)
              SizedBox(
                width: width,
                child: _Tile(item: item),
              ),
          ],
        );
      },
    );
  }
}

class _Tile extends StatelessWidget {
  final InventoryModel item;
  const _Tile({required this.item});

  @override
  Widget build(BuildContext context) {
    final style = StatusStyle.of(item.status);
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          BloodBadge(bloodType: item.bloodTypeName, size: 46),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('units', args: ['${item.currentQuantity}']),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: style?.foreground ?? AppColors.muted,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        style != null
                            ? context.tr(style.labelKey)
                            : item.status,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: style?.foreground ?? AppColors.muted,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
