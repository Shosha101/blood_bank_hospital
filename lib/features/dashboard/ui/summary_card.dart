import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_state.dart';
import 'package:get_it/get_it.dart';

class SummaryCard extends StatelessWidget {
  final String title;

  const SummaryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<DonationRequestCubit>(),
      child: BlocBuilder<DonationRequestCubit, DonationRequestState>(
        builder: (context, donationState) {
          donationState.maybeWhen(
            success: () {
              context.read<SummaryCardCubit>().getRequestCounts();
            },
            orElse: () {},
          );

          return BlocBuilder<SummaryCardCubit, SummaryCardState>(
            builder: (context, summaryState) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 1200;
                  return SizedBox(
                    width: isWideScreen ? 230.w : 207.w,
                    height: 130.h,
                    child: Card(
                      color: HexColor('#F0F2F5'),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(isWideScreen ? 16.r : 12.r),
                      ),
                      child: ClipRect(
                        child: Padding(
                          padding: EdgeInsets.all(isWideScreen ? 16.w : 12.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              summaryState.maybeWhen(
                                loading: () => const CircularProgressIndicator(),
                                success: (openRequestsCount, pendingRequestsCount) => Text(
                                  title == 'Open Requests'
                                      ? openRequestsCount.toString()
                                      : pendingRequestsCount.toString(),
                                  style: TextStyle(
                                    fontSize: isWideScreen ? 20.spMax : 18.spMax,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                error: (errorHandler) => Text(
                                  'Error',
                                  style: TextStyle(
                                    fontSize: isWideScreen ? 20.spMax : 18.spMax,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                orElse: () => Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: isWideScreen ? 20.spMax : 18.spMax,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: isWideScreen ? 16.spMax : 14.spMax,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
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
    );
  }
}