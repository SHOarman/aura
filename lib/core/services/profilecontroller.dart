import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Notification state
  var isNotificationOn = true.obs;

  void toggleNotification() {
    isNotificationOn.value = !isNotificationOn.value;
  }

  void logout() {
    print("Logout successful");
  }
}