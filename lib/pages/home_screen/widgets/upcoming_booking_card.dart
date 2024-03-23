import 'package:checkup/pages/home_screen/widgets/transparent_outlined_button.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingBookingCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final Function onAttendTap;
  final String time;
  final String date;

  const UpcomingBookingCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.onAttendTap,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width: 10.w),
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.grey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            TransparentOutlinedButton(
              text: 'Attend Now',
              onPressed: onAttendTap,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 45.h,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(30.r),
               ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.primary,
                      size: 18.sp,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: AppColors.primary,
                      size: 18.sp,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
