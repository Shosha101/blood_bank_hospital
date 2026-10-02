import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:blood_bank_hospital/core/widgets/app_widgets.dart';
import 'package:blood_bank_hospital/features/past_requests/data/model/pasts_requests_model.dart';
import 'package:blood_bank_hospital/features/past_requests/logic/past_requests_cubit.dart';
import 'package:blood_bank_hospital/features/past_requests/logic/past_requests_state.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PastRequestsScreen extends StatefulWidget {
  const PastRequestsScreen({super.key});

  @override
  State<PastRequestsScreen> createState() => _PastRequestsScreenState();
}

class _PastRequestsScreenState extends State<PastRequestsScreen> {
  // Status shown in the table; null shows every request.
  String? _statusFilter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<PastRequestsCubit>()..getPastRequests(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: BlocBuilder<PastRequestsCubit, PastRequestsState>(
          builder: (context, state) {
            final requests = state.maybeWhen(
              success: (pastRequests) => pastRequests,
              orElse: () => const <PastsRequestsModel>[],
            );
            final statuses = <String>[];
            for (final request in requests) {
              if (!statuses.contains(request.status)) {
                statuses.add(request.status);
              }
            }
            final filter = statuses.contains(_statusFilter)
                ? _statusFilter
                : null;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  context.tr('past_subtitle'),
                  style: const TextStyle(fontSize: 14, color: AppColors.muted),
                ),
                if (statuses.length > 1) ...[
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _FilterChip(
                        label: context.tr('filter_all'),
                        selected: filter == null,
                        onTap: () => setState(() => _statusFilter = null),
                      ),
                      for (final status in statuses)
                        _FilterChip(
                          label: StatusStyle.of(status) != null
                              ? context.tr(StatusStyle.of(status)!.labelKey)
                              : status,
                          selected: filter == status,
                          onTap: () => setState(() => _statusFilter = status),
                        ),
                    ],
                  ),
                ],
                const SizedBox(height: 14),
                AppCard(
                  padding: EdgeInsets.zero,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: state.maybeWhen(
                      success: (_) => _table(
                        context,
                        filter == null
                            ? requests
                            : requests
                                  .where((request) => request.status == filter)
                                  .toList(),
                      ),
                      error: (errorHandler) => Center(
                        child: StateMessage(
                          icon: Icons.error_outline,
                          title: context.tr('past_error'),
                          body: errorHandler.apiErrorModel.message,
                          actionLabel: context.tr('retry'),
                          onAction: () => context
                              .read<PastRequestsCubit>()
                              .getPastRequests(),
                        ),
                      ),
                      orElse: () => const SizedBox(
                        height: 220,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _table(BuildContext context, List<PastsRequestsModel> requests) {
    if (requests.isEmpty) {
      return Center(
        child: StateMessage(
          icon: Icons.history,
          title: context.tr('no_past_requests'),
          body: context.tr('no_past_requests_body'),
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
            CellText(context.tr('units', args: ['${request.numOfLiter}'])),
            StatusChip(status: request.status),
            CellText(formatApiDateTime(request.createdAt), ltr: true),
          ],
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : AppColors.surface,
      shape: StadiumBorder(
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.border,
        ),
      ),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : AppColors.text,
            ),
          ),
        ),
      ),
    );
  }
}
