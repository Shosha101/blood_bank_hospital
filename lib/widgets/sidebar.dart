
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sidebarx/sidebarx.dart';

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
        extendedTheme: const SidebarXTheme(
          width: 180,
          textStyle: TextStyle(
            color: Color(0xFF23262A),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          selectedTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
          hoverTextStyle: TextStyle(
            color: Color(0xFF23262A),
            fontSize: 12,
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
