import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkup/consts/assets.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyMemberCard extends StatelessWidget {
  final String imageUrl;
  final String relation;

  const FamilyMemberCard(
      {super.key, required this.imageUrl, required this.relation,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 60.h,
      child: Column(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              height: 50.h,
              width: 50.h,
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                sampleProfile,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            relation,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.grey,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
