import 'package:flutter/material.dart';
import 'package:real_estate/generated/assets.dart';

import '../../../../data/model/product/single_property_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class PropertyHorizontalView extends StatelessWidget {
  const PropertyHorizontalView({super.key, required this.property});
  final SinglePropertyModel property;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final item = property!;
    String calculation(dynamic val) => val.toString();
    final List<Map<String, String>> properties = [
      {
        "icon": Assets.areaIcon,
        "title": "Area",
        "size": calculation(item.property!.area!)
      },
      // {
      //   "icon": KImages.propertiesIcon02,
      //   "title": "Unit",
      //   "size": calculation(0),
      // },
      {
        "icon": Assets.bedIcon,
        "title": "Bedrooms",
        "size": calculation(item.property!.beds??"0")
      },
      {
        "icon": Assets.bathroomIcon,
        "title": "Bathroom",
        "size": calculation(item.property!.bath??"0")
      },
      // {
      //   "icon": KImages.propertiesIcon03,
      //   "title": "Garage",
      //   "size": calculation(0),
      // },
      {
        "icon": Assets.kitchenIcon,
        "title": "Kitchen",
        "size": calculation(1),
      },
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          properties.length,
          (index) => Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 15.0 : 0.0,
                right: index == properties.length - 1 ? 10.0 : 0.0),
            child: Container(
              height: size.height * 0.13,
              width: size.width * 0.34,
              // color: Colors.red,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(
                  color: const Color.fromRGBO(20, 0, 255, 0.06),
                ),
                borderRadius: borderRadius,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    margin: const EdgeInsets.only(bottom: 6.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor.withOpacity(0.1),
                    ),
                    child: CustomImage(
                      path: properties[index]['icon']!,
                      height: 20.0,
                      width: 20.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CustomTextStyle(
                    text: properties[index]['title']!,
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                  const SizedBox(height: 4.0),
                  CustomTextStyle(
                    text: properties[index]['size']!,
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
