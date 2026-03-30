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

  //================= SmothpageIndicator Slider & Validation ==============================
  var currentPage = 0.obs;
  final PageController pageController = PageController();

  // ৩ নম্বর পেজের কার্ড সিলেকশন ট্র্যাক করার জন্য নতুন ভেরিয়েবল
  var onboardingSelectedCard = (-1).obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void goToNextPage() {
    // লজিক: যদি ৩ নম্বর পেজে (index 2) থাকে এবং কার্ড সিলেক্ট না করা হয়
    if (currentPage.value == 2 && onboardingSelectedCard.value == -1) {
      Get.snackbar(
        "Selection Required",
        "Please select an option to continue",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      return; // সিলেক্ট না করলে এখানেই আটকে দিবে, নেক্সট পেজে যাবে না
    }

    // পেজ পরিবর্তন লজিক
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // ৩ নম্বর পেজে কার্ড সিলেক্ট করা থাকলে ৪ নম্বর পেজে যাবে
      Get.toNamed(AppRoutes.onboardingScreen4);
    }
  }

  //==================== quickmentalsessionscard ==================
  var selectedSession = "".obs;
  void selectSession(String name) {
    selectedSession.value = name;
  }

  //====================== onboarding6data favoriteicon =====================
  var isFavorite = false.obs;
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  //========= localization ========================
  void setAutoLanguage(BuildContext context) {
    String deviceLanguage = View.of(context).platformDispatcher.locale.languageCode;
    if (deviceLanguage == 'fr') {
      Get.updateLocale(const Locale('fr', 'FR'));
    } else {
      Get.updateLocale(const Locale('en', 'US'));
    }
  }
}