import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:real_estate/data/model/search_response_model/search_response_model.dart';

import '../../../router/route_names.dart';
import '/data/data_provider/remote_url.dart';
import '/presentation/utils/utils.dart';
import '../../../../data/model/search_response_model/search_property_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/favorite_button.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key, required this.property});
  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    print(RemoteUrls.propertyFeatureURL+property.featuredImage!);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
            context, RouteNames.propertyDetailsScreen,
            arguments: property.id.toString());
      },

      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0).copyWith(right: 10.0),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: Stack(
                  // fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: RemoteUrls.propertyFeatureURL+property.featuredImage!,
                      height: double.infinity,
                      width: 140.0,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox(
                        height: double.infinity,
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
                        height: double.infinity,
                        width: 140.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 8.0,
                      left: 8.0,
                      child:Row(
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
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextStyle(
                          text: Utils.formatPrice(
                              context, property.price),
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
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
                    Flexible(
                      child: CustomTextStyle(
                        text: property.title!,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                        maxLine: 2,
                        height: 1.5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: CustomImage(path: KImages.locationIcon),
                        ),
                        const SizedBox(width: 6.0),
                        Flexible(
                          child: CustomTextStyle(
                            text: property.address!,
                            textAlign: TextAlign.left,
                            color: grayColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            maxLine: 2,
                            height: 1.6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SearchProjectComponent extends StatelessWidget {
  const SearchProjectComponent({super.key, required this.property});
  final ProjectModel property;

  @override
  Widget build(BuildContext context) {
    print(RemoteUrls.projectFeatureURL+property.featuredImage!);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
            context, RouteNames.projectDetailsScreen,
            arguments: property.id.toString());
      },

      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0).copyWith(right: 10.0),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: Stack(
                  // fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: RemoteUrls.projectFeatureURL+property.featuredImage!,
                      height: double.infinity,
                      width: 140.0,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox(
                        height: double.infinity,
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
                        height: double.infinity,
                        width: 140.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 8.0,
                      left: 8.0,
                      child:Row(
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
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextStyle(
                          text: Utils.formatPrice(
                              context, property.maxPrice),
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
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
                    Flexible(
                      child: CustomTextStyle(
                        text: property.title!,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                        maxLine: 2,
                        height: 1.5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: CustomImage(path: KImages.locationIcon),
                        ),
                        const SizedBox(width: 6.0),
                        Flexible(
                          child: CustomTextStyle(
                            text: property.address!,
                            textAlign: TextAlign.left,
                            color: grayColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            maxLine: 2,
                            height: 1.6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
