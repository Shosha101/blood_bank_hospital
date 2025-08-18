// lib/features/summary_card/ui/summary_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class SummaryCard extends StatelessWidget {
  final String number;
  final String title;

  const SummaryCard({super.key, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 1200;
        return SizedBox(
          width: isWideScreen ? 230.w : 207.w,
          height: 130.h,
          child: Card(
            color: HexColor('#F0F2F5'),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isWideScreen ? 16.r : 12.r),
            ),
            child: ClipRect(
              child: Padding(
                padding: EdgeInsets.all(isWideScreen ? 16.w : 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: isWideScreen ? 20.spMax : 18.spMax,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: isWideScreen ? 16.spMax : 14.spMax,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}