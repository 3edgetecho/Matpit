import 'package:flutter/material.dart';
import 'package:real_estate/data/model/home/home_data_model.dart';

import '../../../../data/model/category/home_category_model.dart';
import '../../../router/route_names.dart';
import 'headline_text.dart';
import 'single_category_circle.dart';

class HorizontalCategoryView extends StatelessWidget {
  const HorizontalCategoryView({super.key, required this.category});
   final List<Categories> category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineText(
          text: 'All Category',
          onTap: () =>
              Navigator.pushNamed(context, RouteNames.allCategoryScreen),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
               category.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 10.0 : 0.0,
                    right: index == category!.length - 1
                        ? 10.0
                        : 0.0),
                child: GestureDetector(
                  onTap: () {
                    final type = category[index].name!
                        .replaceAll(' ', '-').replaceAll('/', '-')
                        .toLowerCase();
                    print(type);
                    Navigator.pushNamed(
                        context, RouteNames.filterPropertyScreen,
                        arguments: category[index].slug!);
                  },
                  child: SingleCategoryCircle(
                      category: category[index]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
