import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class HadethContent extends StatelessWidget {
  final Content;
   HadethContent({super.key, required this.Content});

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
        child: Text(Content,
textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: AppStyles.bold20primary,));
  }
}
