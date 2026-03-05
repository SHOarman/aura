import 'package:flutter/material.dart';

class CreateScriptScreen extends StatelessWidget {
  const CreateScriptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Create your own script",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Script"),
            _buildCustomTextField("Enter your own lyrics or describe a audio", maxLines: 8, showExpand: true),

            const SizedBox(height: 20),

            _buildLabel("Style"),
            _buildCustomTextField("Enter your own style", maxLines: 8),

            const SizedBox(height: 15),

            // Chips section
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildChoiceChip("+ clam sea"),
                _buildChoiceChip("+ Cosmos"),
                _buildChoiceChip("+ with music"),
                _buildChoiceChip("+ without music"),
                _buildChoiceChip("+ male voice"),
                _buildChoiceChip("+ 5 min"),
                _buildChoiceChip("+ 10 min"),
              ],
            ),

            const SizedBox(height: 20),

            _buildDropdownField("Select your category"),

            const SizedBox(height: 15),

            _buildIconTextField(Icons.music_note_outlined, "Add a audio title"),

            const SizedBox(height: 40),

            // The Primary Action Button
            _buildGradientButton("Create", () {}),
          ],
        ),
      ),
    );
  }

  // --- UI Helper Components ---

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildCustomTextField(String hint, {int maxLines = 1, bool showExpand = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          TextField(
            maxLines: maxLines,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              border: InputBorder.none,
            ),
          ),
          if (showExpand)
            const Positioned(
              bottom: 0,
              right: 0,
              child: Icon(Icons.fullscreen, color: Colors.grey, size: 20),
            ),
        ],
      ),
    );
  }

  Widget _buildChoiceChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 12),
      ),
    );
  }

  Widget _buildDropdownField(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(color: Colors.white70)),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
        ],
      ),
    );
  }

  Widget _buildIconTextField(IconData icon, String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white70, size: 20),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildGradientButton(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}