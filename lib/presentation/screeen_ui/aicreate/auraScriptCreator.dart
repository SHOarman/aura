import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/aicontrollergrobel.dart';

class AuraScriptCreator extends StatelessWidget {
  final bool isAuraMode;
  AuraScriptCreator({super.key, this.isAuraMode = true});

  final AiControllerGlobal aiController = Get.put(AiControllerGlobal());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Script"),
            _buildScriptBox(),

            const SizedBox(height: 25),

            _buildLabel("Style"),
            _buildStyleBox(),

            const SizedBox(height: 25),
            _buildDropdownField("Select your category"),

            const SizedBox(height: 15),
            _buildIconTextField(
              Icons.music_note_outlined,
              "Add an audio title",
            ),

            const SizedBox(height: 40),

            Obx(() {
              bool isValid = isAuraMode
                  ? aiController.isAuraFormValid
                  : aiController.isOwnFormValid;
              return _buildCreateButton(isValid);
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


  Widget _buildScriptBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          TextField(
            maxLines: 8,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            onChanged: (val) => aiController.updateScript(val, isAuraMode),
            decoration: InputDecoration(
              hintText: isAuraMode
                  ? "Generate text with AI..."
                  : "Write your own script...",
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: 14,
              ),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              if (isAuraMode) _buildAiBadge(),
              const Spacer(),
              _buildActionIcon(Icons.refresh),
              const SizedBox(width: 12),
              _buildActionIcon(Icons.fullscreen),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStyleBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            maxLines: 6,
            controller: isAuraMode
                ? aiController.auraStyleInputController
                : aiController.ownStyleInputController,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            onChanged: (val) => aiController.updateStyle(val, isAuraMode),
            decoration: InputDecoration(
              hintText: "Enter your own style",
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: 14,
              ),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: [
              _buildChip("+ calm sea", "calm sea"),
              _buildChip("+ Cosmos", "Cosmos"),
              _buildChip("+ male voice", "male voice"),
              _buildChip("+ with music", "with music"),
              _buildChip("+ without music", "without music"),
              _buildChip("+ 5 min", "5 min"),
              _buildChip("+ 10 min", "10 min"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreateButton(bool isValid) {
    return GestureDetector(
      onTap: isValid ? () => print("Creating...") : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: isValid
              ? const LinearGradient(
                  colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)],
                )
              : null,
          color: isValid ? null : const Color(0xFF2E2C3D),
          boxShadow: isValid
              ? [
                  BoxShadow(
                    color: const Color(0xFF4C65E3).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [

          ],
        ),
        child: Center(
          child: Text(
            "Create",
            style: TextStyle(
              color: isValid ? Colors.white : Colors.white24,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildChip(String label, String value) {
    return GestureDetector(
      onTap: () => aiController.addStyleChip(value, isAuraMode),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildAiBadge() {
    return Container(
      height: 40,
      width: 216,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF5B67F1), Color(0xFFC356E2)],
        ),
      ),
      child: const Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.auto_awesome, color: Colors.white, size: 20),
          SizedBox(width: 8),
          Center(
            child: Text(
              "AI Generated",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.05),
      ),
      child: Icon(icon, color: Colors.white54, size: 18),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () => Get.back(),
      ),
      title: Text(
        isAuraMode ? "Aura AI Script" : "Custom Script",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDropdownField(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white54, fontSize: 15),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
        ],
      ),
    );
  }

  Widget _buildIconTextField(IconData icon, String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white54, size: 20),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white24, fontSize: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
