
// lib/features/past_requests/ui/past_requests_screen.dart
import 'package:blood_bank_hospital/features/past_requests/data/model/pasts_requests_model.dart';

import 'package:blood_bank_hospital/features/past_requests/logic/past_requests_cubit.dart';
import 'package:blood_bank_hospital/features/past_requests/logic/past_requests_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class PastRequestsScreen extends StatefulWidget {
  const PastRequestsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PastRequestsState();
}

class _PastRequestsState extends State<PastRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<PastRequestsCubit>()..getPastRequests(),
      child: Scaffold(
        
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
                child: BlocBuilder<PastRequestsCubit, PastRequestsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: CircularProgressIndicator()),
                      success: (completedRequests) => LayoutBuilder(
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
                                  headingRowColor: const WidgetStatePropertyAll(
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
                                    completedRequests.length,
                                    (index) => _dataRow(completedRequests[index], context),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      error: (errorHandler) => Center(
                        child: Text(
                          errorHandler.apiErrorModel.message ?? 'Error fetching past requests',
                          style: TextStyle(fontSize: 16.spMax, color: Colors.red),
                        ),
                      ),
                      orElse: () => const Center(child: Text('No past requests found')),
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

  DataRow _dataRow(PastsRequestsModel request, BuildContext context) {
    Color? bColor;
    Color? fColor;
    switch (request.status) {
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
        DataCell(Text('#REQ${request.id}', style: TextStyle(fontSize: 10.spMax))),
        DataCell(Text(request.bloodTypeName, style: TextStyle(fontSize: 10.spMax))),
        DataCell(Text('${request.numOfLiter} Units', style: TextStyle(fontSize: 10.spMax))),
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
                request.status,
                style: TextStyle(
                  color: fColor,
                  fontSize: 12.spMax,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Text(
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(request.createdAt)),
            style: TextStyle(fontSize: 10.spMax),
          ),
        ),
      ],
    );
  }
}