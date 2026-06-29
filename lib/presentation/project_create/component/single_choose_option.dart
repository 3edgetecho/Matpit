import 'package:flutter/material.dart';

import '../../utils/constraints.dart';
import '../../widget/custom_test_style.dart';



class SingleChooseOption extends StatelessWidget {
  const SingleChooseOption({
    super.key,
    required this.onTap,
    required this.text,
    required this.subText,
    required this.icon,
    required this.iconBgColor,
    required this.isActive,
  });
  final VoidCallback onTap;
  final String icon;
  final String text;
  final String subText;
  final Color iconBgColor;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(

        width: size.width,

        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: borderRadius,
          border: Border.all(color: isActive ? primaryColor:Colors.white)
        ),
        child: Column(
          children: [
            Container(
              height: 60,

              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 0.0, top: 6.0),
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Image.network(
                 icon,
                height: size.height * 0.12,
                width: size.width * 0.12,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextStyle(
                  text: text,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
