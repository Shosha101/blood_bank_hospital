import 'package:blood_bank_hospital/core/extension/navigation_extension.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/features/login/logic/login_cubit.dart';
import 'package:blood_bank_hospital/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBarXExample extends StatefulWidget {
  const SideBarXExample({
    super.key,
    required SidebarXController controller,
    required this.maxHeight,
  }) : _controller = controller;

  final SidebarXController _controller;
  final double maxHeight;

  @override
  State<SideBarXExample> createState() => _SideBarXExampleState();
}

class _SideBarXExampleState extends State<SideBarXExample> {
  @override
  void initState() {
    super.initState();
    _loadExpandedState();
  }

  Future<void> _loadExpandedState() async {
    final prefs = await SharedPreferences.getInstance();
    final isExtended = prefs.getBool('sidebar_extended') ?? true;
    if (mounted) {
      widget._controller.setExtended(isExtended);
    }
  }

  Future<void> _saveExpandedState(bool isExtended) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sidebar_extended', isExtended);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.instance<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginStateLogoutSuccess) {
            // Navigate to LoginScreen after successful logout
            context.pushReplacementNamed(Routes.loginScreen);
          } else if (state is LoginStateError) {
            // Show error message if logout fails
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorHandler.apiErrorModel.message ?? 'Logout failed',
                ),
              ),
            );
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWideScreen = constraints.maxWidth > 1200;
            final sidebarWidth = widget._controller.extended
                ? (isWideScreen ? 280.w : 220.w)
                : 60.w;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: sidebarWidth,
              height: widget.maxHeight,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: widget.maxHeight,
                  child: SidebarX(
                    controller: widget._controller,
                    headerBuilder: (context, extended) {
                      return Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Image.asset(
                          'assets/images/safe_blood.png',
                          width: isWideScreen ? 80.w : 60.w,
                          height: isWideScreen ? 80.h : 60.h,
                        ),
                      );
                    },
                    headerDivider: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Divider(color: Colors.grey, height: 1),
                    ),
                    theme: SidebarXTheme(
                      width: sidebarWidth,
                      decoration: BoxDecoration(
                        border: Border.all(color: HexColor('#E1E4E8')),
                      ),
                      iconTheme: IconThemeData(
                        color: HexColor('#42526D'),
                        size: isWideScreen ? 20.w : 18.w,
                      ),
                      selectedItemDecoration: BoxDecoration(
                        color: HexColor('#1A8AE5'),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      selectedIconTheme: const IconThemeData(color: Colors.white),
                      itemPadding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: isWideScreen ? 15.w : 10.w,
                      ),
                      selectedItemPadding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: isWideScreen ? 15.w : 10.w,
                      ),
                    ),
                    extendedTheme: SidebarXTheme(
                      width: sidebarWidth,
                      decoration: BoxDecoration(
                        border: Border.all(color: HexColor('#E1E4E8')),
                      ),
                      textStyle: TextStyle(
                        color: const Color(0xFF23262A),
                        fontSize: isWideScreen ? 16.sp : 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      selectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: isWideScreen ? 16.sp : 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      hoverTextStyle: TextStyle(
                        color: const Color(0xFF23262A),
                        fontSize: isWideScreen ? 16.sp : 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      iconTheme: IconThemeData(
                        size: isWideScreen ? 20.w : 18.w,
                        color: Colors.black,
                      ),
                      selectedIconTheme: IconThemeData(
                        size: isWideScreen ? 20.w : 18.w,
                        color: Colors.white,
                      ),
                      itemPadding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: isWideScreen ? 15.w : 10.w,
                      ),
                      selectedItemPadding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: isWideScreen ? 15.w : 10.w,
                      ),
                      itemTextPadding: EdgeInsets.only(left: 12.w),
                      selectedItemTextPadding: EdgeInsets.only(left: 12.w),
                    ),
                    items: [
                      SidebarXItem(
                        icon: Icons.dashboard,
                        label: 'Dashboard',
                        onTap: () {
                          context.pushNamed(Routes.dashboardScreen);
                        },
                      ),
                      SidebarXItem(
                        icon: Icons.inventory,
                        label: 'Inventory Management',
                        onTap: () {
                          context.pushNamed(Routes.inventoryManagementScreen);
                        },
                      ),
                      SidebarXItem(
                        icon: Icons.request_page,
                        label: 'Past Requests',
                        onTap: () {
                          context.pushNamed(Routes.pastRequestsScreen);
                        },
                      ),
                      SidebarXItem(
                        icon: Icons.settings,
                        label: 'Settings',
                        onTap: () {
                          context.pushNamed(Routes.settingsScreen);
                        },
                      ),
                      SidebarXItem(
                        icon: Icons.logout,
                        label: 'Logout',
                        onTap: () {
                          // Call logout from LoginCubit
                          context.read<LoginCubit>().logout();
                        },
                      ),
                    ],
                    footerDivider: Divider(height: 1, color: HexColor('#E1E4E8')),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}