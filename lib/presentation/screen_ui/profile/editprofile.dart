import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// --- Imports (Apnar project onujayi path thik kore niven) ---
import '../../../core/services/profilecontroller.dart';
import '../../../globelwidgets/custombutton.dart';
import '../../../unity/appcolors/appcolors.dart';


class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor:  Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
        ),
        title: Text("Edit Profile".tr, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // --- Profile Image Section (Image Pick logic ekhane) ---
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Obx(() => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white24, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[900],
                        backgroundImage: controller.selectedImagePath.value.isNotEmpty
                            ? (kIsWeb
                            ? NetworkImage(controller.selectedImagePath.value)
                            : FileImage(File(controller.selectedImagePath.value)) as ImageProvider)
                            : const AssetImage("assets/images/Ellipse 2.png"),
                      ),
                    )),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () => _showImagePickerOptions(context, controller),
                        child: Container(
                          height: 35,
                          width: 35,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(color: Color(0xff1C4ED8), shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            "assets/icon/Frame (6).svg",
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              Text("Basic information".tr, style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),

              // --- 1. Name Card (Editable Card with Obx) ---
              Obx(() => _buildGradientBorderCard(
                child: _buildInfoRow(
                  label: "Name".tr,
                  value: controller.userName.value,
                  icon: Icons.person_outline,
                  isEditable: true,
                  onEditTap: () => _showEditNameDialog(context, controller),
                ),
              )),

              const SizedBox(height: 15),

              // --- 2. Email Card (Non-Editable Card) ---
              _buildGradientBorderCard(
                child: _buildInfoRow(
                  label: "Email".tr,
                  value: "shohidul@gmail.com",
                  icon: Icons.mail_outline,
                  isEditable: false,
                ),
              ),

              const SizedBox(height: 40),

              // --- Main Update Profile Button ---
              Custombutton(
                text: "Update Profile".tr,
                ontap: () => Get.back(),
                gradient: Appgradient.primaryGradient,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // --- Change Name Popup (Custombutton logic ekhane) ---
  void _showEditNameDialog(BuildContext context, ProfileController controller) {
    controller.nameEditController.text = controller.userName.value;
    Get.dialog(
      Dialog(
        backgroundColor: const Color(0xFF1B1424),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Change Name".tr, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(
                controller: controller.nameEditController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your name".tr,
                  hintStyle: const TextStyle(color: Colors.white24),
                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff1C4ED8))),
                ),
              ),
              const SizedBox(height: 30),

              // Apnar requested Custombutton ekhane Save hisebe add kora hoyeche
              Custombutton(
                text: "Save".tr,
                ontap: () {
                  controller.updateName(controller.nameEditController.text);
                  Get.back();
                },
                gradient: Appgradient.primaryGradient,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper: Gradient Border Card Wrapper ---
  Widget _buildGradientBorderCard({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)]),
      ),
      child: Container(
        margin: const EdgeInsets.all(1.5),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFF1B1424), borderRadius: BorderRadius.circular(19)),
        child: child,
      ),
    );
  }

  // --- Helper: Info Row (Icons & Text layout) ---
  Widget _buildInfoRow({required String label, required String value, required IconData icon, bool isEditable = false, VoidCallback? onEditTap}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: const Color(0xff1C4ED8).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: const Color(0xff1C4ED8), size: 20),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 12)),
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        if (isEditable)
          GestureDetector(
            onTap: onEditTap,
            child: Icon(Icons.edit_outlined, color: Colors.white.withValues(alpha: 0.5), size: 18),
          ),
      ],
    );
  }

  // --- Helper: Image Picker BottomSheet ---
  void _showImagePickerOptions(BuildContext context, ProfileController controller) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Color(0xFF1B1424), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.white),
              title: const Text('Gallery', style: TextStyle(color: Colors.white)),
              onTap: () { controller.pickImage(ImageSource.gallery); Get.back(); },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.white),
              title: const Text('Camera', style: TextStyle(color: Colors.white)),
              onTap: () { controller.pickImage(ImageSource.camera); Get.back(); },
            ),
          ],
        ),
      ),
    );
  }
}