import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var isNotificationOn = true.obs;
  void toggleNotification() => isNotificationOn.value = !isNotificationOn.value;

  var selectedImagePath = ''.obs;
  var userName = 'Shohidul Islam'.obs;
  
  final nameEditController = TextEditingController();

  void updateName(String newName) {
    if (newName.trim().isNotEmpty) {
      userName.value = newName.trim();
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selectedImagePath.value = image.path;
    }
  }
  
  void logout() {
    Get.offAllNamed('/login'); // Update with proper route if needed
  }

  @override
  void onClose() {
    nameEditController.dispose();
    super.onClose();
  }
}