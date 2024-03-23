import 'package:checkup/core/services/auth_service.dart';
import 'package:checkup/src/theme/app_colors.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  Future<void> onLoginPressed(
      {required String email, required String password,}) async {
   final credentials= await AuthService()
        .signInWithEmailAndPassword(email, password)
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
    if (credentials != null) {
      Get.offAllNamed('/');
    }

  }
}
