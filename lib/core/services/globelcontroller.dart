import 'package:get/get.dart';

class Globelcontroller extends GetxController {
  //===================== selectimage ==============================
  var selectedIndex = 0.obs;
  void selectImage(int index) {
    selectedIndex.value = index;
  }

  //================ Customselectbutton ===============================
  var selectedButtonIndex = 0.obs;
  void selectButton(int index) {
    selectedButtonIndex.value = index;
  }

  //============== selectvoice =======================
  var selectedvoicesIndex = 0.obs;
  void selectedvoice(int index) {
    selectedvoicesIndex.value = index;
  }

  //================ Visualization duration ===============================
  var durationIndex = 0.obs;
  void selectedduration(int index) {
    durationIndex.value = index;
  }

  //=========================== Subscription Card Selection ==========================
  var selectedSubscription = 1.obs;

  void selectSubscription(int index) {
    selectedSubscription.value = index;
  }

  //=========================== Notification Toggle ==============================
  var isNotificationOn = true.obs;

  void toggleNotification() {
    isNotificationOn.value = !isNotificationOn.value;
  }
}