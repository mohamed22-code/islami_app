import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resource.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_details_screen/sura_content.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../../utils/app_colors.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${QuranResources.englishQuranSuraList[index]}',
          style: AppStyles.bold20primary,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.blackBgColor,
            child: Image.asset(
              AppAssets.detailsSura,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.04),
            child: Column(
              children: [
                Text(
                  QuranResources.arabicQuranSuraList[index],
                  style: AppStyles.bold24primary,
                ),
                Expanded(
                  child: verses.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : ListView.separated(
                    padding: EdgeInsets.only(
                      top: height*0.04
                    ),
                          itemBuilder: (context, index) {
                            return SuraContent(
                              suraContent: verses[index],
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: height * 0.02),
                          itemCount: verses.length,
                        ),
                ),
                SizedBox(height: height*0.1,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> suraList = fileContent.split('\n');
    for (int i = 0; i < suraList.length; i++) {
      print(suraList[i]);
      verses = suraList;
      setState(() {});
    }
  }
}
