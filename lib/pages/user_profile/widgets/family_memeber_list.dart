import 'package:checkup/core/data/models/family_member_model.dart';
import 'package:checkup/pages/user_profile/user_profile_controller.dart';
import 'package:checkup/utils/logger.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'family_member_card.dart';

class FamilyMembersList extends StatelessWidget {
  const FamilyMembersList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserProfileController>();
    return SizedBox(
      height: 70.h,
      child: Center(
        child: StreamBuilder(
          stream: controller.getStreamOfFamilyMembers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<FamilyMemberModel> members =
                  snapshot.data as List<FamilyMemberModel>;
              return ListView.builder(
                itemCount: snapshot.data!.length + 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return index == snapshot.data!.length
                      ? AddMemberButton(
                          onPressed: () {
                            myLog.i('Add Member Button Pressed');
                            Get.toNamed('/add_family_member');
                          },
                        )
                      : FamilyMemberCard(
                          imageUrl: members[index].imageUrl!,
                          relation: members[index].relation.name,
                        );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class AddMemberButton extends StatelessWidget {
  final Function()? onPressed;

  const AddMemberButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 60.w,
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.Circle,
            color: Colors.black,
            strokeWidth: 1,
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.add),
              iconSize: 30.sp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
