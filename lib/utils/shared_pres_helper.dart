//todo: save data=> write data => save last sura index
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKey{
  static const String mostRecently = 'most_recent';
}
void saveLastSuraIndex(int newSuraIndex)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //todo: get list from shared prefs
  List<String> mostRecentList = prefs.getStringList(SharedPrefsKey.mostRecently)??[];
  //todo:duplicate
  if(mostRecentList.contains('$newSuraIndex')){
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0,'$newSuraIndex');
  }else{
    mostRecentList.insert(0,'$newSuraIndex');
  }
  if(mostRecentList.length > 5){
    mostRecentList.removeLast();
  }
  //todo: add new sura index
  //todo: save last sura index
  await prefs.setStringList(SharedPrefsKey.mostRecently, mostRecentList);
}
//todo: read data => get most Recent List from Shared preference
Future<List<int>> readMostRecentList()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentListAsString = prefs.getStringList(SharedPrefsKey.mostRecently)??[];
  //todo: List<String> => List<int>
  List<int> mostRecentListAsInt = mostRecentListAsString.map((element) => int.parse(element),).toList();
  return mostRecentListAsInt;
}