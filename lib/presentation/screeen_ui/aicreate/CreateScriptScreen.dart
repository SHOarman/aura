import 'dart:async';
import 'package:aura/core/services/aicontrollergrobel.dart';
import 'package:aura/presentation/screeen_ui/library/widget/savingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Createscriptscreen extends StatefulWidget {
  final bool isAuraMode;
  Createscriptscreen({super.key, this.isAuraMode = true});

  @override
  State<Createscriptscreen> createState() => _AuraScriptCreatorState();
}

class _AuraScriptCreatorState extends State<Createscriptscreen> {
  final AiControllerGlobal aiController = Get.put(AiControllerGlobal());
  final PageController _pageController = PageController();
  final RxInt _currentStep = 0.obs;

  final RxString selectedCategory = "select_your_categroy".obs;
  final TextEditingController audioTitleController = TextEditingController();

  final List<String> categories = [
    "mental_preparation",
    "confidence_reinforcement",
    "pressure_control",
    "peak_state_activation",
  ];

  final List<Color> bgGradientColors = const [
    Color(0x4D1B1424),
    Color(0x26574074),
  ];

  String get _stepTitle {
    switch (_currentStep.value) {
      case 0: return "create_your_own_script".tr;
      case 1: return "style".tr;
      case 2: return "select_your_categroy".tr;
      case 3: return "create_your_own_script".tr;
      default: return "";
    }
  }

  void _nextStep() => _pageController.nextPage(
    duration: 300.milliseconds,
    curve: Curves.easeInOut,
  );

  void _prevStep() {
    if (_currentStep.value > 0) {
      _pageController.previousPage(
        duration: 300.milliseconds,
        curve: Curves.easeInOut,
      );
    } else {
      Get.back();
    }
  }

  void _handleFinalCreate() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PreparationPopUp(
        title: audioTitleController.text.trim(),
        imagePath: "assets/images/nenenen.png",
      ),
    );

    Timer(const Duration(seconds: 10), () {
      if (Get.isDialogOpen ?? false) Get.back();

      Get.to(
            () => Savingscreen(
          title: audioTitleController.text.trim(),
          category: selectedCategory.value.tr,
          duration: "ten_min".tr,
          imagePath: "assets/images/Frame 1171275468.png",
          subTitle: 'prepare_mind_before_moments'.tr,
        ),
      );
    });
  }

  void _showCategoryPopup() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: Color(0xFF1B1424),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "select_your_categroy".tr,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    categories[index].tr,
                    style: const TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    selectedCategory.value = categories[index];
                    Navigator.pop(context);
                    _nextStep();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0B15),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: _prevStep,
        ),
        title: Obx(
              () => Text(
            _stepTitle,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => _currentStep.value = index,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildStepWrapper(_buildScriptBox(), "continue_btn".tr, _nextStep),
          _buildStepWrapper(_buildStyleBox(), "continue_btn".tr, _nextStep),
          _buildCategoryPage(),
          _buildStepWrapper(_buildTitleInput(), "create".tr, _handleFinalCreate),
        ],
      ),
    );
  }

  Widget _buildStepWrapper(Widget content, String buttonText, VoidCallback onBtnTap) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: _buildGradientWrapper(child: content, radius: 24),
            ),
          ),
          const SizedBox(height: 20),
          _buildActionButton(buttonText, onBtnTap, true),
        ],
      ),
    );
  }

  Widget _buildCategoryPage() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _showCategoryPopup,
            child: _buildGradientWrapper(
              radius: 18,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                decoration: BoxDecoration(
                  color: bgGradientColors[0],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Text(
                      selectedCategory.value.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    )),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScriptBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        maxLines: 12,
        style: const TextStyle(color: Colors.white),
        onChanged: (val) => aiController.updateScript(val, widget.isAuraMode),
        decoration: InputDecoration(
          hintText: widget.isAuraMode ? "generate_text_with_ai".tr : "write_your_own_script".tr,
          hintStyle: const TextStyle(color: Colors.white24),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildStyleBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget.isAuraMode ? aiController.auraStyleInputController : aiController.ownStyleInputController,
            maxLines: 6,
            style: const TextStyle(color: Colors.white),
            onChanged: (val) => aiController.updateStyle(val, widget.isAuraMode),
            decoration: InputDecoration(
              hintText: "style".tr,
              hintStyle: const TextStyle(color: Colors.white24),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ["Calm Sea", "cosmos", "male_voice", "with_music", "without_music", "five_min", "ten_min"]
                .map((key) => ActionChip(
              label: Text("+ ${key.tr}", style: const TextStyle(color: Colors.white70, fontSize: 12)),
              backgroundColor: Colors.white.withOpacity(0.05),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () => aiController.addStyleChip(key.tr, widget.isAuraMode),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: audioTitleController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: const Icon(Icons.music_note, color: Colors.white54),
          hintText: "add_a_audio_title".tr,
          hintStyle: const TextStyle(color: Colors.white24),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onTap, bool isValid) {
    return InkWell(
      onTap: isValid ? onTap : null,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: isValid ? const LinearGradient(colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)]) : null,
          color: isValid ? null : const Color(0xFF2E2C3D),
        ),
        child: Center(
          child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        ),
      ),
    );
  }

  Widget _buildGradientWrapper({required Widget child, required double radius}) {
    return CustomPaint(
      painter: BoxGradientPainter(
        radius: radius,
        gradient: const LinearGradient(colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)]),
      ),
      child: child,
    );
  }
}

class PreparationPopUp extends StatelessWidget {
  final String title;
  final String imagePath;

  const PreparationPopUp({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF1B1424),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: Color(0xFF574074), width: 1),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Crafting your preparation...".tr,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          if (title.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
          const SizedBox(height: 30),
          Container(
            height: 120,
            width: 120,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)]),
            ),
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF1B1424)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFD75BE3)),
            strokeWidth: 2,
          ),
        ],
      ),
    );
  }
}

class BoxGradientPainter extends CustomPainter {
  final double radius;
  final Gradient gradient;
  BoxGradientPainter({required this.radius, required this.gradient});
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}