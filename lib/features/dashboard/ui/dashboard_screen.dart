import 'package:blood_bank_hospital/core/extension/navigation_extension.dart';
import 'package:blood_bank_hospital/core/helpers/shared_preference.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/core/theming/app_theme.dart';
import 'package:blood_bank_hospital/core/widgets/app_widgets.dart';
import 'package:blood_bank_hospital/core/widgets/sidebar.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/blood_type_model.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/donation_request_model.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/blood_type_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/blood_type_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_state.dart';
import 'package:blood_bank_hospital/features/dashboard/ui/blood_availability_panel.dart';
import 'package:blood_bank_hospital/features/dashboard/ui/recent_requests_table.dart';
import 'package:blood_bank_hospital/features/dashboard/ui/summary_card.dart';
import 'package:blood_bank_hospital/features/inventory_management/ui/inventory_management_screen.dart';
import 'package:blood_bank_hospital/features/login/logic/login_cubit.dart';
import 'package:blood_bank_hospital/features/login/logic/login_state.dart';
import 'package:blood_bank_hospital/features/past_requests/ui/past_requests_screen.dart';
import 'package:blood_bank_hospital/features/settings/ui/settings_screen.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DashBoardScreen extends StatefulWidget {
  static const String routeName = Routes.dashboardScreen;

  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _restoreSelectedIndex();
  }

  Future<void> _restoreSelectedIndex() async {
    final selectedIndex = await SharedPrefHelper.getSecuredInt('selectedIndex');
    if (mounted &&
        selectedIndex != null &&
        selectedIndex >= 0 &&
        selectedIndex < AppSidebar.items.length) {
      setState(() => _selectedIndex = selectedIndex);
    }
  }

  void _select(int index) {
    setState(() => _selectedIndex = index);
    SharedPrefHelper.setSecuredInt('selectedIndex', index);
  }

  void _confirmLogout(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(dialogContext.tr('logout_title')),
        content: Text(dialogContext.tr('logout_body')),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              dialogContext.tr('cancel'),
              style: const TextStyle(color: AppColors.muted),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              loginCubit.logout();
            },
            child: Text(dialogContext.tr('logout')),
          ),
        ],
      ),
    );
  }

  Widget _buildPage() {
    switch (_selectedIndex) {
      case 1:
        return const InventoryManagementScreen();
      case 2:
        return const PastRequestsScreen();
      case 3:
        return const SettingsScreen();
      case 0:
      default:
        return const _DashboardPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<SummaryCardCubit>()..getRequestCounts(),
        ),
        BlocProvider(
          create: (context) =>
              GetIt.I<ActiveRequestsCubit>()..getActiveRequests(),
        ),
        BlocProvider(create: (context) => GetIt.I<DonationRequestCubit>()),
        BlocProvider(create: (context) => GetIt.I<BloodTypeCubit>()),
        BlocProvider(create: (context) => GetIt.I<LoginCubit>()),
      ],
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginStateLogoutSuccess) {
            context.pushNamedAndRemoveUntil(
              Routes.loginScreen,
              predicate: (route) => false,
            );
          } else if (state is LoginStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorHandler.apiErrorModel.message ??
                      context.tr('logout_failed'),
                ),
                backgroundColor: AppColors.primaryDark,
              ),
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Builder(
              builder: (context) => Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppSidebar(
                    selectedIndex: _selectedIndex,
                    onSelected: _select,
                    onLogout: () => _confirmLogout(context),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _TopBar(
                          title: context.tr(
                            AppSidebar.items[_selectedIndex].labelKey,
                          ),
                        ),
                        Expanded(child: _buildPage()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final String title;
  const _TopBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.text,
              ),
            ),
          ),
          const LanguagePill(),
        ],
      ),
    );
  }
}

class _DashboardPage extends StatelessWidget {
  const _DashboardPage();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DonationRequestCubit, DonationRequestState>(
      listener: (context, state) {
        void refresh() {
          context.read<SummaryCardCubit>().getRequestCounts();
          context.read<ActiveRequestsCubit>().getActiveRequests();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.tr('request_created')),
              backgroundColor: AppColors.success,
            ),
          );
        }

        state.maybeWhen(
          success: refresh,
          successWithRequests: (_) => refresh(),
          error: (errorHandler) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorHandler.apiErrorModel.message ??
                      context.tr('request_failed'),
                ),
                backgroundColor: AppColors.primaryDark,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<SummaryCardCubit, SummaryCardState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (openRequestsCount, completedRequestsCount) => Row(
                    children: [
                      Expanded(
                        child: SummaryCard(
                          title: context.tr('open_requests'),
                          hint: context.tr('open_requests_hint'),
                          count: openRequestsCount,
                          icon: Icons.pending_actions_outlined,
                          color: AppColors.warning,
                          background: AppColors.warningSoft,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SummaryCard(
                          title: context.tr('completed_requests'),
                          hint: context.tr('completed_requests_hint'),
                          count: completedRequestsCount,
                          icon: Icons.task_alt,
                          color: AppColors.success,
                          background: AppColors.successSoft,
                        ),
                      ),
                    ],
                  ),
                  error: (errorHandler) => AppCard(
                    child: Text(
                      errorHandler.apiErrorModel.message ??
                          context.tr('counts_error'),
                      style: const TextStyle(color: AppColors.primary),
                    ),
                  ),
                  orElse: () => const SizedBox(
                    height: 110,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const BloodAvailabilityPanel(),
            const SizedBox(height: 24),
            SectionHeader(
              title: context.tr('recent_requests'),
              subtitle: context.tr('recent_requests_subtitle'),
              action: FilledButton.icon(
                onPressed: () => showAddRequestDialog(context),
                icon: const Icon(Icons.add, size: 18),
                label: Text(context.tr('add_request')),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(0, 44),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const RecentRequestsTable(),
          ],
        ),
      ),
    );
  }
}

