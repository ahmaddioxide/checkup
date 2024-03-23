import 'package:checkup/core/data/models/user_model.dart';
import 'package:checkup/core/services/auth_service.dart';
import 'package:checkup/core/services/database_service.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  Future<void> onSignupPressed({required UserModel user}) async {
    final appUser = await AuthService()
        .signUpWithEmailAndPassword(user.email, user.password)
        .onError((error, stackTrace) {
      Get.snackbar(
        'Error',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primary,
        colorText: AppColors.white,
      );
      return null;
    });

    await DatabaseService()
        .createUser(user.toMap())
        .onError((error, stackTrace) {
      Get.snackbar(
        'Error',
        'An error occurred while creating user data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primary,
        colorText: AppColors.white,
      );
      return null;
    });


    if (appUser != null) {
      Get.offAllNamed('/');
    }
  }
}
