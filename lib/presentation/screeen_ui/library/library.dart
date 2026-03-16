import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screenwidgets/bottomnav_button.dart';
import 'libararyhistoriqe.dart';
import 'libraryMethode.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(selectIndex: 1),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Image.asset("assets/images/image 34.png"),
                  const SizedBox(width: 30),
                  Text(
                    "library".tr,
                    style: const TextStyle(
                      color: Color(0xffFCFDFD),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _navButton("history".tr, 0),
                    const SizedBox(width: 12),
                    _navButton("method".tr, 1),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: selectedIndex == 0
                    ? const LibraryHistorique()
                    : const Librarymethode(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(String title, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Container(
        height: 44,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x804C65E3), Color(0x33D75BE3)],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(1.2),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: isSelected
                ? const Color(0xCC59168B)
                : const Color(0xFF1B1424),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}