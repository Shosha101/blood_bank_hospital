import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/active_requests_model.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_state.dart';
import 'package:get_it/get_it.dart';

class RecentRequestsTable extends StatelessWidget {
  const RecentRequestsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<DonationRequestCubit>(),
      child: BlocBuilder<DonationRequestCubit, DonationRequestState>(
        builder: (context, donationState) {
          donationState.maybeWhen(
            success: () {
              context.read<ActiveRequestsCubit>().getActiveRequests();
            },
            orElse: () {},
          );

          return BlocBuilder<ActiveRequestsCubit, ActiveRequestsState>(
            builder: (context, state) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    success: (requests) => Container(
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
                                      (index) =>
                                          _dataRow(requests[index], context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    error: (errorHandler) => Center(
                      child: Text(
                        errorHandler.apiErrorModel.message ??
                            'Error fetching requests',
                      ),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              );
            },
          );
        },
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
      case 'Pending':
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
