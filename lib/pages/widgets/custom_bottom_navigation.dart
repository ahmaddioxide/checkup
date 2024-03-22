import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        bottom: Platform.isAndroid ? 16.h : 0,
      ),
      child: BottomAppBar(
        elevation: 0.0,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10.r,
                offset: const Offset(0, 0),
                spreadRadius: 0,
              ),
            ],
          ),
          height: 80.h,
          child: Row(
            children: [
              navItem(
                Icons.home_outlined,
                pageIndex == 0,
                onTap: () => onTap(0),
              ),
              navItem(
                Icons.calendar_month_outlined,
                pageIndex == 1,
                onTap: () => onTap(1),
              ),
              navItem(
                Icons.notifications_none_outlined,
                pageIndex == 2,
                onTap: () => onTap(2),
              ),
              navItem(
                Icons.person_2_outlined,
                pageIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selected ? AppColors.primary : AppColors.grey,
            ),
            SizedBox(height: 4.h),
            Container(
              height: 2.h,
              width: 14.h,
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
