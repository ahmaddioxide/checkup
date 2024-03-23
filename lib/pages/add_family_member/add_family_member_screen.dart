import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkup/core/data/models/family_member_model.dart';
import 'package:checkup/pages/add_family_member/add_family_member_controller.dart';
import 'package:checkup/pages/widgets/custom_button.dart';
import 'package:checkup/pages/widgets/custom_text_fields_with_title.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:checkup/utils/logger.dart';
import 'package:checkup/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/data/enums/relations_enum.dart';

class AddFamilyMemberScreen extends StatelessWidget {
  const AddFamilyMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddFamilyMemberController addFamilyMemberController =
        Get.find<AddFamilyMemberController>();

    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final dateOfBirthController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Family Member',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.grey,
              ),
        ),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
      ),
      body: Padding(
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
                      if (addFamilyMemberController.imageUrl.value.isEmpty) {
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
                          imageUrl: addFamilyMemberController.imageUrl.value,
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
                        backgroundColor: AppColors.grey,
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            addFamilyMemberController.updateImage();
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),
                TextFieldWithTitle(
                  title: 'Full Name',
                  hintText: 'Enter full name of family member',
                  controller: fullNameController,
                  keyboardType: TextInputType.text,
                  validator: isName,
                ),
                SizedBox(height: 12.h),
                //drop down to select relation
                Row(
                  children: [
                    Text(
                      'Relation',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Obx(
                  () => DropdownButtonFormField<Relations>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                    value: addFamilyMemberController.relation.value,
                    onChanged: (Relations? value) {
                      addFamilyMemberController.relation.value = value!;
                    },
                    items: Relations.values
                        .map(
                          (relation) => DropdownMenuItem<Relations>(
                            value: relation,
                            child: Text(
                              relation.toString().split('.').last,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
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
                  title: 'Phone Number',
                  hintText: 'Enter phone number of family member',
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  validator: isPhoneNumber,
                ),
                SizedBox(height: 12.h),
                InkWell(
                  onTap: () async {
                    String? selectedDate = await addFamilyMemberController
                        .showDatePickerDialog(context);
                    if (selectedDate != null) {
                      dateOfBirthController.text = selectedDate;
                    } else {}
                  },
                  child: TextFieldWithTitle(
                    title: 'Date of Birth',
                    hintText: 'Enter date of birth of family member',
                    controller: dateOfBirthController,
                    keyboardType: TextInputType.datetime,
                    isDisabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select a date';
                      }
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
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                                style: addFamilyMemberController.gender.value ==
                                        'male'
                                    ? const TextStyle(
                                        color: AppColors.primary,
                                      )
                                    : const TextStyle(color: AppColors.grey),
                              ),
                              value: 'male',
                              groupValue:
                                  addFamilyMemberController.gender.value,
                              onChanged: (value) => addFamilyMemberController
                                  .gender.value = value.toString(),
                            ),
                          ),
                          SizedBox(
                            width: 150.w,
                            child: RadioListTile(
                              title: Text(
                                'Female',
                                style: addFamilyMemberController.gender.value ==
                                        'female'
                                    ? const TextStyle(
                                        color: AppColors.primary,
                                      )
                                    : const TextStyle(color: AppColors.grey),
                              ),
                              value: 'female',
                              groupValue:
                                  addFamilyMemberController.gender.value,
                              onChanged: (value) => addFamilyMemberController
                                  .gender.value = value.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    PrimaryButton(
                      text: 'Add',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final FamilyMemberModel newRelation =
                              FamilyMemberModel(
                            fullName: fullNameController.text,
                            relation: addFamilyMemberController.relation.value,
                            imageUrl: addFamilyMemberController.imageUrl.value,
                            dateOfBirth: dateOfBirthController.text,
                            phoneNumber: phoneNumberController.text,
                            gender: addFamilyMemberController.gender.value,
                          );
                          myLog.i(newRelation.toString());

                          // Update the user data
                          addFamilyMemberController
                              .addFamilyMember(newRelation)
                              .then((value) {
                            Get.back();
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
      ),
    );
  }
}
