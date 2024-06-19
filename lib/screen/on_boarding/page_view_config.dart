import 'package:dhakad_tech/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../global_bottom_nav/GlobalBottomNav.dart';
import 'page_view_show.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
              onPageChanged: (int val) {
                if (val == 2) {
                  isLast = true;
                } else {
                  isLast = false;
                }
                setState(() {
                  isLast;
                });
              },
              controller: controller,
              children: [
                PageViewShow(
                  image_path: 'assets/image/only_logo.png',
                  heading: 'Dhakad Tech Application',
                  subtitle:
                      'A Flutter project by Prashant Ranjan Singh to Dhakad Technology that demonstrates API calls and favorite items.',
                ),
                PageViewShow(
                  image_path: 'assets/image/onboarding_page1.png',
                  heading: 'Api Response Viewing',
                  subtitle:
                  'My application lets you view API data as a project list with items. From Api Endpoint sended me via email.',
                ),

                PageViewShow(
                  image_path: 'assets/image/onboarding_page3.png',
                  heading: 'Add To F̌avourite',
                  subtitle:
                  'Browse through our extensive catalog of Items and effortlessly save your favorite styles for easy access later.',
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!isLast)
                  InkWell(
                      onTap: () {
                        controller.jumpToPage(3);
                      },
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            // color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Center(
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ))
                else
                  Container(
                    height: 40,
                    decoration: const BoxDecoration(
                        // color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Center(
                        child: Text('Skip',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ScrollingDotsEffect(
                      dotColor: Colors.black26,
                      activeDotColor: Colors.black,
                      fixedCenter: true,
                      dotWidth: 7,
                      activeDotScale: 1.1,
                      dotHeight: 7),
                ),
                if (!isLast)
                  InkWell(
                      onTap: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            // color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5))),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'OpenSans',fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ))
                else
                  InkWell(
                      onTap: () {
                        Get.off(const BottomNavBar(),
                            transition: Transition.fadeIn,
                            duration: const Duration(seconds: 1));
                      },
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5))),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 18, left: 18),
                          child: Center(
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'OpenSans',fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
