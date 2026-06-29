import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/data/model/filter/filter_property_list_model.dart';

import '../../../../data/data_provider/remote_url.dart';
import '../../../../data/model/search_response_model/search_property_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/favorite_button.dart';

class SingleFilterProperties extends StatelessWidget {
  const SingleFilterProperties({super.key, required this.property});
  final Data property;

  @override
  Widget build(BuildContext context) {
    print(RemoteUrls.propertyFeatureURL+property.featuredImage!,);
    return Container(
      height: 145.0.h,
      // width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(radius),
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
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0).copyWith(right: 16.0),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  Image.network(
                     RemoteUrls.propertyFeatureURL+property.featuredImage!,
                    height: double.infinity,
                    width: 140.0,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child:Row(
                      children: [
                        FavoriteButton(id: property.id.toString()),
                        Utils.horizontalSpace(10.0),
                      //  AddToCompare(id:property.id.toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextStyle(
                      text: Utils.formatPrice(
                          context, property.price!),
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                    CustomTextStyle(
                      text: (property.purpose??"").toUpperCase(),
                      color: grayColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      decoration: TextDecoration.underline,

                    ),
                  ],
                ),
                Flexible(
                  child: CustomTextStyle(
                    text: property.title!,
                    color: blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    maxLine: 2,
                    height: 1.6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomImage(path: KImages.locationIcon),
                    const SizedBox(width: 6.0),
                    Flexible(
                      child: CustomTextStyle(
                        text: property.address!,
                        color: grayColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        maxLine: 2,
                        height: 1.5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SingleFilterProject extends StatelessWidget {
  const SingleFilterProject({super.key, required this.property});
  final Projects property;

  @override
  Widget build(BuildContext context) {
    print(RemoteUrls.propertyFeatureURL+property.featuredImage!,);
    return Container(
      height: 145.0.h,
      // width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(radius),
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
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0).copyWith(right: 16.0),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  Image.network(
                     RemoteUrls.projectFeatureURL+property.featuredImage!,
                    height: double.infinity,
                    width: 140.0,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child:Row(
                      children: [
                        FavoriteButton(id: property.id.toString()),
                        Utils.horizontalSpace(10.0),
                      //  AddToCompare(id:property.id.toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextStyle(
                      text: Utils.formatPrice(
                          context, property.maxPrice??''),
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                    // CustomTextStyle(
                    //   text: (property.purpose??"").toUpperCase(),
                    //   color: grayColor,
                    //   fontWeight: FontWeight.w600,
                    //   fontSize: 14.0,
                    //   decoration: TextDecoration.underline,
                    //
                    // ),
                  ],
                ),
                Flexible(
                  child: CustomTextStyle(
                    text: property.title!,
                    color: blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    maxLine: 2,
                    height: 1.6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomImage(path: KImages.locationIcon),
                    const SizedBox(width: 6.0),
                    Flexible(
                      child: CustomTextStyle(
                        text: property.address!,
                        color: grayColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        maxLine: 2,
                        height: 1.5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
