import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/home/tabs/time/time_tab.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImage = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          backgroundImage[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),

        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
                print(selectedIndex);
              },
              items: [
                builtBottomNavItem(index: 0, iconName: AppAssets.iconQuran, label: 'Quran'),
                builtBottomNavItem(index: 1, iconName: AppAssets.iconHadith, label: 'Hadith'),
                builtBottomNavItem(index: 2, iconName: AppAssets.iconSebha, label: 'Sebha'),
                builtBottomNavItem(index: 3, iconName: AppAssets.iconRadio, label: 'Radio'),
                builtBottomNavItem(index: 4, iconName: AppAssets.iconTime, label: 'Time'),
              ],
            ),
          ),

          body: Column(
            crossAxisAlignment: .stretch,
            children: [
              // SizedBox(height: height*0.03,),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Image.asset(
                  AppAssets.logo,
                  height: height * 0.15,
                  width: width * 0.69,
                ),
              ),

              Expanded(child: tabs[selectedIndex]),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem builtBottomNavItem({
    required int index,
    required String iconName,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: builtBottomNavTap(index: index, iconName: iconName),
      label: label,
    );
  }

  Widget builtBottomNavTap({required int index, required String iconName}) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.blackBgColor,
            ),
            child: ImageIcon(AssetImage(iconName)),
          )
        : ImageIcon(AssetImage(iconName));
  }
}
