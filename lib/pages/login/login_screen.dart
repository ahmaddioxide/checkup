import 'package:checkup/consts/assets.dart';
import 'package:checkup/pages/login/components/remember_me.dart';
import 'package:checkup/pages/login/login_controller.dart';
import 'package:checkup/pages/widgets/custom_button.dart';
import 'package:checkup/pages/widgets/custom_image_appbar.dart';
import 'package:checkup/pages/widgets/custom_text_fields_with_title.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:checkup/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                          Row(
                            children: [
                              Text(
                                'Login to our Accounts',
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
                            title: 'Email',
                            hintText: 'Enter your email',
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: isEmail,
                          ),
                          SizedBox(height: 12.h),
                          TextFieldWithTitle(
                            title: 'Password',
                            hintText: 'Enter your password',
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: isPassword,
                            isObscure: true,
                          ),
                          SizedBox(height: 12.h),
                          RememberMeRow(
                            onRememberMeChanged: (value) {
                              debugPrint(value.toString());
                              value = !value!;
                            },
                            onForgotPassword: () {
                              debugPrint('Forgot Password');
                            },
                          ),
                          SizedBox(height: 12.h),
                          Center(
                            child: PrimaryButton(
                              text: 'Login',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  debugPrint('Login');

                                  loginController.onLoginPressed(
                                    email: emailController
                                        .text.removeAllWhitespace,
                                    password: passwordController.text,
                                  );
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
                          'Don\'t have an account?',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.grey,
                                  ),
                        ),
                        TextButton(
                          onPressed: () {
                            debugPrint('Sign Up');
                            Get.offAllNamed('/signup');
                          },
                          child: Text(
                            'Register',
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
