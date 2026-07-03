import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resource.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
   SuraItem({super.key, required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.vector),
            Text('${index+1}' ,style: AppStyles.bold20white,)
          ],
        ),
        SizedBox(width: width* 0.06,),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(QuranResources.englishQuranSuraList[index],style: AppStyles.bold20white,),
            Text(QuranResources.versesNumberList[index],style: AppStyles.bold14white,),
          ],
        ),
        Spacer(),
            Text(QuranResources.arabicQuranSuraList[index],style: AppStyles.bold20white,),
      ],
    );
  }
}
