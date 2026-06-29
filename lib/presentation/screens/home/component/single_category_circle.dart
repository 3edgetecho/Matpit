import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/data/data_provider/remote_url.dart';
import 'package:real_estate/data/model/home/home_data_model.dart';

import '../../../../data/model/product/property_type_model.dart';

import '../../../widget/custom_test_style.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_images.dart';

class SingleCategoryCircle extends StatelessWidget {
  const SingleCategoryCircle({super.key, required this.category});
  final Categories category;

  @override
  Widget build(BuildContext context) {
    print(RemoteUrls.propertyCategoryURL+category.image!);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50.0.h,
            width: 50.0.h,
            margin: const EdgeInsets.only(bottom: 6.0),
            decoration: BoxDecoration(
              border:
                  Border.all(color: primaryColor.withOpacity(0.5), width: 1),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(2, 2), // अंदर हल्का धंसा हुआ इफेक्ट
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(-2, -2), // लाइट सोर्स के हिसाब से इनर शैडो
                ),
              ],
            ),
            child: Container(
              height: 48.0.h,
              width: 48.0.h,
              alignment: Alignment.center,
              decoration:  BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(RemoteUrls.propertyCategoryURL+category.image!),fit: BoxFit.contain)
              ),
              /*child: Image.network(RemoteUrls.propertyCategoryURL+category.image!) *//*CustomImage(
                path: RemoteUrls.imageUrl(RemoteUrls.propertyCategoryURL+category.image!),
                height: 40,
              ),*/
            ),
          ),
          CustomTextStyle(
            text: category.name!,
            maxLine: 1,
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF7E8BA0),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 4,),
          CustomTextStyle(
            text: "(${category.propertiesCount!})",
            maxLine: 1,
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF7E8BA0),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
