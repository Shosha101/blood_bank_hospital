import 'package:blood_bank_hospital/core/extension/navigation_extension.dart';
import 'package:blood_bank_hospital/core/helpers/spacing.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/features/inventory_management/ui/inventory_management_screen.dart';
import 'package:blood_bank_hospital/features/past_requests/ui/past_requests_screen.dart';
import 'package:blood_bank_hospital/features/settings/ui/settings_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: Row(
          children: [
            SideBarXExample(controller: _controller),
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
                                  _buildDashboardContent(context);
                              break;
                            case Routes.inventoryManagementScreen:
                              builder = (context) =>
                                  const InventoryManagementScreen();
                              break;
                            case Routes.settingsScreen:
                              builder = (context) => const SettingsScreen();
                              break;
                            case Routes.pastRequesScreen:
                              builder = (context) => const PastRequestsScreen();
                              break;
                            default:
                              builder = (context) =>
                                  const Center(child: Text('Screen Not Found'));
                          }
                          return MaterialPageRoute(
                            builder: builder,
                            settings: settings,
                          );
                        },
                      );
                    case 1:
                      return Navigator(
                        key: UniqueKey(),
                        onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) =>
                              const InventoryManagementScreen(),
                        ),
                      );
                    case 2:
                      return Navigator(
                        key: UniqueKey(),
                        onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    case 3:
                      // Logout: Navigate to LoginScreen and clear navigation stack
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        context.pushNamedAndRemoveUntil(
                          Routes.loginScreen,
                          predicate: (Route<dynamic> route) => false,
                        );
                      });
                      return const Center(child: CircularProgressIndicator());
                    default:
                      return const Center(
                        child: Text('Home', style: TextStyle(fontSize: 40)),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32.h),
            child: Row(
              children: [
                _buildSummaryCard('50', 'Open Requests'),
                SizedBox(width: 16.w),
                _buildSummaryCard('30', 'Pending Requests'),
                SizedBox(width: 16.w),
                _buildSummaryCard('120', 'Completed Requests'),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Recent Requests',
            style: TextStyle(fontSize: 22.spMax, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 25.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.pushNamed(Routes.pastRequesScreen);
              },
              child: Text(
                'View All Requests',
                style: TextStyle(
                  color: HexColor('#1A8AE5'),
                  fontSize: 12.spMax,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
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
                        dataRowMaxHeight: 65.h,
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
                          requests.length,
                          (index) => _dataRow(requests[index], context),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Spacer(),
              SizedBox(
                width: 216.w,
                height: 40.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#1A8AE5'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        String? selectedBloodType;
                        return AlertDialog(
                          title: Text('Add New Request'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 58.h,
                                child: DropdownButtonFormField2<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Blood Type',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                  items:
                                      [
                                            'A+',
                                            'A-',
                                            'B+',
                                            'B-',
                                            'O+',
                                            'O-',
                                            'AB+',
                                            'AB-',
                                          ]
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
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Quantity',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO: handle submit
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Submit Request',
                                style: TextStyle(
                                  color: HexColor('#1A8AE5'),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Add Request',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.spMax,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(20),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String number, String title) {
    return SizedBox(
      width: 207.w,
      height: 130.h,
      child: Card(
        color: HexColor('#F0F2F5'),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: TextStyle(
                  fontSize: 20.spMax,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.spMax,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
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
        DataCell(
          Text(
            data['id']!,
            style: TextStyle(fontSize: 10.spMax, fontFamily: 'Poppins'),
          ),
        ),
        DataCell(
          Text(
            data['bloodType']!,
            style: TextStyle(fontSize: 10.spMax, fontFamily: 'Poppins'),
          ),
        ),
        DataCell(
          Text(
            data['quantity']!,
            style: TextStyle(fontSize: 10.spMax, fontFamily: 'Poppins'),
          ),
        ),
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
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Text(
            data['dateTime']!,
            style: TextStyle(fontSize: 10.spMax, fontFamily: 'Poppins'),
          ),
        ),
      ],
    );
  }
}

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({super.key, required SidebarXController controller})
    : _controller = controller;
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: SidebarX(
        controller: _controller,
        headerBuilder: (context, extended) {
          return Padding(
            padding: EdgeInsets.only(top: 20.0.h),
            child: Flexible(
              child: Center(
                child: Image.asset(
                  'assets/images/safe_blood.png',
                  width: 50.w,
                  height: 50.h,
                ),
              ),
            ),
          );
        },
        headerDivider: Padding(
          padding: const EdgeInsets.only(top: 9.0, bottom: 10),
          child: Divider(color: Colors.grey, height: 1),
        ),
        theme: SidebarXTheme(
          decoration: BoxDecoration(
            border: Border.all(color: HexColor('#E1E4E8')),
          ),
          iconTheme: IconThemeData(color: HexColor('#42526D')),
          selectedItemDecoration: BoxDecoration(
            color: HexColor('#1A8AE5'),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          selectedIconTheme: const IconThemeData(color: Colors.white),
        ),
        extendedTheme: SidebarXTheme(
          width: 180,
          textStyle: TextStyle(
            color: Color(0xFF23262A),
            fontSize: 12.spMax,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          selectedTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 12.spMax,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
          hoverTextStyle: TextStyle(
            color: Color(0xFF23262A),
            fontSize: 12.spMax,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          itemPadding: EdgeInsets.only(left: 25, right: 15, top: 10),
          selectedItemPadding: EdgeInsets.all(15),
          itemTextPadding: EdgeInsets.only(left: 10),
          selectedItemTextPadding: EdgeInsets.only(left: 10),
          iconTheme: IconThemeData(size: 18, color: Colors.black),
          selectedIconTheme: IconThemeData(size: 18, color: Colors.white),
          selectedItemMargin: EdgeInsets.only(left: 15, right: 25),
        ),
        items: [
          SidebarXItem(icon: Icons.dashboard, label: 'Dashboard'),
          SidebarXItem(icon: Icons.inventory, label: 'Inventory Management'),
          SidebarXItem(icon: Icons.settings, label: 'Settings'),
          SidebarXItem(icon: Icons.logout, label: 'Logout'),
        ],
        footerDivider: Divider(height: 1, color: HexColor('#E1E4E8')),
      ),
    );
  }
}
