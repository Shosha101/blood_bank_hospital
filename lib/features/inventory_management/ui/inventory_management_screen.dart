// lib/features/inventory_management/ui/inventory_management_screen.dart
import 'package:blood_bank_hospital/features/inventory_management/data/model/inventory_management_model.dart';

import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_cubit.dart';
import 'package:blood_bank_hospital/features/inventory_management/logic/inventory_management_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class InventoryManagementScreen extends StatefulWidget {
  const InventoryManagementScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InventoryManagementState();
}

class _InventoryManagementState extends State<InventoryManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<InventoryCubit>()..getInventory(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Inventory',
                style: TextStyle(
                  fontSize: 22.spMax,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: BlocBuilder<InventoryCubit, InventoryState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (inventory) => LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: HexColor('#637887')),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DataTable(
                                  headingRowHeight: 44.h,
                                  dataRowMaxHeight: 72.h,
                                  columnSpacing: 24.w,
                                  headingTextStyle: TextStyle(
                                    color: Color(0xff42526d),
                                    fontSize: 12.spMax,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  headingRowColor:
                                      const WidgetStatePropertyAll(
                                        Color(0xfffbfafb),
                                      ),
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        'Blood Type',
                                        style: TextStyle(
                                          fontSize: 12.spMax,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Quantity',
                                        style: TextStyle(
                                          fontSize: 12.spMax,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Status',
                                        style: TextStyle(
                                          fontSize: 12.spMax,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Date',
                                        style: TextStyle(
                                          fontSize: 12.spMax,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Action',
                                        style: TextStyle(
                                          fontSize: 12.spMax,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: List.generate(
                                    inventory.length,
                                    (index) =>
                                        _dataRow(context, inventory[index]),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      error: (errorHandler) => Center(
                        child: Text(
                          errorHandler.apiErrorModel.message ??
                              'Error fetching inventory',
                          style: TextStyle(
                            fontSize: 16.spMax,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataRow _dataRow(BuildContext context, InventoryModel inventory) {
    Color? bColor;
    Color? fColor;
    switch (inventory.status) {
      case 'Available':
        bColor = HexColor('#ECFDF3');
        fColor = HexColor('#009881');
        break;
      case 'Low Stock':
        bColor = HexColor('#FFFADF');
        fColor = HexColor('#ECA600');
        break;
      case 'Out of Stock':
      case 'NotAvailable':
        bColor = HexColor('#FFEFEF');
        fColor = HexColor('#FF4D4D');
        break;
    }

    return DataRow(
      cells: [
        DataCell(
          Text(inventory.bloodTypeName, style: TextStyle(fontSize: 12.spMax)),
        ),
        DataCell(
          Text(
            '${inventory.currentQuantity} Units',
            style: TextStyle(fontSize: 12.spMax),
          ),
        ),
        DataCell(
          Container(
            width: 73.w,
            height: 26.h,
            decoration: BoxDecoration(
              color: bColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                inventory.status == 'NotAvailable'
                    ? 'Out of Stock'
                    : inventory.status,
                style: TextStyle(
                  color: fColor,
                  fontSize: 12.spMax,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Text(inventory.expirationDate, style: TextStyle(fontSize: 12.spMax)),
        ),
        DataCell(
          TextButton(
            onPressed: () {
              _showUpdatePopup(context, inventory);
            },
            child: Text(
              'Update',
              style: TextStyle(
                fontSize: 12.spMax,
                color: HexColor('#1A8AE5'),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showUpdatePopup(BuildContext context, InventoryModel inventory) {
    TextEditingController quantityController = TextEditingController(
      text: inventory.currentQuantity.toString(),
    );
    DateTime? selectedDateTime = DateTime.tryParse(inventory.expirationDate);

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setDialogState) {
            return AlertDialog(
              title: const Text('Update Inventory'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: quantityController,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: double.infinity,
                    height: 40.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#637887')),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        // Show date picker
                        final selectedDate = await showDatePicker(
                          context: dialogContext,
                          initialDate: selectedDateTime ?? DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (selectedDate != null) {
                          // Show time picker
                          final selectedTime = await showTimePicker(
                            context: dialogContext,
                            initialTime: TimeOfDay.fromDateTime(
                              selectedDateTime ?? DateTime.now(),
                            ),
                          );
                          if (selectedTime != null) {
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
                        }
                      },
                      child: Text(
                        selectedDateTime != null
                            ? DateFormat(
                                'yyyy-MM-dd HH:mm:ss',
                              ).format(selectedDateTime!)
                            : 'Select Date',
                        style: TextStyle(fontSize: 12.spMax),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final updatedInventory = InventoryModel(
                      id: inventory.id,
                      bloodTypeName: inventory.bloodTypeName,
                      currentQuantity:
                          int.tryParse(quantityController.text) ??
                          inventory.currentQuantity,
                      expirationDate: selectedDateTime != null
                          ? DateFormat(
                              'yyyy-MM-dd\'T\'HH:mm:ss.SSSSSS',
                            ).format(selectedDateTime!)
                          : inventory.expirationDate,
                      status: inventory.status,
                    );
                    context.read<InventoryCubit>().updateInventory(
                      updatedInventory,
                    );
                    Navigator.of(dialogContext).pop();
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: HexColor('#1A8AE5'),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    ).then((_) {
      // Check for errors after dialog closes
      if (context.read<InventoryCubit>().state is InventoryStateError) {
        final error =
            (context.read<InventoryCubit>().state as InventoryStateError)
                .errorHandler;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.apiErrorModel.message ?? 'Failed to update inventory',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }
}
