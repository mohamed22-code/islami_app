import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resource.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_item.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/shared_pres_helper.dart';
import 'package:islami_app/widget/most_recently_widget.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  // void addFilterList(){
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          TextField(
            onChanged: (value) {
              searchByNewText(value);
            },
            style: AppStyles.bold16white,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: builtTextField(),
              focusedBorder: builtTextField(),
              prefixIcon: Image.asset(AppAssets.iconSearch),
              hintText: 'SuraName',
              hintStyle: AppStyles.bold16white,
            ),
          ),
          SizedBox(height: height * 0.02),
          MostRecentlyWidget(),
          SizedBox(height: height * 0.02),
          Text('Sura List', style: AppStyles.bold16white),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo: save last sura index
                    saveLastSuraIndex(filterList[index]);
                    //todo: navigate to sura index screen
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraRouteName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(indent: width * .10, endIndent: width * .10),
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder builtTextField() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }

  void searchByNewText(String newText) {
    List<int> searchResultList = [];
    for (int i = 0; i < QuranResources.englishQuranSuraList.length; i++) {
      if (QuranResources.englishQuranSuraList[i].toLowerCase().contains(
        newText.toLowerCase(),
      )) {
        searchResultList.add(i);
      }
      if (QuranResources.arabicQuranSuraList[i].contains(newText)) {
        searchResultList.add(i);
      }
    }
    filterList = searchResultList;
    setState(() {});
  }
}
