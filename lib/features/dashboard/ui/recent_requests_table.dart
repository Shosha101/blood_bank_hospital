import 'package:blood_bank_hospital/core/widgets/app_widgets.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_state.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Open and pending donation requests of the hospital.
class RecentRequestsTable extends StatelessWidget {
  const RecentRequestsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BlocBuilder<ActiveRequestsCubit, ActiveRequestsState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (requests) {
                if (requests.isEmpty) {
                  return Center(
                    child: StateMessage(
                      icon: Icons.inbox_outlined,
                      title: context.tr('no_requests'),
                      body: context.tr('no_requests_body'),
                    ),
                  );
                }
                return AppTable(
                  columns: [
                    context.tr('col_request_id'),
                    context.tr('col_blood_type'),
                    context.tr('col_quantity'),
                    context.tr('col_status'),
                    context.tr('col_date'),
                  ],
                  flex: const [2, 2, 2, 2, 3],
                  rows: [
                    for (final request in requests)
                      [
                        CellText('#${request.id}', ltr: true, strong: true),
                        BloodBadge(bloodType: request.bloodTypeName, size: 36),
                        CellText(
                          context.tr('units', args: ['${request.numOfLiter}']),
                        ),
                        StatusChip(status: request.status),
                        CellText(
                          formatApiDateTime(request.createdAt),
                          ltr: true,
                        ),
                      ],
                  ],
                );
              },
              error: (errorHandler) => Center(
                child: StateMessage(
                  icon: Icons.error_outline,
                  title: context.tr('requests_error'),
                  body: errorHandler.apiErrorModel.message,
                  actionLabel: context.tr('retry'),
                  onAction: () =>
                      context.read<ActiveRequestsCubit>().getActiveRequests(),
                ),
              ),
              orElse: () => const SizedBox(
                height: 160,
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          },
        ),
      ),
    );
  }
}