/// Dialog that creates a donation request for a blood type and a number of units.
void showAddRequestDialog(BuildContext context) {
  const fallbackTypes = {
    'A+': 1,
    'A-': 2,
    'B+': 3,
    'B-': 4,
    'AB+': 5,
    'AB-': 6,
    'O+': 7,
    'O-': 8,
  };

  String? selectedBloodType;
  final quantityController = TextEditingController(text: '1');

  showDialog(
    context: context,
    builder: (dialogContext) => MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: context.read<BloodTypeCubit>()..getBloodTypes(),
        ),
        BlocProvider.value(value: context.read<DonationRequestCubit>()),
      ],
      child: StatefulBuilder(
        builder: (dialogContext, setDialogState) {
          void changeQuantity(int delta) {
            final current = int.tryParse(quantityController.text) ?? 0;
            final next = (current + delta).clamp(1, 999);
            setDialogState(() => quantityController.text = next.toString());
          }

          return Dialog(
            backgroundColor: AppColors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: BlocBuilder<BloodTypeCubit, BloodTypeState>(
                  builder: (context, state) {
                    final List<BloodTypeModel>? loaded = state.maybeWhen(
                      success: (bloodTypes) => bloodTypes,
                      orElse: () => null,
                    );
                    final names =
                        loaded?.map((type) => type.name).toList() ??
                        fallbackTypes.keys.toList();
                    final loading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          context.tr('request_dialog_title'),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          context.tr('request_dialog_body'),
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.muted,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          context.tr('col_blood_type'),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (loading)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        else
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final name in names)
                                ChoiceChip(
                                  label: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Text(name),
                                  ),
                                  selected: selectedBloodType == name,
                                  onSelected: (_) => setDialogState(
                                    () => selectedBloodType = name,
                                  ),
                                  showCheckmark: false,
                                  selectedColor: AppColors.primary,
                                  backgroundColor: AppColors.surface,
                                  side: BorderSide(
                                    color: selectedBloodType == name
                                        ? AppColors.primary
                                        : AppColors.border,
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: selectedBloodType == name
                                        ? Colors.white
                                        : AppColors.text,
                                  ),
                                ),
                            ],
                          ),
                        const SizedBox(height: 20),
                        Text(
                          context.tr('quantity_units'),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _StepButton(
                              icon: Icons.remove,
                              onPressed: () => changeQuantity(-1),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: quantityController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            _StepButton(
                              icon: Icons.add,
                              onPressed: () => changeQuantity(1),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppColors.text,
                                  side: const BorderSide(
                                    color: AppColors.border,
                                  ),
                                ),
                                child: Text(context.tr('cancel')),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 2,
                              child: FilledButton(
                                onPressed: () {
                                  final quantity = int.tryParse(
                                    quantityController.text,
                                  );
                                  if (selectedBloodType == null ||
                                      quantity == null ||
                                      quantity <= 0) {
                                    ScaffoldMessenger.of(
                                      dialogContext,
                                    ).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          context.tr('request_invalid'),
                                        ),
                                        backgroundColor: AppColors.primaryDark,
                                      ),
                                    );
                                    return;
                                  }

                                  int? bloodTypeId;
                                  if (loaded != null) {
                                    for (final type in loaded) {
                                      if (type.name == selectedBloodType) {
                                        bloodTypeId = type.id;
                                      }
                                    }
                                  } else {
                                    bloodTypeId =
                                        fallbackTypes[selectedBloodType];
                                  }

                                  if (bloodTypeId == null) {
                                    ScaffoldMessenger.of(
                                      dialogContext,
                                    ).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          context.tr('request_invalid_type'),
                                        ),
                                        backgroundColor: AppColors.primaryDark,
                                      ),
                                    );
                                    return;
                                  }

                                  context
                                      .read<DonationRequestCubit>()
                                      .createDonationRequest(
                                        DonationRequestModel(
                                          bloodTypeId: bloodTypeId,
                                          numOfLiter: quantity,
                                          hospitalId: 16,
                                        ),
                                      );
                                  Navigator.of(dialogContext).pop();
                                },
                                child: Text(context.tr('create_request')),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}

class _StepButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _StepButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primarySoft,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed,
        child: SizedBox(
          width: 52,
          height: 52,
          child: Icon(icon, color: AppColors.primary),
        ),
      ),
    );
  }
}
