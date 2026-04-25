import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/preparation_pop_up.dart';
import '../../../core/services/aicontrollergrobel.dart';
import '../library/widget/saving_screen.dart';

class Createscriptscreen extends StatefulWidget {
  final bool isConcentraoMode;
  final String? initialCategory; // Home থেকে আসা ক্যাটাগরি ধরার জন্য

  const Createscriptscreen({
    super.key,
    this.isConcentraoMode = false,
    this.initialCategory,
  });

  @override
  State<Createscriptscreen> createState() => _CreatescriptscreenState();
}

class _CreatescriptscreenState extends State<Createscriptscreen> {
  final TextEditingController _scriptController = TextEditingController();
  final PageController _pageController = PageController();
  final RxInt _currentStep = 0.obs;

  // late ব্যবহার করা হয়েছে কারণ এটি initState এ ইনিশিয়ালাইজ হবে
  late RxString selectedCategory;
  final RxString selectedDuration = "".obs;
  final TextEditingController audioTitleController = TextEditingController();
  final RxString audioTitle = "".obs;

  AiControllerGlobal get aiController => Get.put(AiControllerGlobal());

  final List<String> categories = [
    "Pre-Performance Focus",
    "Confidence Reinforcement",
    "Pressure Control",
    "Peak State Activation",
  ];

