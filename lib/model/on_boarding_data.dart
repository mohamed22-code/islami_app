import 'package:islami_app/utils/app_assets.dart';

class OnBoardingData {
  String image;
  String title;
  String? describtion;
  OnBoardingData({required this.image, required this.title, this.describtion});

  static List<OnBoardingData> onBoardingList = [
    OnBoardingData(image: AppAssets.page1, title: 'Welcome To Islami'),
    OnBoardingData(image: AppAssets.page2, title: 'Welcome To Islami',describtion: 'We Are Very Excited To Have You In Our Community'),
    OnBoardingData(image: AppAssets.page3, title: 'Reading the Quran',describtion: 'Read, and your Lord is the Most Generous'),
    OnBoardingData(image: AppAssets.page4, title: 'Bearish',describtion: 'Praise the name of your Lord, the Most High'),
    OnBoardingData(image: AppAssets.page5, title: 'Holy Quran Radio',describtion: 'You can listen to the Holy Quran Radio through the application for free and easily'),
  ];
}