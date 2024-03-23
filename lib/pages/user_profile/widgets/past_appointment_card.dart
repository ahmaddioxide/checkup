import 'package:checkup/consts/assets.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PastAppointmentCard extends StatelessWidget {
  const PastAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: AppColors.primary,
                child: Image.asset(sampleProfile),
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dr. Abram George',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppColors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      Text(
                        '\$100',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppColors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: AppColors.primary,
                                  size: 14.sp,
                                ),
                                Text(
                                  ' 4.5',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Submitted',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Icon(
                        Icons.video_call,
                        color: AppColors.grey,
                        size: 18.sp,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Video Session',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppColors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'M. Shahzaib (me)',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppColors.grey,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      Text(
                        'Monday, OCT 20, 08:00 PM',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppColors.grey,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
