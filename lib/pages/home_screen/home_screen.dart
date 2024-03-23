import 'package:checkup/consts/assets.dart';
import 'package:checkup/pages/home_screen/widgets/articles_card.dart';
import 'package:checkup/pages/home_screen/widgets/upcoming_booking_card.dart';
import 'package:checkup/pages/widgets/custom_button.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                color: AppColors.white,
                iconSize: 30.sp,
              ),
            ],
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey, Emily!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Wanna Book an Appointment?',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: PrimaryButton(
                      text: 'Book Appointment',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'You have an upcoming Appointment!!',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: AppColors.grey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          UpcomingBookingCard(
                            imagePath: sampleDoctor,
                            name: 'Dr. Emma Mia',
                            time: '11:00 - 12:00 AM',
                            date: 'Monday, May 12',
                            onAttendTap: () {},
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Health Articles',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'See All',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: AppColors.grey,
                                          ),
                                    ),
                                  ),
                                ],
                              ),

                              //list view builder
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ArticleCard(
                            date: '02 July 2022',
                            heading: 'COVID- 19 Vaccine',
                            onGoPressed: () {},
                            summary:
                                'Official public service announcement on coronavirus from the world health',
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          ArticleCard(
                            date: '02 July 2022',
                            heading: 'COVID- 19 Vaccine',
                            onGoPressed: () {},
                            summary:
                                'Official public service announcement on coronavirus from the world health',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
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
