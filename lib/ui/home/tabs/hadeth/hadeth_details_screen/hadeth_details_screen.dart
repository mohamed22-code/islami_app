import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth_details_screen/hadeth_content.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resource.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_details_screen/sura_content.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_colors.dart';

class HadethDetailsScreen extends StatefulWidget {
  HadethDetailsScreen({super.key});


  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  List<String> verses = [];
  late MostRecentProvider mostRecentProvider;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.readMostRecentList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    Hadeth hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Scaffold(
      appBar: AppBar(),
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
                  hadeth.title,
                  style: AppStyles.bold24primary,
                ),
                SizedBox(height: height*0.02,),
                Expanded(
                  child: SingleChildScrollView(
                    child: HadethContent(Content: hadeth.content)
                  )
                ),
                SizedBox(height: height*0.1,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
