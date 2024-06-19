import 'package:shared_preferences/shared_preferences.dart';

import 'shared_pref_variable.dart';

class LocalData {
  static List<bool> like = [];
  static List<dynamic> data = [];
  static List<dynamic> likedList = [];

  // Method to save all lists to SharedPreferences
  static Future<void> saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert likedList to JSON String
    List<String> likedListStringList =
        LocalData.likedList.map((item) => item.toString()).toList();
    await prefs.setStringList(
        MySharedPrefVariable.likedListKey, likedListStringList);

    // Convert data to JSON String
    List<String> dataStringList =
        LocalData.data.map((item) => item.toString()).toList();
    await prefs.setStringList(MySharedPrefVariable.dataKey, dataStringList);

    // Convert like to JSON String
    List<String> likeStringList =
        LocalData.like.map((item) => item.toString()).toList();
    await prefs.setStringList(MySharedPrefVariable.likeBoolKey, likeStringList);
  }

  // Method to update all lists from SharedPreferences
  static Future<void> updateFromSharedPreferences() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load likedList from SharedPreferences
    List<String>? likedListStringList =
        await prefs.getStringList(MySharedPrefVariable.likedListKey);
    if (likedListStringList != null) {
      LocalData.likedList.clear();
      LocalData.likedList
          .addAll(likedListStringList.map((item) => item as dynamic));
    }

    // Load data from SharedPreferences
    List<String>? dataStringList =
        await prefs.getStringList(MySharedPrefVariable.dataKey);
    if (dataStringList != null) {
      LocalData.data.clear();
      LocalData.data.addAll(dataStringList.map((item) => item as dynamic));
    }

    // Load like from SharedPreferences
    List<String>? likeStringList =
        await prefs.getStringList(MySharedPrefVariable.likeBoolKey);
    if (likeStringList != null) {
      LocalData.like.clear();
      LocalData.like.addAll(likeStringList.map((item) => item == 'true'));
    }
    print(likedListStringList);
    print('\n\n');
    print(dataStringList);
    print('\n\n');
    print(likeStringList);
    print('\n\n');

  }
}
