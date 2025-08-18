import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class RecentRequestsTable extends StatelessWidget {
  final List<Map<String, String>> requests;

  const RecentRequestsTable({super.key, required this.requests});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: HexColor('#637887')),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: DataTable(
                headingRowHeight: 44.h,
                dataRowMaxHeight: 65.h,
                columnSpacing: 24.w,
                headingTextStyle: TextStyle(
                  color: const Color(0xff42526d),
                  fontSize: 12.spMax,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
                headingRowColor: const WidgetStatePropertyAll(
                  Color(0xfffbfafb),
                ),
                columns: [
                  DataColumn(
                    label: Text(
                      'Request ID',
                      style: TextStyle(
                        fontSize: 12.spMax,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataColumn(label: Text('Blood Type')),
                  DataColumn(
                    label: Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 12.spMax,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 12.spMax,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Date & Time',
                      style: TextStyle(
                        fontSize: 12.spMax,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
                rows: List.generate(
                  requests.length,
                  (index) => _dataRow(requests[index], context),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static DataRow _dataRow(Map<String, String> data, BuildContext context) {
    Color? bColor;
    Color? fColor;
    switch (data['status']) {
      case 'Completed':
        bColor = HexColor('#ECFDF3');
        fColor = HexColor('#009881');
        break;
      case 'In Progress':
        bColor = HexColor('#E9F3FF');
        fColor = HexColor('#4A72FF');
        break;
      case 'Pending':
        bColor = HexColor('#FFFADF');
        fColor = HexColor('#ECA600');
        break;
    }

    return DataRow(
      cells: [
        DataCell(Text(data['id']!, style: _cellStyle)),
        DataCell(Text(data['bloodType']!, style: _cellStyle)),
        DataCell(Text(data['quantity']!, style: _cellStyle)),
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
                  overflow: TextOverflow.ellipsis,
                  color: fColor,
                  fontSize: 12.spMax,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        DataCell(Text(data['dateTime']!, style: _cellStyle)),
      ],
    );
  }

  static final TextStyle _cellStyle = TextStyle(
    fontSize: 15.spMin,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: const Color(0xff42526d),
    overflow: TextOverflow.ellipsis,
  );
}
