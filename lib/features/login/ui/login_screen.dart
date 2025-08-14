import 'package:blood_bank_hospital/core/extension/navigation_extension.dart';
import 'package:blood_bank_hospital/core/helpers/spacing.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hospital',
          style: TextStyle(
            color: ColorsManager.mainAppFontColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0.5,
        backgroundColor: ColorsManager.gradientBackgroundColorWhite,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 160.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(26.h),

            Center(
              child: Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 28.spMax,
                  color: ColorsManager.mainAppFontColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            verticalSpace(25.h),
            //label
            Text(
              'Username',
              style: TextStyle(fontSize: 12.spMax, color: Colors.black),
            ),
            SizedBox(
              width: 448.w,
              height: 56.h,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
            verticalSpace(24.h),
            //label
            Text(
              'Password',
              style: TextStyle(fontSize: 12.spMax, color: Colors.black),
            ),
            SizedBox(
              width: 448.w,
              height: 56.h,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: ColorsManager.mainAppFontColor,
                  ),

                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
            verticalSpace(24.h),
            // Login Button
            SizedBox(
              width: 460.w,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                  context.pushNamed(Routes.dashboardScreen);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  backgroundColor: ColorsManager.mainBlue,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16.spMax, color: Colors.white),
                ),
              ),
            ),

            // Add more widgets here as needed
          ],
        ),
      ),
    );
  }
}
