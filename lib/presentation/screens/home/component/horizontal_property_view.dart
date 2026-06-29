import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:real_estate/data/data_provider/remote_url.dart';
import 'package:real_estate/data/model/home/home_data_model.dart';
import 'package:real_estate/data/model/home/project_response.dart';
import 'package:real_estate/presentation/utils/utils.dart';

import '../../../../data/model/home/home_property_model.dart';
import '../../../router/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/favorite_button.dart';
import 'headline_text.dart';

class HorizontalPropertyView extends StatelessWidget {
  const HorizontalPropertyView(
      {super.key,
      required this.featuredProperty,
      required this.onTap,
      this.headingText = 'Location by Property'});
  final String headingText;
  final  List<FeaturedProperties> featuredProperty;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeadlineText(
          text: headingText,
          onTap: onTap,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: IntrinsicHeight(
              child: Row(
                children: List.generate(
                  featuredProperty.length >5 ? 5:
                  featuredProperty.length,
                  (index) {
                    final element = featuredProperty[index];
                    print(RemoteUrls.propertyFeatureURL+ element.featuredImage!);
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 15.0 : 0.0,
                          right: index == 9 ? 0.0 : 0.0),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, RouteNames.propertyDetailsScreen,
                            arguments: element.id.toString()),
                        child: Container(
                          // height: 260.0.h,
                          width: 220.0.w,
                          margin: const EdgeInsets.only(right: 20.0),
                          padding: const EdgeInsets.all(10.0),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: borderRadius,
                                child: Stack(
                                  // fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:  RemoteUrls.propertyFeatureURL+ element.featuredImage!,
                                      height: 150.0,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) => SizedBox(
                                        height: 150.0,
                                        width: double.infinity,
                                        child: Center(
                                          child: LoadingAnimationWidget.inkDrop(
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Image.network(
                                        'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png',
                                        height: 150.0,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    ),

                                    Positioned(
                                      top: 10.0,
                                      right: 10.0,
                                      child:
                                          Row(
                                            children: [
                                              FavoriteButton(id: element.id.toString()),
                                              // Utils.horizontalSpace(10.0),
                                              // AddToCompare(id:element.id.toString()),
                                            ],
                                          ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextStyle(
                                    text: Utils.formatPrice(
                                        context, element.price),
                                    color: primaryColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.0,
                                  ),
                                  CustomTextStyle(
                                    text: (element.purpose??"").toUpperCase(),
                                    color: grayColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                    decoration: TextDecoration.underline,

                                  ),
                                ],
                              ),
                              SizedBox(height: 6,),
                              CustomTextStyle(
                                text: element.title!,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                                maxLine: 2,
                                height: 1.2,
                                fontSize: 15.0,
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: const CustomImage(path: KImages.locationIcon,height: 15,),
                                  ),
                                  Utils.horizontalSpace(6),
                                  Expanded(
                                    child: CustomTextStyle(
                                      text: element.address!,
                                      color: grayColor,
                                      fontWeight: FontWeight.w500,
                                      maxLine: 2,
                                      height: 1.2,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HorizontalPropertyView2 extends StatelessWidget {
  const HorizontalPropertyView2(
      {super.key,
      required this.featuredProperty,
      required this.onTap,
      this.headingText = 'Location by Property'});
  final String headingText;
  final  List<LocationProperties> featuredProperty;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineText(
          text: headingText,
          onTap: onTap,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  featuredProperty.length >5 ? 5:
                   featuredProperty.length,
                  (index) {
                    final element = featuredProperty[index];
                    print(RemoteUrls.propertyFeatureURL+ element.featuredImage!);
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 15.0 : 0.0,
                          right: index == 9 ? 0.0 : 0.0),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, RouteNames.propertyDetailsScreen,
                            arguments: element.id.toString()),
                        child: Container(
                          // height: 260.0.h,
                          width: 220.0.w,
                          margin: const EdgeInsets.only(right: 20.0),
                          padding: const EdgeInsets.all(10.0),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: borderRadius,
                                child: Stack(
                                  // fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:  RemoteUrls.propertyFeatureURL+ element.featuredImage!,
                                      height: 150.0,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) => SizedBox(
                                        height: 150.0,
                                        width: double.infinity,
                                        child: Center(
                                          child: LoadingAnimationWidget.inkDrop(
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Image.network(
                                        'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png',
                                        height: 150.0,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    ),

                                    Positioned(
                                      top: 10.0,
                                      right: 10.0,
                                      child:
                                          Row(
                                            children: [
                                              FavoriteButton(id: element.id.toString()),
                                              // Utils.horizontalSpace(10.0),
                                               //AddToCompare(id:element.purpose.toString()),
                                            ],
                                          ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextStyle(
                                    text: Utils.formatPrice(
                                        context, element.price),
                                    color: primaryColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.0,
                                  ),
                                  CustomTextStyle(
                                    text: (element.purpose??"").toUpperCase(),
                                    color: grayColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                    decoration: TextDecoration.underline,

                                  ),
                                ],
                              ),
                              SizedBox(height: 6,),
                              CustomTextStyle(
                                text: element.title ?? "",
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                                maxLine: 2,
                                height: 1.2,
                                fontSize: 15.0,
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: const CustomImage(path: KImages.locationIcon),
                                  ),
                                  Utils.horizontalSpace(6),
                                  Expanded(
                                    child: CustomTextStyle(
                                      text: element.address ?? "",
                                      color: grayColor,
                                      fontWeight: FontWeight.w500,
                                      maxLine: 2,
                                      height: 1.2,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class HorizontalPropertyView3 extends StatelessWidget {
  const HorizontalPropertyView3(
      {super.key,
        required this.featuredProperty,
        required this.onTap,
        this.headingText = 'Location by Property'});
  final String headingText;
  final  List<ProjectResponse> featuredProperty;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeadlineText(
          text: headingText,
          onTap: onTap,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: IntrinsicHeight(
              child: Row(
                children: List.generate(
                  featuredProperty.length >5 ? 5:
                  featuredProperty.length,
                      (index) {
                    final element = featuredProperty[index];
                    print(RemoteUrls.propertyFeatureURL+ element.featuredImage!);
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 15.0 : 0.0,
                          right: index == 9 ? 0.0 : 0.0),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, RouteNames.projectDetailsScreen,
                            arguments: element.id.toString()),
                        child: Container(
                          // height: 260.0.h,
                          width: 220.0.w,
                          margin: const EdgeInsets.only(right: 20.0),
                          padding: const EdgeInsets.all(10.0),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: borderRadius,
                                child: Stack(
                                  // fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:  RemoteUrls.projectFeatureURL+ element.featuredImage!,
                                      height: 150.0,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) => SizedBox(
                                        height: 150.0,
                                        width: double.infinity,
                                        child: Center(
                                          child: LoadingAnimationWidget.inkDrop(
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Image.network(
                                        'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png',
                                        height: 150.0,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    ),

                                    // Positioned(
                                    //   top: 10.0,
                                    //   right: 10.0,
                                    //   child:
                                    //   Row(
                                    //     children: [
                                    //       FavoriteButton(id: element.id.toString()),
                                    //       // Utils.horizontalSpace(10.0),
                                    //       // AddToCompare(id:element.id.toString()),
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          // CustomTextStyle(
                                          //   text: Utils.formatPrice(
                                          //       context, element.minPrice),
                                          //   color: primaryColor,
                                          //   fontWeight: FontWeight.w700,
                                          //   fontSize: 14.0,
                                          // ),
                                          // Text("-"),

                                          CustomTextStyle(
                                            text: Utils.formatPrice(
                                                context, element.maxPrice),
                                            color: primaryColor,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16.0,
                                          ),
                                          Text(" - "),

                                          CustomTextStyle(
                                            text: Utils.formatPrice(
                                                context, element.minPrice),
                                            color: primaryColor,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16.0,
                                          ),
                                        ],
                                      ),
                                      // CustomTextStyle(
                                      //   text: element.rentPeriod.isNotEmpty
                                      //       ? '/${element.rentPeriod}'
                                      //       : element.rentPeriod,
                                      //   color: grayColor,
                                      //   fontWeight: FontWeight.w400,
                                      //   fontSize: 14.0,
                                      // ),
                                    ],
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     const Padding(
                                  //       padding: EdgeInsets.only(
                                  //           right: 2.0, bottom: 2.0),
                                  //       child: Icon(
                                  //         Icons.visibility,
                                  //         color: primaryColor,
                                  //         size: 20.0,
                                  //       ),
                                  //     ),
                                  //     CustomTextStyle(
                                  //       text: element.views
                                  //           .toString()
                                  //           .padLeft(2, '0'),
                                  //       color: primaryColor,
                                  //       fontWeight: FontWeight.w700,
                                  //       fontSize: 14.0,
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 6.0),
                              CustomTextStyle(
                                text: element.title!,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                                maxLine: 2,
                                height: 1.2,
                                fontSize: 15.0,
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: const CustomImage(path: KImages.locationIcon),
                                  ),
                                  Utils.horizontalSpace(6),
                                  Expanded(
                                    child: CustomTextStyle(
                                      text: element.address!,
                                      color: grayColor,
                                      fontWeight: FontWeight.w500,
                                      maxLine: 2,
                                      height: 1.2,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}