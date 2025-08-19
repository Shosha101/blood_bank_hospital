import 'package:blood_bank_hospital/features/settings/logic/hospital_cubit.dart';
import 'package:blood_bank_hospital/features/settings/logic/hospital_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<HospitalCubit>()..getHospitalData(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hospital Info Card
                BlocBuilder<HospitalCubit, HospitalState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const Center(child: CircularProgressIndicator()),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      success: (hospital) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(
                                  'assets/images/building.png',
                                  width: 60.w,
                                  height: 60.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hospital.name,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      hospital.areaName,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      hospital.phoneNumber,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'Min Blood Quantity: ${hospital.minimumBloodQuantityByLiter} L',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      error: (errorHandler) => Center(
                        child: Text(
                          'Error: ${errorHandler.toString()}',
                          style: TextStyle(fontSize: 14.sp, color: Colors.red),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24.h),
                Text(
                  "Help & Support",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                // Help & Support List
                ListTile(
                  leading: Icon(Icons.support_agent, color: Colors.blue, size: 24.sp),
                  title: Text("Contact Support", style: TextStyle(fontSize: 14.sp)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                  onTap: () {
                    // Navigate to Contact Support
                  },
                ),
                const Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.help_outline, color: Colors.green, size: 24.sp),
                  title: Text("FAQ", style: TextStyle(fontSize: 14.sp)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                  onTap: () {
                    // Navigate to FAQ
                  },
                ),
                const Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.report_problem, color: Colors.red, size: 24.sp),
                  title: Text("Report an Issue", style: TextStyle(fontSize: 14.sp)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                  onTap: () {
                    // Navigate to Report Issue
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}