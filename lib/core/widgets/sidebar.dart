import 'package:blood_bank_hospital/core/helpers/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:blood_bank_hospital/features/login/logic/login_cubit.dart';

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
    _loadSelectedIndex();
    // Listen to controller changes to save selectedIndex
    widget._controller.addListener(_saveSelectedIndex);
  }

  Future<void> _loadExpandedState() async {
    final prefs = await SharedPreferences.getInstance();
    final isExtended = prefs.getBool('sidebar_extended') ?? true;
    if (mounted) {
      widget._controller.setExtended(isExtended);
    }
  }

  Future<void> _loadSelectedIndex() async {
    final selectedIndex = await SharedPrefHelper.getSecuredInt('selectedIndex');
    if (mounted && selectedIndex != null) {
      widget._controller.selectIndex(selectedIndex);
    }
  }

  Future<void> _saveExpandedState(bool isExtended) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sidebar_extended', isExtended);
  }

  Future<void> _saveSelectedIndex() async {
    final selectedIndex = widget._controller.selectedIndex;
    await SharedPrefHelper.setSecuredInt('selectedIndex', selectedIndex);
    print('Stored selectedIndex: $selectedIndex');
  }

  @override
  void dispose() {
    widget._controller.removeListener(_saveSelectedIndex);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.instance<LoginCubit>(),
      child: AnimatedBuilder(
        animation: widget._controller,
        builder: (context, _) {
          final isWideScreen = MediaQuery.of(context).size.width > 1200;
          final sidebarWidth =
              MediaQuery.of(context).size.width *
              (widget._controller.extended ? 0.2 : 0.05);
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
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/safe_blood.png',
                            width: isWideScreen ? 80.w : 60.w,
                            height: isWideScreen ? 80.h : 60.h,
                          ),
                        ],
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
                        widget._controller.selectIndex(0);
                      },
                    ),
                    SidebarXItem(
                      icon: Icons.inventory,
                      label: 'Inventory Management',
                      onTap: () {
                        widget._controller.selectIndex(1);
                      },
                    ),
                    SidebarXItem(
                      icon: Icons.request_page,
                      label: 'Past Requests',
                      onTap: () {
                        widget._controller.selectIndex(2);
                      },
                    ),
                    SidebarXItem(
                      icon: Icons.settings,
                      label: 'Settings',
                      onTap: () {
                        widget._controller.selectIndex(3);
                      },
                    ),
                    SidebarXItem(
                      icon: Icons.logout,
                      label: 'Logout',
                      onTap: () {
                        widget._controller.selectIndex(4);
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
    );
  }
}