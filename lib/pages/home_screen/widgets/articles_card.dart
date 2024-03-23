import 'package:checkup/consts/assets.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleCard extends StatelessWidget {
  final String date;
  final String heading;
  final String summary;
  final Function onGoPressed;

  const ArticleCard({
    super.key,
    required this.date,
    required this.heading,
    required this.onGoPressed,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 320.w,
      // height: 120.h,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(articleBG),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 4.0,
            spreadRadius: 0.2,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  date,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(
                  width: 165.w,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 260.w,
                          child: Text(
                            summary,
                            style: Theme.of(context).textTheme.titleSmall,
                            maxLines: 4,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
