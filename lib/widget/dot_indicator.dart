import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isActive? AppColors.primaryColor: Colors.grey
      ),
    );
  }
}
