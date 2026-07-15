import 'package:flutter/material.dart';
import 'package:islami_app/model/on_boarding_data.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_const.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/widget/dot_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          spacing: 20,
          children: [
            Row(),
            Container(
              constraints: BoxConstraints(maxHeight: height * 0.2),
              child: Image.asset(AppAssets.logo),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                itemCount: OnBoardingData.onBoardingList.length,
                itemBuilder: (context, index) {
                  var page = OnBoardingData.onBoardingList[index];
                  return Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(maxHeight: height * 0.4),
                        child: Image.asset(page.image),
                      ),
                      Text(page.title, style: AppStyles.bold24primary),
                      SizedBox(height: 20),
                      Text(
                        page.describtion ?? '',
                        style: AppStyles.bold20primary,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    currentIndex == 0
                        ? SizedBox()
                        : TextButton(
                            onPressed: () {
                              controller.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Text('Back', style: AppStyles.bold20primary),
                          ),

                    TextButton(
                      onPressed: () async {
                        if(currentIndex == OnBoardingData.onBoardingList.length-1){
                          await _onBoardingCheck();
                          Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
                        }
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text(
                        currentIndex == OnBoardingData.onBoardingList.length - 1
                            ? 'Done'
                            : 'Next',
                        style: AppStyles.bold20primary,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: .center,
                  children: List.generate(
                    OnBoardingData.onBoardingList.length,
                    (index) => DotIndicator(
                      isActive: currentIndex == index ? true : false,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _onBoardingCheck()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppConst.checkOnBoard, false);
  }
}
