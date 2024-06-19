import 'package:dhakad_tech/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/splash_screen/splash_screen.dart';

class Startapp extends StatelessWidget {
  const Startapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Dhakad Technosoft Project',
    );
  }
}
