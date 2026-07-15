import 'package:flutter/material.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/home/intro_screen.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth_details_screen/hadeth_details_screen.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_details_screen/sura_details_screen.dart';
import 'package:islami_app/utils/app_const.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
bool isFirstScreen = await _checkFirstScreen();
  runApp(ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp(isFirstScreen: isFirstScreen,)));
}
Future<bool> _checkFirstScreen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(AppConst.checkOnBoard) ?? true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstScreen});


  final bool isFirstScreen;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      initialRoute: isFirstScreen
          ? AppRoutes.IntroScreen
          : AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context)=> HomeScreen(),
        AppRoutes.hadethDetailsScreen: (context)=> HadethDetailsScreen(),
        AppRoutes.suraRouteName: (context)=> SuraDetailsScreen(),
        AppRoutes.IntroScreen: (context)=> IntroScreen(),
      },
    );
  }
}


