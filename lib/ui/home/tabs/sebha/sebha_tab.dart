import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter =1;
  double angle = 10;
  int index=0;
  List<String> azkar = [
   'سبحان الله',
    'الحمد لله',
    'الله اكبر',
  ];
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          top: -height*0.05,
                          child: Image.asset(AppAssets.sebhaHead,width: width*0.4,
                          height: height*0.15,
                          )),
                      Transform.rotate(
                          angle: angle,
                          child: Image.asset(AppAssets.sebhaBody,width: width, height: height*0.6, fit: BoxFit.contain,)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _onClick(),
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Text(azkar[index], style: AppStyles.bold20white,),
                        Text(counter.toString(), style: AppStyles.bold20white,),
                      ],
                    ),
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
  void _onClick(){
    setState(() {
      angle-=10;
      counter++;
      if(counter == 33){
        counter=0;
        if(index == azkar.length-1){
          index=0;
        }else{
          index++;
        }
      }
    });
  }
}
