import 'package:blood_bank_hospital/core/networking/api_error_handler.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/active_requests_model.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/donation_request_model.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/blood_type_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/blood_type_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_state.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';

class RecentRequestsTable extends StatelessWidget {
  const RecentRequestsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<DonationRequestCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocListener<DonationRequestCubit, DonationRequestState>(
            listener: (context, donationState) {
              donationState.whenOrNull(
                loading: () {
                  debugPrint(
                    'RecentRequestsTable: DonationRequestCubit loading',
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Creating donation request...'),
                      backgroundColor: Colors.blue,
                    ),
                  );
                },
                success: () {
                  debugPrint(
                    'RecentRequestsTable: DonationRequestCubit success',
                  );
                  context.read<ActiveRequestsCubit>().getActiveRequests();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Donation request created successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                successWithRequests: (requests) {
                  debugPrint(
                    'RecentRequestsTable: DonationRequestCubit success with ${requests.length} requests',
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Donation request created successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                error: (errorHandler) {
                  debugPrint(
                    'RecentRequestsTable: DonationRequestCubit error - ${errorHandler.apiErrorModel.message}',
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        errorHandler.apiErrorModel.message ??
                            'Failed to create donation request',
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              );
            },
            child: BlocBuilder<DonationRequestCubit, DonationRequestState>(
              builder: (context, donationState) {
                return BlocBuilder<ActiveRequestsCubit, ActiveRequestsState>(
                  builder: (context, activeState) {
                    debugPrint(
                      'RecentRequestsTable: Building with DonationRequestState: ${donationState.toString()}',
                    );
                    debugPrint(
                      'RecentRequestsTable: Building with ActiveRequestsState: ${activeState.toString()}',
                    );
                    List<ActiveRequestsModel> requests = [];
                    bool isLoading = false;

                    donationState.when(
                      initial: () {},
                      loading: () => isLoading = true,
                      success: () {},
                      successWithRequests: (donationRequests) {
                        requests = donationRequests;
                      },
                      error: (_) {},
                    );

                    if (requests.isEmpty) {
                      activeState.maybeWhen(
                        loading: () => isLoading = true,
                        success: (activeRequests) => requests = activeRequests,
                        orElse: () {},
                      );
                    }

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        if (isLoading) {
                          debugPrint(
                            'RecentRequestsTable: Showing loading indicator',
                          );
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (requests.isEmpty) {
                          debugPrint(
                            'RecentRequestsTable: No requests available',
                          );
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: HexColor('#637887')),
                            ),
                            child: const Center(
                              child: Text('No requests available'),
                            ),
                          );
                        }

                        debugPrint(
                          'RecentRequestsTable: Rendering table with ${requests.length} requests',
                        );
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: HexColor('#637887')),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 420.h),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    width: constraints.maxWidth,
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
                                        headingRowColor:
                                            const WidgetStatePropertyAll(
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
                                          DataColumn(
                                            label: Text(
                                              'Blood Type',
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
                                          (index) => _dataRow(
                                            requests[index],
                                            context,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static DataRow _dataRow(ActiveRequestsModel data, BuildContext context) {
    Color? bColor;
    Color? fColor;
    switch (data.status) {
      case 'Completed':
        bColor = HexColor('#ECFDF3');
        fColor = HexColor('#009881');
        break;
      case 'In Progress':
        bColor = HexColor('#E9F3FF');
        fColor = HexColor('#4A72FF');
        break;
      case 'Open':
        bColor = HexColor('#FFFADF');
        fColor = HexColor('#ECA600');
        break;
    }

    return DataRow(
      cells: [
        DataCell(Text('#REQ${data.id}', style: _cellStyle)),
        DataCell(Text(data.bloodTypeName, style: _cellStyle)),
        DataCell(Text('${data.numOfLiter} Units', style: _cellStyle)),
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
                data.status,
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
        DataCell(Text(data.createdAt, style: _cellStyle)),
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
