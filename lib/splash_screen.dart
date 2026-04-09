import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix/core/constants/colors.dart';
import 'package:matrix/core/constants/images.dart';
import 'package:matrix/views/authentications/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0, curve: Curves.easeIn)),
    );

    _controller.forward();

    // Navigate to SignupScreen after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const SignupScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _logoAnimation,
              child: Image.asset(
                applogo,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            const SizedBox(height: 15),
            FadeTransition(
              opacity: _textAnimation,
              child: Text(
                "Collaboration shapes the future.",
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  fontStyle: FontStyle.italic,
                  // color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}