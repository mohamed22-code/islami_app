import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_pres_helper.dart';

class MostRecentProvider extends ChangeNotifier{
  List<int> mostRecentList = [];
  //todo: read data => get most Recent List from Shared preference
  void readMostRecentList()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentListAsString = prefs.getStringList(SharedPrefsKey.mostRecently)??[];
    //todo: List<String> => List<int>
    mostRecentList = mostRecentListAsString.map((element) => int.parse(element),).toList();
    notifyListeners();
  }
}