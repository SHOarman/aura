import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

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


  //=================SmothpageIndicator Slider==============================
  var currentPage = 0.obs;
  final PageController pageController = PageController();
  void onPageChanged(int index) {
    currentPage.value = index;
  }
  void goToNextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {

      Get.toNamed(AppRoutes.onlodaingscreen4);

    }
  }

}