import 'package:checkup/pages/user_profile/user_profile_controller.dart';
import 'package:checkup/pages/user_profile/widgets/family_memeber_list.dart';
import 'package:checkup/pages/user_profile/widgets/profile_detail_widget.dart';
import 'package:checkup/pages/user_profile/widgets/white_card.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/past_appointment_card.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserProfileController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                color: AppColors.white,
                iconSize: 26.sp,
              ),
              Text(
                'My Profile',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined),
                color: AppColors.white,
                iconSize: 26.sp,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26.r),
                  topRight: Radius.circular(26.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ProfileDetailWidget(),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const WhiteCard(
                          heading: '24y 4m',
                          subHeading: 'Age',
                        ),
                        SizedBox(width: 10.w),
                        const WhiteCard(
                          heading: 'Male',
                          subHeading: 'Gender',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          Text(
                            'Family Members',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: AppColors.grey,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const FamilyMembersList(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          Text(
                            'Past Appointments',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: AppColors.grey,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const Column(
                      children: [
                        PastAppointmentCard(),
                        PastAppointmentCard(),
                        PastAppointmentCard(),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
