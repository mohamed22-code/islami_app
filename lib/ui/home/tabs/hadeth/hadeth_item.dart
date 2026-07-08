import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  final int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.hadethDetailsScreen,arguments: hadeth);
      },
      child: Container(
        padding: EdgeInsets.only(
          left: width * 0.02,
          right: width * 0.02,
          top: width * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor,
          image: DecorationImage(image: AssetImage(AppAssets.reading)),
        ),
        child: hadeth == null
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.leftCorner, width: width * 0.16),
                      Expanded(
                        child: Text(
                          hadeth?.title ?? '',
                          textAlign: .center,
                          style: AppStyles.bold24black,
                        ),
                      ),
                      Image.asset(AppAssets.rightCorner, width: width * 0.16),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeth?.content ?? '',
                        style: AppStyles.bold16black,
                      ),
                    ),
                  ),
                  Image.asset(AppAssets.hadethMosquo),
                ],
              ),
      ),
    );
  }

  void loadHadethFile() async {
    String fileContent = await rootBundle.loadString(
      'assets/files/hadith/h${widget.index}.txt',
    );
    int fileLinesIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    setState(() {});
    // List<String> hadethLines = fileContent.split('\n');
    // for(int i=0; i<hadethLines.length; i++){
    //   String title = hadethLines[0];
    //   hadethLines.removeAt(0);
    // }
  }
}