  @override
  void initState() {
    // স্ক্রিন লোড হওয়ার সময় ক্যাটাগরি সেট করা
    selectedCategory = (widget.initialCategory ?? "select_your_category").obs;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _resetFields();
    });
  }

  void _resetFields() {
    _scriptController.clear();
    audioTitleController.clear();
    audioTitle.value = "";
    selectedDuration.value = "";

    // রিসেট করলেও যেন initialCategory টা বজায় থাকে
    selectedCategory.value = widget.initialCategory ?? "select_your_category";
    _currentStep.value = 0;

    if (widget.isConcentraoMode) {
      aiController.concentraoScriptText.value = "";
      aiController.concentraoStyleText.value = "";
      aiController.concentraoStyleInputController.clear();
    } else {
      aiController.ownScriptText.value = "";
      aiController.ownStyleText.value = "";
      aiController.ownStyleInputController.clear();
    }
  }

  String get _stepTitle {
    switch (_currentStep.value) {
      case 0:
        return "Describe the moment".tr;
      case 1:
        return "select_your_category".tr;
      case 2:
        return "style".tr;
      case 3:
        return "Duration".tr;
      case 4:
        return "add_an_audio_title".tr;
      default:
        return "";
    }
  }

  void _nextStep() {
    HapticFeedback.lightImpact();
    _pageController.nextPage(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutQuart,
    );
  }

  void _prevStep() {
    if (_currentStep.value > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutQuart,
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
        title: "Building your mental rehearsal…".tr,
        imagePath: "assets/images/nenenen.png",
      ),
    );

    Timer(const Duration(seconds: 4), () {
      if (Get.isDialogOpen ?? false) Get.back();

      Get.to(
            () => SavingScreen(
          title: audioTitle.value.trim(),
          category: selectedCategory.value.tr,
          duration: selectedDuration.value,
          imagePath: "assets/images/Frame 1171275468.png",
          subTitle: 'prepare_mind_before_moments'.tr,
        ),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 1000),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: _prevStep,
        ),
        title: Obx(() => Text(
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
          Obx(() => _buildStepWrapper(
            _buildScriptBox(),
            "next".tr,
            _nextStep,
            widget.isConcentraoMode
                ? aiController.concentraoScriptText.value.trim().isNotEmpty
                : aiController.ownScriptText.value.trim().isNotEmpty,
          ),
          ),
          _buildCategoryStep(),
          Obx(() => _buildStepWrapper(
            _buildStyleBox(),
            "next".tr,
            _nextStep,
            widget.isConcentraoMode
                ? aiController.concentraoStyleText.value.trim().isNotEmpty
                : aiController.ownStyleText.value.trim().isNotEmpty,
          ),
          ),
          Obx(() => _buildStepWrapper(
            _buildDurationBox(),
            "next".tr,
            _nextStep,
            selectedDuration.value.isNotEmpty,
          ),
          ),
          Obx(() => _buildStepWrapper(
            _buildTitleInput(),
            "create".tr,
            _handleFinalCreate,
            audioTitle.value.trim().isNotEmpty,
          ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryStep() {
    return Obx(() {
      bool isAnySelected = selectedCategory.value != "select_your_category";

      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: categories.map((cat) {
                    bool isSelected = selectedCategory.value == cat;
                    return GestureDetector(
                      onTap: () {
                        selectedCategory.value = cat;
                        HapticFeedback.selectionClick();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: CustomPaint(
                          painter: BoxGradientPainter(
                            radius: 15,
                            gradient: isSelected
                                ? const LinearGradient(colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)])
                                : const LinearGradient(colors: [Colors.white10, Colors.white10]),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: isSelected ? const Color(0xFF4C65E3).withValues(alpha: 0.05) : Colors.white.withValues(alpha: 0.02),
                            ),
                            child: Center(
                              child: Text(
                                cat.tr,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.white70,
                                  fontSize: 16,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildActionButton("next".tr, _nextStep, isAnySelected),
          ],
        ),
      );
    });
  }

  Widget _buildStepWrapper(Widget content, String buttonText, VoidCallback onBtnTap, bool isValid) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(child: SingleChildScrollView(child: _buildGradientWrapper(child: content, radius: 24))),
          const SizedBox(height: 20),
          _buildActionButton(buttonText, onBtnTap, isValid),
        ],
      ),
    );
  }

  Widget _buildScriptBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _scriptController,
        maxLines: 12,
        style: const TextStyle(color: Colors.white),
        onChanged: (val) => aiController.updateScript(val, widget.isConcentraoMode),
        decoration: InputDecoration(
          hintText: "Describe the moment".tr,
          hintStyle: const TextStyle(color: Colors.white24, fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildStyleBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            String current = widget.isConcentraoMode ? aiController.concentraoStyleText.value : aiController.ownStyleText.value;
            return Text(
              current.isEmpty ? "Select Styles...".tr : current,
              style: TextStyle(color: current.isEmpty ? Colors.white24 : Colors.white, fontSize: 15),
            );
          }),
          const SizedBox(height: 20),
          const Text("Atmosphere", style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildStyleGroup(["Calm Presence", "Deep Focus"]),
          const SizedBox(height: 16),
          const Text("Voice", style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildStyleGroup(["Commanding Male", "Soothing Female"]),
          const SizedBox(height: 16),
          const Text("Music", style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildStyleGroup(["Ambient Beats", "No Music"]),
        ],
      ),
    );
  }

  Widget _buildStyleGroup(List<String> styles) {
    return Obx(() {
      String current = widget.isConcentraoMode ? aiController.concentraoStyleText.value : aiController.ownStyleText.value;
      return Wrap(
        spacing: 6,
        runSpacing: 8,
        children: styles.map((s) {
          bool isSelected = current.contains(s);
          return _buildCustomChip(
            label: isSelected ? s : "+ $s",
            isSelected: isSelected,
            onTap: () => aiController.addStyleChip(s, widget.isConcentraoMode),
          );
        }).toList(),
      );
    });
  }

  Widget _buildDurationBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Text(
            selectedDuration.value.isEmpty ? "Duration...".tr : selectedDuration.value,
            style: TextStyle(color: selectedDuration.value.isEmpty ? Colors.white24 : Colors.white, fontSize: 16),
          ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: ["5 min", "10 min", "20 min"].map((time) {
              bool isSelected = selectedDuration.value == time;
              return _buildCustomChip(
                label: isSelected ? time : "+ $time",
                isSelected: isSelected,
                onTap: () {
                  selectedDuration.value = time;
                  HapticFeedback.selectionClick();
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomChip({required String label, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF462F54) : const Color(0xFF2A2331),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isSelected ? const Color(0xFF5E4070) : const Color(0xFF3F3B4E)),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.white70, fontSize: 12)),
      ),
    );
  }

  Widget _buildTitleInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: audioTitleController,
        onChanged: (val) => audioTitle.value = val,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: SvgPicture.asset(
            "assets/icon/mdi_music.svg",
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
            errorBuilder: (c, e, s) => const Icon(Icons.edit, color: Colors.white54),
          ),
          hintText: "add_an_audio_title".tr,
          hintStyle: const TextStyle(color: Colors.white24),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onTap, bool isValid) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: isValid ? Colors.transparent : const Color(0xFF2E2C3D),
        child: InkWell(
          onTap: isValid ? onTap : null,
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: isValid ? const LinearGradient(colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)]) : null,
            ),
            child: Center(
              child: Text(
                text.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
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
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}