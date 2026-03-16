import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/presentation/screeen_ui/profile/profile/profilewidget/profilewidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/services/profilecontroller.dart';
import '../screenwidgets/bottomnav_button.dart';

class Action extends StatelessWidget {
  const Action({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      bottomNavigationBar: const CustomBottomNav(selectIndex: 4),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "profile".tr, // Key exists in AppTranslations
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xffF0F0F0),
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  "assets/images/Ellipse 2.png",
                  height: 120,
                  width: 120,
                ),
              ),
              const SizedBox(height: 40),

              //==================== Notification Section ====================
              Obx(() => Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icon/mingcute_notification-fill.svg",
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Notifications".tr, // Matches key 'Notifications'
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.toggleNotification(),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: controller.isNotificationOn.value
                              ? const LinearGradient(
                            colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)],
                          )
                              : null,
                          color: controller.isNotificationOn.value
                              ? null
                              : const Color(0xFF3E4146),
                        ),
                        child: AnimatedAlign(
                          duration: const Duration(milliseconds: 200),
                          alignment: controller.isNotificationOn.value
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),

              //==================== Other Profile Widgets ====================
              Profilewidget(
                text: "Payments".tr, // Matches key 'Payments'
                icon: "assets/icon/fluent_payment-20-filled.svg",
                onTap: () {},
              ),
              Profilewidget(
                text: "Subscription".tr, // Matches key 'Subscription'
                icon: "assets/icon/Group.svg",
                onTap: () => Get.toNamed(AppRoutes.subcription),
              ),
              Profilewidget(
                text: "Privacy".tr, // Matches key 'Privacy'
                icon: "assets/icon/tabler_lock-filled.svg",
                onTap: () {},
              ),
              Profilewidget(
                text: "Terms of Use".tr, // Matches key 'Terms of Use'
                icon: "assets/icon/material-symbols_privacy-tip.svg",
                onTap: () {},
              ),

              const SizedBox(height: 26),

              // Logout Button
              GestureDetector(
                onTap: () => controller.logout(),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff21242A),
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(
                      color: const Color(0xff47494E),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icon/majesticons_logout.svg"),
                        const SizedBox(width: 10),
                        Text(
                          "logout".tr, // Matches lowercase key 'logout' in your map
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}