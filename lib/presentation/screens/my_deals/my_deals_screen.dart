import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../../data/data_provider/remote_url.dart';
import '../../../logic/cubit/home/cubit/home_cubit.dart';
import '../../router/route_names.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widget/custom_images.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/fetch_text_error.dart';
import '../../widget/loading_widget.dart';
import '../../widget/page_refresh.dart';
import '../home/component/single_property_card_view.dart';

class MyDealsScreen extends StatefulWidget {
  const MyDealsScreen({super.key});

  @override
  State<StatefulWidget> createState() =>_MyDealScreen();


}

class _MyDealScreen extends State<MyDealsScreen> {

  int selectIndex = 1;



  Future<void> _makePhoneCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Cannot launch phone');
    }
  }

  Future<void> _sendEmail(String email) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Cannot launch email');
    }
  }
  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getEnquiryData();
    final homeCubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Enquiry',
        showButton: false,
        bgColor: Colors.white,
      ),
      body: PageRefresh(
        onRefresh: () async {

          homeCubit.getEnquiryData();

        },
        child: Column(
          children: [
            Container(
              height: 50,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: primaryColor),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            selectIndex = 1;
                          });
                        },
                        child: Container(

                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 0),
                          padding: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: selectIndex == 1
                                ? LinearGradient(
                              colors: [
                                primaryColor,
                                blackColor
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                                : null,
                            color: selectIndex != 1 ? Colors.transparent : null,
                          ),
                          child: Text(
                            "Property",
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                              color: selectIndex == 1 ? Colors.white : Colors.black,

                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )

                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            selectIndex = 0;
                          });
                        },
                        child: Container(

                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 0),
                          padding: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: selectIndex == 0
                                ? LinearGradient(
                              colors: [
                                primaryColor,
                                blackColor
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                                : null,
                            color: selectIndex != 0 ? Colors.transparent : null,
                          ),
                          child: Text(
                            "Project",
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                              color: selectIndex == 0 ? Colors.white : Colors.black,

                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )

                    ),
                  ),

                ],
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const LoadingWidget();
                }
                if (homeCubit.myEnquiryResponse != null) {
                  return selectIndex == 0 ?
                  ListView.builder(
                      itemCount: homeCubit.myEnquiryResponse!.project!.length,
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final result = homeCubit.myEnquiryResponse!.project![index];
                        return GestureDetector(
                          onTap: () {

                            Navigator.pushNamed(
                                context, RouteNames.projectDetailsScreen,
                                arguments: result.projectId.toString());

                          },
                          child: Container(
                            //height: 200.0.h,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 140.0.h,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: borderRadius,
                                          child: Stack(
                                            // fit: StackFit.expand,
                                            children: [
                                              Image.network(

                                                RemoteUrls.projectFeatureURL+result.image!,
                                                height: 140.0,
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
                                                    height: 140,
                                                    width: 140,
                                                    fit: BoxFit.fill,
                                                  );
                                                },
                                              ),
                                              // Positioned(
                                              //   top: 8.0,
                                              //   left: 8.0,
                                              //   child: FavoriteButton(
                                              //       id: result.id.toString()),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 10.0,top: 10,bottom: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                mainAxisSize: MainAxisSize.min,
                                                children: [

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [


                                                      CustomTextStyle(
                                                        text: Utils.formatPrice(
                                                            context, result.maxPrice!),
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
                                                      text: result.title!,
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
                                                          text: result.address!,
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  result.phone!=null && result.phone!.isNotEmpty ?
                                                  GestureDetector(
                                                    onTap: () => _makePhoneCall(result.phone??''),
                                                    child: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor: Colors.green,
                                                      child: Icon(Icons.call, color: Colors.white,size: 15,),
                                                    ),
                                                  ):SizedBox(),
                                                  const SizedBox(width: 8),
                                                  // 📧 Email Button
                                                  result.email!=null && result.email!.isNotEmpty ?   GestureDetector(
                                                    onTap: () => _sendEmail(result.email??""),
                                                    child: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor: Colors.blue,
                                                      child: Icon(Icons.email, color: Colors.white,size: 15,),
                                                    ),
                                                  ):SizedBox(),
                                                  // ConstrainedBox(
                                                  //   constraints: const BoxConstraints(
                                                  //       maxHeight: 40.0, maxWidth: 190.0),
                                                  //   child: CustomTextStyle(
                                                  //     text: result.address,
                                                  //     color: grayColor,
                                                  //     fontWeight: FontWeight.w400,
                                                  //     fontSize: 12.0,
                                                  //     maxLine: 2,
                                                  //     overflow: TextOverflow.ellipsis,
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      }):ListView.builder(
                      itemCount: homeCubit.myEnquiryResponse!.property!.length,
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final result = homeCubit.myEnquiryResponse!.property![index];
                        return GestureDetector(
                          onTap: () {

                            Navigator.pushNamed(
                                context, RouteNames.propertyDetailsScreen,
                                arguments: result.propertyId.toString());

                          },
                          child: Container(
                            //height: 200.0.h,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 140.0.h,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: borderRadius,
                                          child: Stack(
                                            // fit: StackFit.expand,
                                            children: [
                                              Image.network(

                                                RemoteUrls.propertyFeatureURL+(result!=null ? result!.image!:""),
                                                height: 140.0,
                                                width: 140.0,
                                                fit: BoxFit.cover,
                                                loadingBuilder: (BuildContext context, Widget child,
                                                    ImageChunkEvent? loadingProgress) {
                                                  if (loadingProgress == null) return child;
                                                  return Center(
                                                    child: CircularProgressIndicator(
                                                      value: loadingProgress.expectedTotalBytes != null
                                                          ? loadingProgress.cumulativeBytesLoaded /
                                                          loadingProgress.expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
                                                },
                                                errorBuilder: (context, error, stackTrace) {
                                                  return Image.network(
                                                    'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png', // Apni placeholder image ka path yahan dein
                                                    height: 140,
                                                    width: 140,
                                                    fit: BoxFit.fill,
                                                  );
                                                },
                                              ),
                                              // Positioned(
                                              //   top: 8.0,
                                              //   left: 8.0,
                                              //   child: FavoriteButton(
                                              //       id: result.id.toString()),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 10.0,top: 10,bottom: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                mainAxisSize: MainAxisSize.min,
                                                children: [

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [


                                                      CustomTextStyle(
                                                        text: Utils.formatPrice(
                                                            context, result.price!),
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
                                                      text: result.title!,
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
                                                          text: result.address!,
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  result.phone!=null && result.phone!.isNotEmpty ?
                                                  GestureDetector(
                                                    onTap: () => _makePhoneCall(result.phone??''),
                                                    child: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor: Colors.green,
                                                      child: Icon(Icons.call, color: Colors.white,size: 15,),
                                                    ),
                                                  ):SizedBox(),
                                                  const SizedBox(width: 8),
                                                  // 📧 Email Button
                                                  result.email!=null && result.email!.isNotEmpty ?   GestureDetector(
                                                    onTap: () => _sendEmail(result.email??""),
                                                    child: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor: Colors.blue,
                                                      child: Icon(Icons.email, color: Colors.white,size: 15,),
                                                    ),
                                                  ):SizedBox(),
                                                  // ConstrainedBox(
                                                  //   constraints: const BoxConstraints(
                                                  //       maxHeight: 40.0, maxWidth: 190.0),
                                                  //   child: CustomTextStyle(
                                                  //     text: result.address,
                                                  //     color: grayColor,
                                                  //     fontWeight: FontWeight.w400,
                                                  //     fontSize: 12.0,
                                                  //     maxLine: 2,
                                                  //     overflow: TextOverflow.ellipsis,
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return const FetchErrorText(text: 'No Data Found');
                }

              },

            ),
          ],
        ),
      ),
    );
  }
}
