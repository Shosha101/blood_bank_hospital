import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:blood_bank_hospital/core/widgets/app_widgets.dart';
import 'package:blood_bank_hospital/features/inventory_management/data/model/inventory_management_model.dart';
import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_cubit.dart';
import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_state.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class InventoryManagementScreen extends StatelessWidget {
  const InventoryManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<InventoryCubit>()..getInventory(),
      child: const _InventoryView(),
    );
  }
}

class _InventoryView extends StatefulWidget {
  const _InventoryView();

  @override
  State<_InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<_InventoryView> {
  // Kept so the table stays on screen while an update is being saved.
  List<InventoryModel>? _lastInventory;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InventoryCubit, InventoryState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (inventory) => _lastInventory = inventory,
          error: (errorHandler) {
            if (_lastInventory == null) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorHandler.apiErrorModel.message ??
                      context.tr('update_failed'),
                ),
                backgroundColor: AppColors.primaryDark,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final inventory = state.maybeWhen(
          success: (inventory) => inventory,
          orElse: () => _lastInventory,
        );
        final loading = state.maybeWhen(
          loading: () => true,
          initial: () => true,
          orElse: () => false,
        );

        return SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.tr('inventory_subtitle'),
                style: const TextStyle(fontSize: 14, color: AppColors.muted),
              ),
              const SizedBox(height: 14),
              if (loading && inventory != null)
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: LinearProgressIndicator(minHeight: 3),
                ),
              AppCard(
                padding: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _body(context, state, inventory),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _body(
    BuildContext context,
    InventoryState state,
    List<InventoryModel>? inventory,
  ) {
    if (inventory == null) {
      return state.maybeWhen(
        error: (errorHandler) => Center(
          child: StateMessage(
            icon: Icons.error_outline,
            title: context.tr('inventory_error'),
            body: errorHandler.apiErrorModel.message,
            actionLabel: context.tr('retry'),
            onAction: () => context.read<InventoryCubit>().getInventory(),
          ),
        ),
        orElse: () => const SizedBox(
          height: 220,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (inventory.isEmpty) {
      return Center(
        child: StateMessage(
          icon: Icons.inventory_2_outlined,
          title: context.tr('availability_empty'),
        ),
      );
    }

    return AppTable(
      columns: [
        context.tr('col_blood_type'),
        context.tr('col_quantity'),
        context.tr('col_status'),
        context.tr('col_expiration'),
        context.tr('col_action'),
      ],
      flex: const [2, 2, 2, 4, 2],
      rows: [
        for (final item in inventory)
          [
            BloodBadge(bloodType: item.bloodTypeName, size: 36),
            CellText(
              context.tr('units', args: ['${item.currentQuantity}']),
              strong: true,
            ),
            StatusChip(status: item.status),
            _ExpirationCell(raw: item.expirationDate),
            TextButton.icon(
              onPressed: () => _showUpdateDialog(context, item),
              icon: const Icon(Icons.edit_outlined, size: 16),
              label: Text(context.tr('update')),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ],
      ],
    );
  }

  void _showUpdateDialog(BuildContext context, InventoryModel inventory) {
    final cubit = context.read<InventoryCubit>();
    final quantityController = TextEditingController(
      text: inventory.currentQuantity.toString(),
    );
    DateTime? selectedDateTime = DateTime.tryParse(inventory.expirationDate);

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setDialogState) {
          Future<void> pickDateTime() async {
            final selectedDate = await showDatePicker(
              context: dialogContext,
              initialDate: selectedDateTime ?? DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            );
            if (selectedDate == null || !dialogContext.mounted) return;
            final selectedTime = await showTimePicker(
              context: dialogContext,
              initialTime: TimeOfDay.fromDateTime(
                selectedDateTime ?? DateTime.now(),
              ),
            );
            if (selectedTime == null) return;
            setDialogState(() {
              selectedDateTime = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );
            });
          }

          return Dialog(
            backgroundColor: AppColors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        BloodBadge(bloodType: inventory.bloodTypeName),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            dialogContext.tr('update_inventory'),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.text,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _FieldLabel(dialogContext.tr('quantity')),
                    TextField(
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    const SizedBox(height: 16),
                    _FieldLabel(dialogContext.tr('col_expiration')),
                    OutlinedButton.icon(
                      onPressed: pickDateTime,
                      icon: const Icon(Icons.event_outlined, size: 18),
                      label: Text(
                        selectedDateTime != null
                            ? formatApiDateTime(
                                selectedDateTime!.toIso8601String(),
                              )
                            : dialogContext.tr('select_date'),
                        textDirection: TextDirection.ltr,
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.text,
                        side: const BorderSide(color: AppColors.border),
                        alignment: AlignmentDirectional.centerStart,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(dialogContext).pop(),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.text,
                              side: const BorderSide(color: AppColors.border),
                            ),
                            child: Text(dialogContext.tr('cancel')),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: FilledButton(
                            onPressed: () {
                              cubit.updateInventory(
                                InventoryModel(
                                  id: inventory.id,
                                  bloodTypeName: inventory.bloodTypeName,
                                  currentQuantity:
                                      int.tryParse(quantityController.text) ??
                                      inventory.currentQuantity,
                                  // The API expects Latin digits whatever the app language is.
                                  expirationDate: selectedDateTime != null
                                      ? DateFormat(
                                          "yyyy-MM-dd'T'HH:mm:ss.SSSSSS",
                                          'en',
                                        ).format(selectedDateTime!)
                                      : inventory.expirationDate,
                                  status: inventory.status,
                                ),
                              );
                              Navigator.of(dialogContext).pop();
                            },
                            child: Text(dialogContext.tr('update')),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.text,
        ),
      ),
    );
  }
}

/// Expiry date of a stock row, flagged when it falls within the next 7 days.
class _ExpirationCell extends StatelessWidget {
  final String raw;
  const _ExpirationCell({required this.raw});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.tryParse(raw);
    final now = DateTime.now();
    final soon =
        date != null &&
        date.isAfter(now) &&
        date.difference(now) <= const Duration(days: 7);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: CellText(formatApiDateTime(raw), ltr: true)),
        if (soon) ...[
          const SizedBox(width: 8),
          Tooltip(
            message: context.tr('expires_soon'),
            child: const Icon(
              Icons.schedule,
              size: 16,
              color: AppColors.warning,
            ),
          ),
        ],
      ],
    );
  }
}
