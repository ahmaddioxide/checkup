import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkup/core/data/models/user_model.dart';
import 'package:checkup/pages/edit_profile/edit_profile_controller.dart';
import 'package:checkup/pages/widgets/custom_button.dart';
import 'package:checkup/pages/widgets/custom_text_fields_with_title.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:checkup/utils/logger.dart';
import 'package:checkup/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileController editProfileController =
        Get.find<EditProfileController>();

    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final dateOfBirthController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.grey,
              ),
        ),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: editProfileController.getUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            myLog.e(snapshot.error.toString());
            return const Center(child: Text('An error occurred'));
          } else {
            final UserModel user = snapshot.data;
            fullNameController.text = user.fullName;
            emailController.text = user.email;
            phoneNumberController.text = user.phoneNumber ?? '';
            dateOfBirthController.text = user.dateOfBirth;
            editProfileController.gender.value = user.gender;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //client image and edit button
                      Stack(
                        children: [
                          Obx(() {
                            if (editProfileController.imageUrl.value.isEmpty) {
                              return CircleAvatar(
                                radius: 50.r,
                                backgroundColor: AppColors.grey,
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              );
                            } else {
                              return CachedNetworkImage(
                                imageUrl: editProfileController.imageUrl.value,
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                  radius: 50.r,
                                  backgroundImage: imageProvider,
                                ),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              );
                            }
                          }),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 18.r,
                              backgroundColor: AppColors.primary,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  editProfileController.updateImage();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),
                      TextFieldWithTitle(
                        title: 'Full Name',
                        hintText: 'Enter your full name',
                        controller: fullNameController,
                        keyboardType: TextInputType.text,
                        validator: isName,
                      ),
                      SizedBox(height: 12.h),
                      TextFieldWithTitle(
                        title: 'Email',
                        hintText: 'Enter your email',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: isEmail,
                        isDisabled: true,
                      ),
                      SizedBox(height: 12.h),
                      TextFieldWithTitle(
                        title: 'Phone Number',
                        hintText: 'Enter your phone number',
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        validator: isPhoneNumber,
                      ),
                      SizedBox(height: 12.h),
                      InkWell(
                        onTap: () async {
                          String? selectedDate = await editProfileController
                              .showDatePickerDialog(context);
                          if (selectedDate != null) {
                            dateOfBirthController.text = selectedDate;
                          } else {}
                        },
                        child: TextFieldWithTitle(
                          title: 'Date of Birth',
                          hintText: 'Enter your date of birth',
                          controller: dateOfBirthController,
                          keyboardType: TextInputType.datetime,
                          isDisabled: true,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Birth Gender',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.grey,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(width: 6.w),
                          //two radio buttons
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150.w,
                                  child: RadioListTile(
                                    title: Text(
                                      'Male',
                                      style:
                                          editProfileController.gender.value ==
                                                  'male'
                                              ? const TextStyle(
                                                  color: AppColors.primary,
                                                )
                                              : const TextStyle(
                                                  color: AppColors.grey,),
                                    ),
                                    value: 'male',
                                    groupValue:
                                        editProfileController.gender.value,
                                    onChanged: (value) => editProfileController
                                        .gender.value = value.toString(),
                                  ),
                                ),
                                SizedBox(
                                  width: 150.w,
                                  child: RadioListTile(
                                    title: Text(
                                      'Female',
                                      style:
                                          editProfileController.gender.value ==
                                                  'female'
                                              ? const TextStyle(
                                                  color: AppColors.primary,
                                                )
                                              : const TextStyle(
                                                  color: AppColors.grey,),
                                    ),
                                    value: 'female',
                                    groupValue:
                                        editProfileController.gender.value,
                                    onChanged: (value) => editProfileController
                                        .gender.value = value.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          PrimaryButton(
                            text: 'Update',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final UserModel newUser = user.copyWith(
                                  fullName: fullNameController.text,
                                  phoneNumber: phoneNumberController.text,
                                  dateOfBirth: dateOfBirthController.text,
                                  gender: editProfileController.gender.value,
                                  imageUrl:
                                      editProfileController.imageUrl.value,
                                );
                                myLog.i(newUser.toString());

                                // Update the user data
                                editProfileController
                                    .updateUserData(newUser)
                                    .then((value) {
                                  if (value) {
                                    Get.snackbar(
                                      'Success',
                                      'Profile updated successfully',
                                      backgroundColor: AppColors.primary,
                                      colorText: AppColors.white,
                                    );
                                  } else {
                                    Get.snackbar(
                                      'Error',
                                      'An error occurred',
                                      backgroundColor: AppColors.tertiary,
                                      colorText: AppColors.white,
                                    );
                                  }
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
