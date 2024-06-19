import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../core/local_data_storage/saved_item.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: build_ui(),
        ),
      ),
    );
  }

  Widget gridview_builder(){
    return GridView.builder(
      itemCount: LocalData.likedList.length,
      itemBuilder: (context, index) {
        String fName = LocalData.likedList[index]['first_name'];
        String lName = LocalData.likedList[index]['last_name'];
        String image = LocalData.likedList[index]['avatar'];
        String email = LocalData.likedList[index]['email'];

        return gridview_child(
          image: image,
          fName: fName,
          lName: lName,
          eMail: email,
          index: index,
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 10.0, // spacing between rows
        childAspectRatio: 1 / 1.3,
        crossAxisSpacing: 10.0, // spacing between columns
      ),
    );
  }

  Widget gridview_child({
    required image,
    required fName,
    required lName,
    required eMail,
    required index,
  }) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      AutoSizeText(
                        maxLines: 1,
                        '$fName $lName',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      AutoSizeText(
                        maxLines: 1,
                        '$eMail',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          color: Color.fromRGBO(108, 106, 106, 1),
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ).animate().scale(
        delay: 500.ms, curve: Curves.decelerate);
  }

  Widget no_data(){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/onboarding_page3.png').animate()
                    .fadeIn(duration: 2000.ms)
                    .slideY(duration: 1000.ms, curve: Curves.decelerate),
                const SizedBox(
                  height: 40,
                ),
                const AutoSizeText(
                  maxLines: 1,
                  '"Your favourite list is empty."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF2B2F33),
                    fontSize: 20.50,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    height: 0.13,
                  ),
                ).animate().fadeIn(duration: 1000.ms, delay: 500.ms),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Let\'s Add Items From Home Page To Display Items Here.',
                  style: TextStyle(
                    color: Color(0x7F2B2F33),
                    fontSize: 12.50,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                ).animate()
                    .fadeIn(duration: 1500.ms, delay: 500.ms).scaleY(
                    duration: 1000.ms, curve: Curves.decelerate
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget build_ui(){
    if(LocalData.likedList.length==0){
      return no_data();
    }else{
      return gridview_builder();
    }
  }
}
