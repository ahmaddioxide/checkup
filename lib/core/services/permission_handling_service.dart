import 'package:permission_handler/permission_handler.dart';
class PermissionHandlingService{


  Future<bool> checkPermission(Permission permission) async {
    final status = await permission.status;
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> requestMultiplePermissions(List<Permission> permissions) async {
    final statuses = await permissions.request();
    if (statuses[Permission.camera]!.isGranted &&
        statuses[Permission.storage]!.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  //Request Gallery Permission
  Future<bool> requestGalleryPermission() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}