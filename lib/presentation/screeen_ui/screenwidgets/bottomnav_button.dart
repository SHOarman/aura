import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:aura/core/routes/app_routes.dart';

class CustomBottomNav extends StatefulWidget {
  final int selectIndex;
  const CustomBottomNav({super.key, this.selectIndex = 0});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  late int myIndex;

  @override
  void initState() {
    super.initState();
    myIndex = widget.selectIndex;
  }

  void _navigateToScreen(int index) {
    if (index == 0) Get.offNamed(AppRoutes.home);
    if (index == 1) Get.offNamed(AppRoutes.vsualisation);
    if (index == 2) Get.offNamed(AppRoutes.aicreate);
    if (index == 3) Get.offNamed(AppRoutes.motivation);
    if (index == 4) Get.offNamed(AppRoutes.action);
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = ["Home", "Library", "", "Progress", "Profile"];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 85,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1124).withOpacity(0.9),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(titles.length, (index) {
          bool isSelected = myIndex == index;

          if (index == 2) {
            return GestureDetector(
              onTap: () => _navigateToScreen(2),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Color(0xFF0D0219),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icon/pluse.svg",
                      height: 26,
                      width: 26,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              setState(() => myIndex = index);
              _navigateToScreen(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _getIcon(index, isSelected),
                const SizedBox(height: 5),
                Text(
                  titles[index],
                  style: TextStyle(
                    color: isSelected ? Colors.transparent : Colors.white,
                    fontSize: 12,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ).buildWithGradient(isSelected),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _getIcon(int index, bool isSelected) {
    String iconPath = isSelected ? _activeIcons[index] : _inactiveIcons[index];
    return SvgPicture.asset(
      iconPath,
      height: 24,
      colorFilter: isSelected
          ? null
          : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }

  final List<String> _inactiveIcons = [
    'assets/icon/whitehome.svg',
    'assets/icon/inactive.svg',
    '',
    'assets/icon/inaciveprogress.svg',
    'assets/icon/actionwhite.svg',
  ];

  final List<String> _activeIcons = [
    'assets/icon/colorshome.svg',
    'assets/icon/activelevary.svg',
    '',
    'assets/icon/activeprogress.svg',
    'assets/icon/iconamoon_profile-fill.svg',
  ];
}

extension GradientText on Text {
  Widget buildWithGradient(bool isSelected) {
    if (!isSelected) return this;
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)],
      ).createShader(Offset.zero & bounds.size),
      child: copyWith(style: style?.copyWith(color: Colors.white)),
    );
  }

  Text copyWith({TextStyle? style}) {
    return Text(data ?? "", style: style ?? this.style);
  }
}