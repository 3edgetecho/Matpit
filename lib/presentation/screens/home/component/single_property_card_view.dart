import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:real_estate/data/data_provider/remote_url.dart';
import 'package:real_estate/data/model/home/home_data_model.dart';
import 'package:real_estate/data/model/create_property/recommend_property_response.dart' as property2;
import 'package:real_estate/presentation/utils/utils.dart';

import '../../../../data/model/product/property_item_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/favorite_button.dart';

class SinglePropertyCardView extends StatelessWidget {
  const SinglePropertyCardView({super.key, required this.property});
  final LocationProperties property;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.0.h,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(right: 12.0),
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
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: Colors.white,
                          size: 50,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png', // Apni placeholder image ka path yahan dein
                        height: double.infinity,
                        width: 140,
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child:     Row(
                      children: [
                        FavoriteButton(id: property.id.toString()),
                        // Utils.horizontalSpace(10.0),
                        // AddToCompare(id:property.id.toString()),
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
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextStyle(
                      text: Utils.formatPrice(
                          context, property.price!),
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                    ),
                    // CustomTextStyle(
                    //   text: property.rentPeriod.isNotEmpty
                    //       ? '/${property.rentPeriod}'
                    //       : property.rentPeriod,
                    //   color: grayColor,
                    //   fontWeight: FontWeight.w400,
                    //   fontSize: 14.0,
                    // ),
                  ],
                ),
                const SizedBox(height: 3.0),
                Flexible(
                  child: CustomTextStyle(
                    text: property.title!,
                    color: blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    maxLine: 2,
                    height: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3.0),
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
                        height: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SinglePropertyCardView2 extends StatelessWidget {
  const SinglePropertyCardView2({super.key, required this.property});
  final property2.FeaturedProperties property;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.0.h,
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
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(right: 12.0),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl:   RemoteUrls.propertyFeatureURL+property.featuredImage!,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => SizedBox(
                      height: 140.0,
                      width: 140.0,
                      child: Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png',
                      height: 140.0,
                      width: 140.0,
                      fit: BoxFit.fill,
                    ),
                  ),


                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child:     Row(
                      children: [
                        FavoriteButton(id: property.id.toString()),
                        // Utils.horizontalSpace(10.0),
                        // AddToCompare(id:property.id.toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          CustomTextStyle(
                            text: Utils.formatPrice(
                                context, property.price??"0"),
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
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
                      const SizedBox(height: 3.0),
                      Flexible(
                        child: CustomTextStyle(
                          text: property.title??"",
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          maxLine: 2,
                          height: 1.2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: const CustomImage(path: KImages.locationIcon),
                          ),
                          const SizedBox(width: 6.0),
                          Flexible(
                            child: CustomTextStyle(
                              text: property.address??"",
                              color: grayColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              maxLine: 2,
                              height: 1.2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color:primaryColor
                          ),
                          child: Text(property!.type!.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 10),))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
