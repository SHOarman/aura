import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiControllerGlobal extends GetxController {
  // --- Concentrao Script Mode Variables ---
  var concentraoScriptText = ''.obs;
  var concentraoStyleText = ''.obs;
  final TextEditingController concentraoStyleInputController = TextEditingController();

  // --- Write Own Script Mode Variables ---
  var ownScriptText = ''.obs;
  var ownStyleText = ''.obs;
  final TextEditingController ownStyleInputController = TextEditingController();

  // validation getters
  bool get isConcentraoFormValid => concentraoScriptText.value.trim().isNotEmpty && concentraoStyleText.value.trim().isNotEmpty;
  bool get isOwnFormValid => ownScriptText.value.trim().isNotEmpty && ownStyleText.value.trim().isNotEmpty;

  // Generic Update Methods based on mode
  void updateScript(String val, bool isConcentraoMode) {
    if (isConcentraoMode) {
      concentraoScriptText.value = val;
    } else {
      ownScriptText.value = val;
    }
  }

  void updateStyle(String val, bool isConcentraoMode) {
    if (isConcentraoMode) {
      concentraoStyleText.value = val;
    } else {
      ownStyleText.value = val;
    }
  }

  void addStyleChip(String chipValue, bool isConcentraoMode) {
    if (isConcentraoMode) {
      _updateText(concentraoStyleText, concentraoStyleInputController, chipValue);
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
    concentraoStyleInputController.dispose();
    ownStyleInputController.dispose();
    super.onClose();
  }
}
