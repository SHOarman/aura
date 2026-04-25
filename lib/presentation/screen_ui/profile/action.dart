import 'package:concentrao/core/routes/app_routes.dart';
import 'package:concentrao/presentation/screen_ui/screenwidgets/bottomnav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/services/profilecontroller.dart';

class Action extends StatelessWidget {
  const Action({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      bottomNavigationBar: CustomBottomNav(selectIndex: 4),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "profile".tr,
          style: const TextStyle(
            color: Color(0xffF0F0F0),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildGradientCard(
                onTap: () {
                  Get.toNamed(AppRoutes.editProfile);
                },
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white12, width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/images/Ellipse 2.png",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Shohidul Islam",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "shohidul@example.com",
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white.withValues(alpha: 0.3),
                      size: 16,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              _buildNotificationToggle(controller),

              _buildProfileItem(
                text: "language".tr,
                iconPath: "assets/icon/globe-svgrepo-com.svg",
                onTap: () => _showLanguageBottomSheet(context),
              ),

              _buildProfileItem(
                text: "Billing".tr,
                iconPath: "assets/icon/fluent_payment-20-filled.svg",
                onTap: () {},
              ),

              _buildProfileItem(
                text: "My Plan".tr,
                iconPath: "assets/icon/Group.svg",
                onTap: () {
                  Get.toNamed(AppRoutes.subcription);
                },
              ),

              _buildProfileItem(
                text: "Privacy".tr,
                iconPath: "assets/icon/tabler_lock-filled.svg",
                onTap: () {},
              ),

              _buildProfileItem(
                text: "Terms of Use".tr,
                iconPath: "assets/icon/material-symbols_privacy-tip.svg",
                onTap: () {},
              ),

              const SizedBox(height: 50),

              _buildSecondaryButton(
                text: "Logout".tr,
                iconPath: "assets/icon/majesticons_logout.svg",
                onTap: () {
                  Get.toNamed(AppRoutes.login);
                },
                isDelete: false,
              ),

              const SizedBox(height: 16),

              _buildSecondaryButton(
                text: "Delete Account".tr,
                onTap: () => debugPrint("Delete Account Clicked"),
                isDelete: true,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton({
    required String text,
    String? iconPath,
    required VoidCallback onTap,
    required bool isDelete,
  }) {
    Color mainColor = isDelete ? Colors.redAccent : Colors.white;
    final RxBool isPressed = false.obs;

    return GestureDetector(
      onTapDown: (_) => isPressed.value = true,
      onTapUp: (_) => isPressed.value = false,
      onTapCancel: () => isPressed.value = false,
      onTap: onTap,
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            border: Border.all(
              color: isPressed.value
                  ? mainColor.withValues(alpha: 0.3)
                  : Colors.transparent,
              width: 1.5,
            ),
            color: isPressed.value
                ? mainColor.withValues(alpha: 0.12)
                : mainColor.withValues(alpha: 0.06),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null) ...[
                SvgPicture.asset(
                  iconPath,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    mainColor.withValues(alpha: 0.7),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Text(
                text,
                style: TextStyle(
                  color: mainColor.withValues(alpha: 0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required String text,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(iconPath, height: 24, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
        title: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white24,
          size: 14,
        ),
      ),
    );
  }

  Widget _buildGradientCard({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(1.5),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1B1424),
            borderRadius: BorderRadius.circular(18.5),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _buildNotificationToggle(ProfileController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.notifications, color: Colors.white, size: 24),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              "Notifications",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Obx(
            () => Switch(
              value: controller.isNotificationOn.value,
              activeTrackColor: const Color(0xFFD75BE3),
              activeThumbColor: Colors.white,
              onChanged: (val) => controller.toggleNotification(),
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Color(0xFF1A1124),
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select Language".tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                "English",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.updateLocale(const Locale('en', 'US'));
                Get.back();
              },
            ),
            ListTile(
              title: const Text(
                "Français",
                style: TextStyle(color: Colors.white),
              ),
              // onTap: () {
              //   Get.updateLocale(const Locale('fr', 'FR'));
              //   Get.back();
              // },
            ),
          ],
        ),
      ),
    );
  }
}
