// lib/features/dashboard/ui/dashboard_screen.dart
import 'package:blood_bank_hospital/core/extension/navigation_extension.dart';
import 'package:blood_bank_hospital/core/helpers/spacing.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/core/widgets/sidebar.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_cubit.dart';
import 'package:blood_bank_hospital/features/dashboard/logic/summary_card_state.dart';
import 'package:blood_bank_hospital/features/dashboard/ui/dashboard_active_table.dart';
import 'package:blood_bank_hospital/features/dashboard/ui/summary_card.dart';

import 'package:blood_bank_hospital/features/inventory_management/ui/inventory_management_screen.dart';
import 'package:blood_bank_hospital/features/past_requests/ui/past_requests_screen.dart';
import 'package:blood_bank_hospital/features/settings/ui/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sidebarx/sidebarx.dart';

class DashBoardScreen extends StatefulWidget {
  static const String routeName = Routes.dashboardScreen;

  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true); // Open by default
  final _key = GlobalKey<ScaffoldState>();
  final _navigatorKey = GlobalKey<NavigatorState>();

  final List<Map<String, String>> requests = List.generate(
    5,
    (index) => {
      'id': '#REQ${index + 1}',
      'bloodType': ['A+', 'B+', 'O-', 'AB+'][index % 4],
      'quantity': '${(index + 1) * 2} Units',
      'status': ['Completed', 'In Progress', 'Pending'][index % 3],
      'dateTime': '2025-08-14 10:3$index AM',
    },
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                                      case Routes.settingsScreen:
                                        builder = (context) =>
                                            const SettingsScreen();
                                        break;
                                      case Routes.pastRequesScreen:
                                        builder = (context) =>
                                            const PastRequestsScreen();
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
                                return const SettingsScreen();
                              case 3:
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  if (mounted) {
                                    context.pushNamedAndRemoveUntil(
                                      Routes.loginScreen,
                                      predicate: (route) => false,
                                    );
                                  }
                                });
                                return const Center(
                                    child: CircularProgressIndicator());
                              default:
                                return const Center(
                                  child: Text('Home',
                                      style: TextStyle(fontSize: 40)),
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
    );
  }

  Widget _buildDashboardContent(
      BuildContext context, double horizontalPadding) {
    return BlocProvider(
      create: (context) => GetIt.I<SummaryCardCubit>()..getRequestCounts(),
      child: SingleChildScrollView(
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
                      loading: () => const Center(child: CircularProgressIndicator()),
                      success: (openRequestsCount, pendingRequestsCount) => Wrap(
                        spacing: horizontalPadding / 2,
                        runSpacing: horizontalPadding / 2,
                        children: [
                          SummaryCard(
                            number: openRequestsCount.toString(),
                            title: 'Open Requests',
                          ),
                          SummaryCard(
                            number: pendingRequestsCount.toString(),
                            title: 'Pending Requests',
                          ),
                        ],
                      ),
                      error: (errorHandler) => Center(
                        child: Text(
                          errorHandler.apiErrorModel.message ?? 'Error fetching counts',
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
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 400.h,
                ),
                child: RecentRequestsTable(requests: requests),
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}