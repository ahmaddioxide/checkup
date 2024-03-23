import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../src/theme/app_colors.dart';

class WhiteCard extends StatelessWidget {
  final String heading;
  final String subHeading;

  const WhiteCard({super.key, required this.heading, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 60.h,
      child: Card(
        elevation: 4,
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              heading,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ), /**/
            ),
            SizedBox(height: 4.h),
            Text(
              subHeading,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
