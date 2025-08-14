import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class InventoryManagementScreen extends StatefulWidget {
  const InventoryManagementScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InventoryManagementState();
}

class _InventoryManagementState extends State<InventoryManagementScreen> {
  final List<Map<String, String>> inventory = List.generate(
    5,
    (index) => {
      'bloodType': ['A+', 'B+', 'O-', 'AB+'][index % 4],
      'quantity': '${(index + 1) * 5} Units',
      'status': ['Available', 'Low Stock', 'Out of Stock'][index % 3],
      'date': '2025-08-14 10:3$index AM',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Inventory',
              style: TextStyle(fontSize: 22.spMax, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: LayoutBuilder(
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
                          headingRowColor: const MaterialStatePropertyAll(
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
                            (index) => _dataRow(inventory[index]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _dataRow(Map<String, String> data) {
    Color? bColor;
    Color? fColor;
    switch (data['status']) {
      case 'Available':
        bColor = HexColor('#ECFDF3');
        fColor = HexColor('#009881');
        break;
      case 'Low Stock':
        bColor = HexColor('#FFFADF');
        fColor = HexColor('#ECA600');
        break;
      case 'Out of Stock':
        bColor = HexColor('#FFEFEF');
        fColor = HexColor('#FF4D4D');
        break;
    }

    return DataRow(
      cells: [
        DataCell(
          Text(data['bloodType']!, style: TextStyle(fontSize: 12.spMax)),
        ),
        DataCell(Text(data['quantity']!, style: TextStyle(fontSize: 12.spMax))),
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
                data['status']!,
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
        DataCell(Text(data['date']!, style: TextStyle(fontSize: 12.spMax))),
        DataCell(
          TextButton(
            onPressed: () {
              _showUpdatePopup(data);
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

  void _showUpdatePopup(Map<String, String> data) {
    String? selectedBloodType = data['bloodType'];
    TextEditingController quantityController = TextEditingController(
      text: data['quantity'],
    );
    String? selectedStatus = data['status'];
    TextEditingController dateController = TextEditingController(
      text: data['date'],
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Inventory'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField2<String>(
                decoration: InputDecoration(
                  labelText: 'Blood Type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                value: selectedBloodType,
                items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']
                    .map(
                      (type) => DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  selectedBloodType = value;
                },
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              DropdownButtonFormField2<String>(
                decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                value: selectedStatus,
                items: ['Available', 'Low Stock', 'Out of Stock']
                    .map(
                      (status) => DropdownMenuItem<String>(
                        value: status,
                        child: Text(status),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  selectedStatus = value;
                },
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  data['bloodType'] = selectedBloodType!;
                  data['quantity'] = quantityController.text;
                  data['status'] = selectedStatus!;
                  data['date'] = dateController.text;
                });
                Navigator.of(context).pop();
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
  }
}
