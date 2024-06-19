import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class PageViewShow extends StatelessWidget {
  String image_path;
  String heading;
  String subtitle;
  PageViewShow(
      {super.key,
      required this.image_path,
      required this.heading,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    // String imagePath = 'assets/image/onboarding_page1.jpg';
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: MediaQuery.of(context).size.height * 0.13),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(image_path)
                    .animate()
                    .scale(duration: 1000.ms, curve: Curves.decelerate)
                    .fadeIn(duration: 2000.ms),
                const SizedBox(height: 10),
                Text(heading,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins')).animate()
                    .scale(duration: 1000.ms, curve: Curves.decelerate)
                    .fadeIn(duration: 2000.ms),
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width * 0.8,
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ).animate()
                      .scale(duration: 1000.ms, curve: Curves.decelerate)
                      .fadeIn(duration: 2000.ms),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
