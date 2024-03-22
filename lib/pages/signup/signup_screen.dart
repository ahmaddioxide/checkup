import 'package:checkup/consts/assets.dart';
import 'package:checkup/pages/login/components/remember_me.dart';
import 'package:checkup/pages/login/login_screen.dart';
import 'package:checkup/pages/widgets/custom_button.dart';
import 'package:checkup/pages/widgets/custom_image_appbar.dart';
import 'package:checkup/pages/widgets/custom_text_fields_with_title.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:checkup/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const ImageAppBar(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            logo,
                            width: 100.h,
                            height: 100.h,
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Text(
                                'Register an Account',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.grey,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          TextFieldWithTitle(
                            title: 'First Name',
                            hintText: 'Enter your first name',
                            controller: TextEditingController(),
                            keyboardType: TextInputType.name,
                            validator: isName,
                          ),
                          SizedBox(height: 12.h),
                          TextFieldWithTitle(
                            title: 'Last Name',
                            hintText: 'Enter your last name',
                            controller: TextEditingController(),
                            keyboardType: TextInputType.name,
                            validator: isName,
                          ),
                          SizedBox(height: 12.h),
                          TextFieldWithTitle(
                            title: 'Email',
                            hintText: 'Enter your email',
                            controller: TextEditingController(),
                            keyboardType: TextInputType.emailAddress,
                            validator: isEmail,
                          ),
                          SizedBox(height: 12.h),
                          //phone number
                          TextFieldWithTitle(
                            title: 'Phone Number',
                            hintText: '08012345678',
                            controller: TextEditingController(),
                            keyboardType: TextInputType.phone,
                            validator: isPhoneNumber,
                          ),
                          SizedBox(height: 12.h),

                          TextFieldWithTitle(
                            title: 'Password',
                            hintText: 'Enter your password',
                            controller: TextEditingController(),
                            keyboardType: TextInputType.visiblePassword,
                            validator: isPassword,
                          ),
                          SizedBox(height: 12.h),

                          TextFieldWithTitle(
                            title: 'Confirm Password',
                            hintText: 'Enter your password',
                            controller: TextEditingController(),
                            keyboardType: TextInputType.visiblePassword,
                            validator: isPassword,
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(height: 12.h),
                          Center(
                            child: PrimaryButton(
                              text: 'Create Account',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  debugPrint('Create Account');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.grey,
                                  ),
                        ),
                        TextButton(
                          onPressed: () {
                            debugPrint('Sign Up');
                            Get.offAll(() => const LoginScreen());
                          },
                          child: Text(
                            'Login',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
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
