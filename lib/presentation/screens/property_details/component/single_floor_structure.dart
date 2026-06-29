import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:real_estate/data/model/product/project_response.dart';

import '../../../../data/data_provider/remote_url.dart';
import '../../../../data/model/product/property_plan_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class SingleFloorStructure extends StatelessWidget {
  const SingleFloorStructure(
      {super.key, required this.plan, this.isExpand = false});
  final bool isExpand;
  final PropertyPlan plan;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFE3E3E3);
    return Container(
      width: double.infinity,
      // alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isExpand,
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
                  .copyWith(top: 0.0),
          iconColor: grayColor,
          collapsedIconColor: grayColor,
          title: CustomTextStyle(
              text: plan.title,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: blackColor),
          children: [
            CustomImage(path: RemoteUrls.imageUrl(plan.image)),
            const SizedBox(height: 10.0),
            ReadMoreText(
              plan.description,
              trimLines: 4,
              trimCollapsedText: 'Read More',
              trimExpandedText: 'Show Less',
              trimLength: 180,
              moreStyle: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: primaryColor),
              lessStyle: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: primaryColor),
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                  color: grayColor),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleFloorStructure2 extends StatelessWidget {
  const SingleFloorStructure2(
      {super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFE3E3E3);
    return Container(
      width: double.infinity,
      // alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
                  .copyWith(top: 0.0),
          iconColor: grayColor,
          collapsedIconColor: grayColor,
          title: CustomTextStyle(
              text: title,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: blackColor),
          children: [
            Image.network(image,loadingBuilder: (BuildContext context, Widget child,
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

                  fit: BoxFit.fill,
                );
              },),
            const SizedBox(height: 10.0),

          ],
        ),
      ),
    );
  }
}



class ProjectTypeView extends StatelessWidget {
  const ProjectTypeView(
      {super.key,  required this.title});


  final ProjectTypeContents title;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFE3E3E3);
    return Container(
      width: double.infinity,
      // alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: false,
          childrenPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              .copyWith(top: 0.0),
          iconColor: grayColor,
          collapsedIconColor: grayColor,
          title: CustomTextStyle(
              text: title.name!,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: blackColor),
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Area",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.6)),),
                Text("${title.minArea!} - ${title.maxArea} Sqft",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(1),fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.6)),),
                Text("${Utils.formatPrice(context, title!.maxPrice!)} - ${Utils.formatPrice(context, title!.minPrice!)}",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(1),fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Unit",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(0.6)),),
                Text("${title.unit}",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(1),fontWeight: FontWeight.bold),),
              ],
            )



          ],
        ),
      ),
    );
  }
}
