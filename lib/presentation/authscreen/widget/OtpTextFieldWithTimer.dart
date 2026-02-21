import 'dart:async';
import 'package:flutter/material.dart';

class OtpTextFieldWithTimer extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onSendCode;
  final int timerDuration;

  const OtpTextFieldWithTimer({
    super.key,
    required this.controller,
    this.hintText = "Code",
    required this.onSendCode,
    this.timerDuration = 60,
  });

  @override
  State<OtpTextFieldWithTimer> createState() => _OtpTextFieldWithTimerState();
}

class _OtpTextFieldWithTimerState extends State<OtpTextFieldWithTimer> {
  Timer? _timer;
  int _secondsRemaining = 0;
  bool _isTimerRunning = false;

  void _startTimer() {
    setState(() {
      _secondsRemaining = widget.timerDuration;
      _isTimerRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _isTimerRunning = false;
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color(0xff7C7C7C)),
          filled: true,
          fillColor: const Color(0xff1C1C1C),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(99),
            borderSide: const BorderSide(color: Color(0xff333333)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(99),
            borderSide: const BorderSide(color: Color(0xff1C1C1C)),
          ),

          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const VerticalDivider(
                    color: Color(0xff333333),
                    indent: 12,
                    endIndent: 12,
                    thickness: 1,
                  ),
                  TextButton(
                    onPressed: _isTimerRunning
                        ? null
                        : () {
                      widget.onSendCode();
                      _startTimer();
                    },
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xff4C65E3), Color(0xffD75BE3)],
                      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                      child: Text(
                        _isTimerRunning
                            ? "Resend in ${_secondsRemaining}s"
                            : "Send code",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}