import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  final suraContent;
  int index;
   SuraContent({super.key, required this.suraContent, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width*0.06
      ),
        padding: EdgeInsets.symmetric(
          vertical: height*0.015
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: BoxBorder.all(
            color: AppColors.primaryColor,
            width: 1
          )
        ),
        child: Text("  $suraContent [${index+1}]",
textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: AppStyles.bold20primary,));
  }
}
