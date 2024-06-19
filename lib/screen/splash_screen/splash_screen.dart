import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../on_boarding/check_first_run.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void showOnboard(){
    Future.delayed(const Duration(seconds: 3, milliseconds: 500),(){
      Get.off(const OnboardingOrMainScreen(), transition: Transition.rightToLeft, duration: 300.ms
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    showOnboard();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: Image.asset('assets/image/logo_1.png')
                  .animate()
                  .fadeIn(duration: 2000.ms)
                  .slideY(duration: 1000.ms, curve: Curves.decelerate),
            ),
          ],
        ),
      ),
    );
  }
}
