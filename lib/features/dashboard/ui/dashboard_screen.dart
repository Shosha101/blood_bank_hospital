import 'package:blood_bank_hospital/core/extension/navigation_extension.dart';
import 'package:blood_bank_hospital/core/helpers/spacing.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/core/widgets/sidebar.dart';
import 'package:blood_bank_hospital/features/dashboard/data/model/donation_request_model.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/active_requests_table_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/donation_request_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/blood_type_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/blood_type_state.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_state.dart';
import 'package:blood_bank_hospital/features/dashboard/ui/recent_requests_table.dart';
import 'package:blood_bank_hospital/features/dashboard/ui/summary_card.dart';
import 'package:blood_bank_hospital/features/inventory_management/ui/inventory_management_screen.dart';
import 'package:blood_bank_hospital/features/past_requests/ui/past_requests_screen.dart';
import 'package:blood_bank_hospital/features/settings/ui/settings_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sidebarx/sidebarx.dart';

class DashBoardScreen extends StatefulWidget {
  static const String routeName = Routes.dashboardScreen;

  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  final _navigatorKey = GlobalKey<NavigatorState>();

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
      ],
      child: SafeArea(
        child: Scaffold(
          key: _key,
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 1200;
              final maxHeight = constraints.maxHeight.isFinite
                  ? constraints.maxHeight
                  : 600.h;
              final horizontalPadding = isWideScreen ? 40.w : 20.w;

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: maxHeight,
                    maxHeight: maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, _) {
                            final sidebarWidth = _controller.extended
                                ? (isWideScreen ? 280.w : 220.w)
                                : 60.w;
                            return SizedBox(
                              width: sidebarWidth,
                              child: SideBarXExample(
                                controller: _controller,
                                maxHeight: maxHeight,
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              switch (_controller.selectedIndex) {
                                case 0:
                                  return Navigator(
                                    key: _navigatorKey,
                                    initialRoute: Routes.dashboardScreen,
                                    onGenerateRoute: (settings) {
                                      WidgetBuilder builder;
                                      switch (settings.name) {
                                        case Routes.dashboardScreen:
                                          builder = (context) =>
                                              _buildDashboardContent(
                                                context,
                                                horizontalPadding,
                                              );
                                          break;
                                        case Routes.inventoryManagementScreen:
                                          builder = (context) =>
                                              const InventoryManagementScreen();
                                          break;
                                        case Routes.pastRequesScreen:
                                          builder = (context) =>
                                              const PastRequestsScreen();
                                          break;
                                        case Routes.settingsScreen:
                                          builder = (context) =>
                                              const SettingsScreen();
                                          break;
                                        default:
                                          builder = (context) => const Center(
                                            child: Text('Screen Not Found'),
                                          );
                                      }
                                      return MaterialPageRoute(
                                        builder: builder,
                                        settings: settings,
                                      );
                                    },
                                  );
                                case 1:
                                  return const InventoryManagementScreen();
                                case 2:
                                  return const PastRequestsScreen();
                                case 3:
                                  return const SettingsScreen();
                                case 4:
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    _,
                                  ) {
                                    if (mounted) {
                                      context.pushNamedAndRemoveUntil(
                                        Routes.loginScreen,
                                        predicate: (route) => false,
                                      );
                                    }
                                  });
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                default:
                                  return const Center(
                                    child: Text(
                                      'Home',
                                      style: TextStyle(fontSize: 40),
                                    ),
                                  );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardContent(
    BuildContext context,
    double horizontalPadding,
  ) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32.h),
              child: BlocBuilder<SummaryCardCubit, SummaryCardState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    success: (openRequestsCount, pendingRequestsCount) => Wrap(
                      spacing: horizontalPadding / 2,
                      runSpacing: horizontalPadding / 2,
                      children: [
                        SummaryCard(title: 'Open Requests'),
                        SummaryCard(title: 'Pending Requests'),
                      ],
                    ),
                    error: (errorHandler) => Center(
                      child: Text(
                        errorHandler.apiErrorModel.message ??
                            'Error fetching counts',
                      ),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Recent Requests',
              style: TextStyle(
                fontSize: horizontalPadding > 30 ? 22.spMax : 18.spMax,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 25.h),
            const RecentRequestsTable(),
            verticalSpace(20),
            BlocListener<DonationRequestCubit, DonationRequestState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Request added successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  error: (errorHandler) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          errorHandler.apiErrorModel.message ??
                              'Failed to add request',
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  orElse: () {},
                );
              },
              child: Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#1A8AE5'),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: horizontalPadding > 30 ? 24.w : 16.w,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      _showAddRequestDialog(context);
                    },
                    child: Text(
                      'Add New Request',
                      style: TextStyle(
                        fontSize: 16.spMax,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddRequestDialog(BuildContext context) {
    String? selectedBloodType;
    TextEditingController quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: context.read<BloodTypeCubit>()..getBloodTypes(),
          ),
          BlocProvider.value(value: context.read<DonationRequestCubit>()),
        ],
        child: AlertDialog(
          title: const Text('Add New Request'),
          content: BlocBuilder<BloodTypeCubit, BloodTypeState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    success: (bloodTypes) => DropdownButtonFormField2<String>(
                      decoration: InputDecoration(
                        labelText: 'Blood Type',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      value: selectedBloodType,
                      items: bloodTypes
                          .map(
                            (type) => DropdownMenuItem<String>(
                              value: type.name,
                              child: Text(type.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        selectedBloodType = value;
                      },
                      validator: (value) =>
                          value == null ? 'Please select a blood type' : null,
                    ),
                    error: (errorHandler) => Center(
                      child: Text(
                        errorHandler.apiErrorModel.message ??
                            'Error fetching blood types',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    orElse: () => DropdownButtonFormField2<String>(
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
                      validator: (value) =>
                          value == null ? 'Please select a blood type' : null,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextField(
                    controller: quantityController,
                    decoration: InputDecoration(
                      labelText: 'Quantity (Units)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(dialogContext).pop(),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (selectedBloodType != null &&
                              quantityController.text.isNotEmpty &&
                              int.tryParse(quantityController.text) != null &&
                              int.parse(quantityController.text) > 0) {
                            int? bloodTypeId;
                            state.maybeWhen(
                              success: (bloodTypes) {
                                bloodTypeId = bloodTypes
                                    .firstWhere(
                                      (type) => type.name == selectedBloodType,
                                    )
                                    .id;
                              },
                              orElse: () {
                                const bloodTypeMap = {
                                  'A+': 1,
                                  'A-': 2,
                                  'B+': 3,
                                  'B-': 4,
                                  'AB+': 5,
                                  'AB-': 6,
                                  'O+': 7,
                                  'O-': 8,
                                };
                                bloodTypeId = bloodTypeMap[selectedBloodType];
                              },
                            );
                            if (bloodTypeId != null) {
                              final request = DonationRequestModel(
                                bloodTypeId: bloodTypeId,
                                numOfLiter: int.parse(quantityController.text),
                                hospitalId: 2,
                              );
                              context
                                  .read<DonationRequestCubit>()
                                  .createDonationRequest(request);
                              Navigator.of(dialogContext).pop();
                            } else {
                              ScaffoldMessenger.of(dialogContext).showSnackBar(
                                const SnackBar(
                                  content: Text('Invalid blood type selected'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(dialogContext).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please select a blood type and enter a valid quantity',
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Add Request',
                          style: TextStyle(
                            color: HexColor('#1A8AE5'),
                            fontWeight: FontWeight.bold,
                          ),
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
  }
}
