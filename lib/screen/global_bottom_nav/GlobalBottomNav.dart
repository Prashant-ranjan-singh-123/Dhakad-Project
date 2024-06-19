import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../home_page.dart';
import '../save_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: returnBody(_selectedIndex),

      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        showElevation: true,
        animationCurve: Curves.decelerate,
        animationDuration: const Duration(milliseconds: 400),
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: returnIcon(0),
            title: returnText(0),
          ),
          FlashyTabBarItem(
            icon: returnIcon(1),
            title: returnText(1),
          ),
        ],
      ).animate()
          .fadeIn(duration: 1000.ms)
          .slideY(duration: 1000.ms, curve: Curves.decelerate, begin: 0.5),
    );
  }

  Widget returnIcon(int index){
    if(index==0){
      return Icon(MdiIcons.home, size: 25, color: Colors.black26,);
    }else{
      return Icon(MdiIcons.heart, size: 25, color: Colors.black26,);
    }
  }


  Widget returnText(int index){
    if(index==0){
      return const Text('Home', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontFamily: 'Poppins', fontSize: 20),);
    }else{
      return const Text('Favourite', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontFamily: 'Poppins', fontSize: 20),);
    }
  }

  Widget returnBody(int index){
    if(index==0){
      return HomePage();
    }else{
      return SavedPage();
    }
  }
}
