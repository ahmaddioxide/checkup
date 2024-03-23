import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkup/consts/assets.dart';
import 'package:checkup/core/data/models/user_model.dart';
import 'package:checkup/pages/user_profile/user_profile_controller.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileDetailWidget extends StatelessWidget {
  const ProfileDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserProfileController>();
    return StreamBuilder(
      stream: controller.getStreamOfUserProfile(),
      builder: (context, snapshot) {
        final UserModel user = snapshot.data as UserModel;
        if (snapshot.hasData) {
          return Column(
            children: [
              SizedBox(
                height: 12.h,
                width: double.infinity,
              ),
              Stack(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      height: 80.h,
                      width: 80.h,
                      imageUrl: user.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Image.asset(
                        sampleProfile,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed('/edit_profile');
                        },
                        icon: Center(
                          child: Icon(
                            Icons.edit,
                            color: AppColors.white,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                user.fullName,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 4.h),
              Text(
                user.email,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
