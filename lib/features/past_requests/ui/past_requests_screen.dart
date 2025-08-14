import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class PastRequestsScreen extends StatefulWidget {
  const PastRequestsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PastRequestsState();
}

class _PastRequestsState extends State<PastRequestsScreen> {
  final List<Map<String, String>> pastRequests = List.generate(
    5,
    (index) => {
      'id': '#REQ${index + 101}', // Just example IDs
      'bloodType': ['A+', 'B+', 'O-', 'AB+'][index % 4],
      'quantity': '${(index + 1) * 2} Units',
      'status': ['Completed', 'In Progress', 'Pending'][index % 3],
      'dateTime': '2025-07-30 09:3$index AM',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Requests'),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Past Requests',
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
                                'Request ID',
                                style: TextStyle(
                                  fontSize: 12.spMax,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
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
                                'Date & Time',
                                style: TextStyle(
                                  fontSize: 12.spMax,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                          rows: List.generate(
                            pastRequests.length,
                            (index) => _dataRow(pastRequests[index], context),
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

  DataRow _dataRow(Map<String, String> data, BuildContext context) {
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
        DataCell(Text(data['id']!, style: TextStyle(fontSize: 10.spMax))),
        DataCell(
          Text(data['bloodType']!, style: TextStyle(fontSize: 10.spMax)),
        ),
        DataCell(Text(data['quantity']!, style: TextStyle(fontSize: 10.spMax))),
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
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        DataCell(Text(data['dateTime']!, style: TextStyle(fontSize: 10.spMax))),
      ],
    );
  }
}
