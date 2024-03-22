import 'package:checkup/pages/widgets/custom_text_form_field.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String title;

  const TextFieldWithTitle({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.validator,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
        ),
      ],
    );
  }
}
