import 'package:auto_size_text/auto_size_text.dart';
import 'package:dhakad_tech/core/api/ApiWork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../core/local_data_storage/saved_item.dart';
import '../core/local_data_storage/variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    if(makeApiCall) {
      try {
        var data = await DhakadApi.fetchData();
        setState(() {
          LocalData.data = data;
          if (LocalData.like.isEmpty) {
            LocalData.like = List.generate(data.length, (index) => false);
          }
        });
        LocalData.saveToSharedPreferences();
        makeApiCall=false;
      } catch (e) {
        throw Exception('Failed to load data: $e');
      }
    }
    // LocalData.updateFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LocalData.data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
            itemCount: LocalData.data.length,
            itemBuilder: (context, index) {
              String fName = LocalData.data[index]['first_name'];
              String lName = LocalData.data[index]['last_name'];
              String image = LocalData.data[index]['avatar'];
              String email = LocalData.data[index]['email'];
              int id = LocalData.data[index]['id'];
              return gridViewItem(
                image: image,
                fName: fName,
                lName: lName,
                eMail: email,
                id: id,
                index: index,
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 10.0, // spacing between rows
              childAspectRatio: 1 / 1.3,
              crossAxisSpacing: 10.0, // spacing between columns
            ),
          ),
        ),
      ),
    );
  }

  Widget gridViewItem({
    required image,
    required fName,
    required lName,
    required eMail,
    required id,
    required index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (LocalData.like[index]) {
            // If already liked, unlike it
            LocalData.likedList.removeWhere((item) => item['id'] == LocalData.data[index]['id']);
          } else {
            // If not liked, like it
            LocalData.likedList.add(LocalData.data[index]);
          }
          // Toggle the like status
          LocalData.like[index] = !LocalData.like[index];
        });
      },
      child: Card(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white10,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: LocalData.like[index]
                  ? Icon(
                MdiIcons.heart,
                color: const Color.fromRGBO(113, 43, 62, 1),
              )
                  : Icon(
                MdiIcons.heart,
                color: Colors.white,
              ),
            )
          ],
        ),
      ).animate()
          .scale(
          delay: 500.ms, curve: Curves.decelerate),
    );
  }
}
