import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiControllerGlobal extends GetxController {
  // --- Aura Script Mode Variables ---
  var auraScriptText = ''.obs;
  var auraStyleText = ''.obs;
  final TextEditingController auraStyleInputController = TextEditingController();

  // --- Write Own Script Mode Variables ---
  var ownScriptText = ''.obs;
  var ownStyleText = ''.obs;
  final TextEditingController ownStyleInputController = TextEditingController();

  // validation getters
  bool get isAuraFormValid => auraScriptText.value.trim().isNotEmpty && auraStyleText.value.trim().isNotEmpty;
  bool get isOwnFormValid => ownScriptText.value.trim().isNotEmpty && ownStyleText.value.trim().isNotEmpty;

  // Generic Update Methods based on mode
  void updateScript(String val, bool isAuraMode) {
    if (isAuraMode) auraScriptText.value = val;
    else ownScriptText.value = val;
  }

  void updateStyle(String val, bool isAuraMode) {
    if (isAuraMode) auraStyleText.value = val;
    else ownStyleText.value = val;
  }

  void addStyleChip(String chipValue, bool isAuraMode) {
    if (isAuraMode) {
      _updateText(auraStyleText, auraStyleInputController, chipValue);
    } else {
      _updateText(ownStyleText, ownStyleInputController, chipValue);
    }
  }

  void _updateText(RxString textVar, TextEditingController controller, String chipValue) {
    if (textVar.value.isEmpty) {
      textVar.value = chipValue;
    } else {
      textVar.value = "${textVar.value}, $chipValue";
    }
    controller.text = textVar.value;
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  @override
  void onClose() {
    auraStyleInputController.dispose();
    ownStyleInputController.dispose();
    super.onClose();
  }
}