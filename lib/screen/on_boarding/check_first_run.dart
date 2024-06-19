import 'package:dhakad_tech/screen/on_boarding/page_view_config.dart';
import 'package:flutter/material.dart';

import '../../core/local_data_storage/isFirstRunConfig.dart';
import '../global_bottom_nav/GlobalBottomNav.dart';

class OnboardingOrMainScreen extends StatelessWidget {
  const OnboardingOrMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckFirstRun.setFirstRunBoolOnboardFalse();
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return waitingScreen();
          } else {
            if (snap.hasError) {
              return hasError();
            } else {
              bool isFirstRunVar = snap.data as bool;
              if (isFirstRunVar) {
                return const OnBoardingScreen();
              } else {
                return const BottomNavBar();
              }
            }
          }
        },
        future: CheckFirstRun.isFirstRunOnboard(),
      ),
    );
  }

  Widget waitingScreen() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget hasError() {
    return const Center(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error Occur',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins'),
              ),
              Text(
                'Some Error Occur Please Contact the developer at prashant.singh.12312345@gmail.com with screen shot of application',
                style: TextStyle(fontFamily: 'OpenSans'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
