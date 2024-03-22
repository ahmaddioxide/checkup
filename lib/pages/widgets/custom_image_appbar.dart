import 'package:checkup/consts/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageAppBar extends StatelessWidget {
  const ImageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      appBarBG,
      width: double.infinity,
      height: 60.h,
      fit: BoxFit.cover,
    );
  }
}
