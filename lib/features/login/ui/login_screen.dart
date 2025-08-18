import 'package:blood_bank_hospital/core/extension/navigation_extension.dart';
import 'package:blood_bank_hospital/core/helpers/spacing.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                // Username label
                Text(
                  'Username',
                  style: TextStyle(fontSize: 12.spMax, color: Colors.black),
                ),
                SizedBox(
                  width: 448.w,
                  height: 56.h,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      if (value.length < 3) {
                        return 'Username must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSpace(24.h),
                // Password label
                Text(
                  'Password',
                  style: TextStyle(fontSize: 12.spMax, color: Colors.black),
                ),
                SizedBox(
                  width: 448.w,
                  height: 56.h,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: ColorsManager.mainAppFontColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSpace(24.h),
                // Login Button
                SizedBox(
                  width: 460.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle login logic here
                        context.pushNamed(Routes.dashboardScreen);
                      }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
