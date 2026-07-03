import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resource.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_item.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
          Text('Most Recently', style: AppStyles.bold16white),
          SizedBox(height: height*0.02,),
          SizedBox(
            height: height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width*0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .start,
                        children: [
                          Text('Al-Anbiya',style: AppStyles.bold24black,),
                          Text('الانبياء',style: AppStyles.bold24black,),
                          Text('112 verse',style: AppStyles.bold14black,),
                        ],
                      ),
                      Image.asset(AppAssets.reading,color: Colors.black,)
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: width*0.02,),
              itemCount: 10,
            ),
          ),
          SizedBox(height: height * 0.02),
          Text('Sura List', style: AppStyles.bold16white),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.suraRouteName,arguments: index);
                  },
                  child: SuraItem(index: index,));
            },
                separatorBuilder: (context, index) => Divider(
                  indent: width*.10,
                  endIndent: width*.10,
                ),
                itemCount: QuranResources.versesNumberList.length),
          )
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
}
