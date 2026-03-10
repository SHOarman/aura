import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/aicontrollergrobel.dart';

class CreateScriptScreen extends StatelessWidget {
  const CreateScriptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AiControllerGlobal aiController = Get.put(AiControllerGlobal());
    const bool isAura = false;

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
            _buildInputBox(
              hint: "Enter your own lyrics or describe an audio...",
              maxLines: 8,
              onChanged: (val) => aiController.updateScript(val, isAura),
            ),

            const SizedBox(height: 25),

            _buildLabel("Style"),
            _buildStyleBox(aiController, isAura),

            const SizedBox(height: 25),
            _buildDropdownField("Select your category"),

            const SizedBox(height: 15),
            _buildIconTextField(Icons.music_note_outlined, "Add an audio title"),

            const SizedBox(height: 40),

            Obx(() {
              return _buildMainButton(
                "Create",
                aiController.isOwnFormValid,
                    () => print("Own Script: ${aiController.ownScriptText.value}"),
              );
            }),
            const SizedBox(height: 20),
          ],
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

  Widget _buildInputBox({
    required String hint,
    int maxLines = 5,
    Function(String)? onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            maxLines: maxLines,
            onChanged: onChanged,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 14),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 8),
          _buildActionIcon(Icons.fullscreen),
        ],
      ),
    );
  }

  Widget _buildStyleBox(AiControllerGlobal aiController, bool isAura) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            maxLines: 6, // Layout balance korar jonno 4/6 line use kora jay
            controller: aiController.ownStyleInputController,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            onChanged: (val) => aiController.updateStyle(val, isAura),
            decoration: InputDecoration(
              hintText: "Enter your own style...",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 14),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: ["calm sea", "Cosmos", "male voice", "5 min", "with music", "without music", "10 min"]
                .map((style) => _buildChip(style, aiController, isAura))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, AiControllerGlobal controller, bool isAura) {
    return GestureDetector(
      onTap: () => controller.addStyleChip(label, isAura),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Text(
          "+ $label",
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
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

  Widget _buildMainButton(String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: isActive
              ? const LinearGradient(colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)])
              : null,
          color: isActive ? null : const Color(0xFF2E2C3D),
          boxShadow: isActive ? [
            BoxShadow(
              color: const Color(0xFF4C65E3).withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ] : [],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white38,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
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
          Text(text, style: const TextStyle(color: Colors.white54, fontSize: 15)),
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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
        onPressed: () => Get.back(),
      ),
      title: const Text(
        "Create your own script",
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}