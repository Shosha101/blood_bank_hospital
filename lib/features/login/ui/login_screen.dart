import 'package:blood_bank_hospital/core/extension/navigation_extension.dart';
import 'package:blood_bank_hospital/core/helpers/responsive_helper.dart';
import 'package:blood_bank_hospital/core/helpers/spacing.dart';
import 'package:blood_bank_hospital/core/routing/routes.dart';
import 'package:blood_bank_hospital/core/theming/colors.dart';
import 'package:blood_bank_hospital/features/login/logic/login_cubit.dart';
import 'package:blood_bank_hospital/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initialize any async operations or animations here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hospital',
          style: TextStyle(
            color: ColorsManager.mainAppFontColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        elevation: 0.5,
        backgroundColor: ColorsManager.gradientBackgroundColorWhite,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final formWidth = ResponsiveHelper.getFormWidth(screenWidth);
            final padding = ResponsiveHelper.getHorizontalPadding(screenWidth);
            final titleFontSize = ResponsiveHelper.getTitleFontSize(
              screenWidth,
            );

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 160.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            color: ColorsManager.mainAppFontColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      verticalSpace(25.h),
                      Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      ),
                      verticalSpace(8.h),
                      SizedBox(
                        width: formWidth,
                        height: 56.h,
                        child: TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: 'Enter your phone number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a phone number';
                            }
                            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Please enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      verticalSpace(24.h),
                      Text(
                        'Password',
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      ),
                      verticalSpace(8.h),
                      SizedBox(
                        width: formWidth,
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
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                      verticalSpace(24.h),
                      SizedBox(
                        width: formWidth,
                        height: 40.h,
                        child: BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginStateSuccess) {
                              print('Login successful: ${state.loginResponse}');
                              context.pushReplacementNamed(
                                Routes.dashboardScreen,
                              );
                            } else if (state is LoginStateError) {
                              print(
                                'Login error: ${state.errorHandler.apiErrorModel.message}',
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    state.errorHandler.apiErrorModel.message ??
                                        'Unknown error',
                                  ),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return state is LoginStateLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<LoginCubit>().login(
                                          _phoneController.text,
                                          _passwordController.text,
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      backgroundColor: ColorsManager.mainBlue,
                                    ),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                      verticalSpace(16.h),
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

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
