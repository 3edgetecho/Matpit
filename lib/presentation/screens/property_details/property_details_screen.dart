import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:real_estate/data/model/product/project_response.dart' as project;
import 'package:real_estate/logic/cubit/booking/booking_cubit.dart';
import 'package:real_estate/presentation/widget/fetch_text_error.dart';

import '../../../data/data_provider/remote_url.dart';
import '../../router/route_names.dart';
import '../../widget/favorite_button.dart';
import '/presentation/utils/utils.dart';
import '/presentation/widget/loading_widget.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../data/model/product/single_property_model.dart';
import '../../../logic/cubit/home/cubit/property_details_cubit.dart';
import '../../widget/page_refresh.dart';
import 'component/property_details_nav_bar.dart';
import 'component/property_details_view.dart';
import 'component/property_horizontal_view.dart';
import 'component/property_images_slider.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({super.key, required this.slug});

  final String slug;

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  @override
  void initState() {
    print('init');
    context.read<PropertyDetailsCubit>().fetchPropertyDetails(widget.slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailsCubit = context.read<PropertyDetailsCubit>();
    //detailsCubit.fetchPropertyDetails(widget.slug);
    //final size = MediaQuery.of(context).size;
    if (detailsCubit.singleProperty == null) {
      // print('NULLLLLLLLLL');
      detailsCubit.fetchPropertyDetails(widget.slug);
    } else {
      // print('NOT NULLLLL');
    }
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: PageRefresh(
        onRefresh: () async => detailsCubit.fetchPropertyDetails(widget.slug),
        child: BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
          builder: (context, state) {
            if (state is PropertyDetailsLoading) {
              return const LoadingWidget();
            }
            if (state is PropertyDetailsError) {
              if ( detailsCubit.singleProperty != null) {
                return LoadedProperDetails(
                    property: detailsCubit.singleProperty!);
              } else {
                return FetchErrorText(text: state.error);
              }
            }
            if (state is PropertyDetailsLoaded) {
              context.read<BookingCubit>().changePropertyId(
                  state.singlePropertyModel!.property!.id.toString());
              return LoadedProperDetails(property: state.singlePropertyModel);
            }
            return const SizedBox();
          },
        ),
      ),
      bottomNavigationBar: const PropertyDetailNavBar(),
    );
  }
}

class LoadedProperDetails extends StatelessWidget {
  const LoadedProperDetails({super.key, required this.property});

  final SinglePropertyModel property;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeCubit = context.read<PropertyDetailsCubit>();
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.11,
          width: size.width,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(30.0),
                  // bottomRight: Radius.circular(30.0),
                ),
                child: CustomImage(
                  path: KImages.profileBackground,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const CircleAvatar(
                          backgroundColor: whiteColor,
                          minRadius: 16.0,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: grayColor,
                              size: 22.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),

                    /// ✅ Use `Expanded` instead of fixed width
                    Expanded(
                      flex: 8,
                      child: CustomTextStyle(
                        text: property!.property!.title!,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),



            ],
          ),
        ),
        Expanded(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            children: [
              PropertyImagesSlider(property: property),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: size.height * 0.06)
                    .copyWith(bottom: size.height * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomTextStyle(
                    //   text: property!.property!.title!,
                    //   color: blackColor,
                    //   fontWeight: FontWeight.w700,
                    //   height: 1.2,
                    //   maxLine: 2,
                    //   overflow: TextOverflow.ellipsis,
                    //   fontSize: 18.0,
                    // ),
                    // const SizedBox(height: 10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: const CustomImage(path: KImages.locationIcon),
                        ),
                        Utils.horizontalSpace(8.0),
                        Flexible(
                          child: CustomTextStyle(
                            text: property!.property!.address!,
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            maxLine: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),



              PropertyHorizontalView(property: property),
              const PropertyTextTabView(),
              property!.vendor!=null ?  Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 14.0)
                  ,
                  // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0).copyWith(top: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.network(
                          RemoteUrls.vendorImagePhotoURL+(property!.vendor!.photo??""),
                          height: size.height * 0.08,
                          width: size.height * 0.08,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png', // Apni placeholder image ka path yahan dein
                              height: size.height * 0.08,
                              width: size.height * 0.08,
                              fit: BoxFit.fill,

                            );
                          },

                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: CustomTextStyle(
                                    text: property!.vendor!.vendorInfo!.name!,
                                    fontSize: 20.0,
                                    maxLine: 1,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                  ),
                                ),
                                Utils.horizontalSpace(
                                    property!.vendor!.status == 1 ? 4.0 : 0),
                                if (property!.vendor!.status == 1) ...[
                                  const Icon(
                                    Icons.verified_rounded,
                                    color: Color(0xFF01BF8B),
                                    size: 18.0,
                                  )
                                ],
                              ],
                            ),
                            CustomTextStyle(
                              text: property!.vendor!.vendorInfo!.city!,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ):
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 14.0)
                  ,
                  // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0).copyWith(top: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.network(
                          RemoteUrls.adminImageURl+(property!.admin!.image??""),
                          height: size.height * 0.08,
                          width: size.height * 0.08,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png', // Apni placeholder image ka path yahan dein
                              height: size.height * 0.08,
                              width: size.height * 0.08,
                              fit: BoxFit.fill,
                            );
                          },

                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: CustomTextStyle(
                                    text: property!.admin!.firstName!,
                                    fontSize: 20.0,
                                    maxLine: 1,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                  ),
                                ),
                                Utils.horizontalSpace(
                                    property!.admin!.status == 1 ? 4.0 : 0),
                                if (property!.admin!.status == 1) ...[
                                  const Icon(
                                    Icons.verified_rounded,
                                    color: Color(0xFF01BF8B),
                                    size: 18.0,
                                  )
                                ],
                              ],
                            ),
                            CustomTextStyle(
                              text: property!.admin!.address!,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Utils.verticalSpace(20),
              BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
                  builder: (context, state) {

                    if(homeCubit.singleProperty!.relatedProperties!=null){
                      List<RelatedProperties>? recommendPropertyResponse = homeCubit.singleProperty!.relatedProperties!;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  Utils.symmetric(h: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextStyle(text: "Similar Properties",fontSize: 18.0,fontWeight: FontWeight.w700,),

                              ],
                            ),
                          ),
                          Utils.verticalSpace(6.0),
                          ...List.generate( recommendPropertyResponse!=null ? recommendPropertyResponse!.length>10 ? 10: recommendPropertyResponse!.length:0, (index){
                            final item =  recommendPropertyResponse![index];
                            return Padding(
                              padding: Utils.symmetric(h: 16.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                      onTap: () => Navigator.pushReplacementNamed(
                                        context,
                                        RouteNames.propertyDetailsScreen,
                                        arguments: item.id.toString(),
                                      ),
                                      child: RelatedPropertyCardView2(property: item))
                                ],),
                            );
                          })

                        ],
                      );
                    }
                    else
                    {
                      return const FetchErrorText(text: 'Something went wrong!');
                    }
                  }),
              const SizedBox(height: 0),
            ],
          ),
        ),
      ],
    );
  }
}


class RelatedPropertyCardView2 extends StatelessWidget {
  const RelatedPropertyCardView2({super.key, required this.property});
  final RelatedProperties property;

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
                      const SizedBox(height: 6.0),
                      Flexible(
                        child: CustomTextStyle(
                          text: property.title!,
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
                              text: property.address!,
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


class RelatedProjectCardView2 extends StatelessWidget {
  const RelatedProjectCardView2({super.key, required this.property});
  final project.RelatedProjects property;

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
                    imageUrl:   RemoteUrls.projectFeatureURL+property.featuredImage!,
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

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          CustomTextStyle(
                            text: Utils.formatPrice(
                                context, property.maxPrice??"0"),
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                          ),
                          CustomTextStyle(
                            text: Utils.formatPrice(
                                context, property.minPrice??"0"),
                            color: grayColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Flexible(
                        child: CustomTextStyle(
                          text: property.title!,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          maxLine: 2,
                          height: 1.2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 6.0),
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
                              text: property.address!,
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(2),
                  //             color:primaryColor
                  //         ),
                  //         child: Text(property!.type!.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 10),))
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class ProjectDetailScreen extends StatefulWidget {
   ProjectDetailScreen({super.key, required this.slug});

   String slug;

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  void initState() {
    print('init');

    context.read<PropertyDetailsCubit>().fetchProjectDetails(widget.slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailsCubit = context.read<PropertyDetailsCubit>();
    //detailsCubit.fetchPropertyDetails(widget.slug);
    //final size = MediaQuery.of(context).size;
    if (detailsCubit.singleProject == null) {
      // print('NULLLLLLLLLL');
      detailsCubit.fetchProjectDetails(widget.slug);
    } else {
      // print('NOT NULLLLL');
    }
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: PageRefresh(
        onRefresh: () async => detailsCubit.fetchProjectDetails(widget.slug),
        child: BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
          builder: (context, state) {
            if (state is PropertyDetailsLoading) {
              return const LoadingWidget();
            }
            if (state is PropertyDetailsError) {
              if ( detailsCubit.singleProject != null) {
                return LoadedProjectDetails(
                    property: detailsCubit.singleProject!);
              } else {
                return FetchErrorText(text: state.error);
              }
            }
            if (state is ProjectDetailsLoaded) {
              context.read<BookingCubit>().changePropertyId(
                  state.projectResponse!.data!.project!.id.toString());
              return LoadedProjectDetails(property: state.projectResponse);
            }
            return const SizedBox();
          },
        ),
      ),
      bottomNavigationBar: const ProjectDetailNavBar(),
    );
  }
}

class LoadedProjectDetails extends StatelessWidget {
  const LoadedProjectDetails({super.key, required this.property});

  final project.ProjectResponse property;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeCubit = context.read<PropertyDetailsCubit>();
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.11,
          width: size.width,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(30.0),
                  // bottomRight: Radius.circular(30.0),
                ),
                child: CustomImage(
                  path: KImages.profileBackground,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const CircleAvatar(
                          backgroundColor: whiteColor,
                          minRadius: 16.0,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: grayColor,
                              size: 22.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),

                    /// ✅ Use `Expanded` instead of fixed width
                    Expanded(
                      flex: 8,
                      child: CustomTextStyle(
                        text: property!.data!.project!.title!,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),



            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            children: [
              ProjectImagesSlider(property: property),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: size.height * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomTextStyle(
                    //   text: property!.data!.project!.title!,
                    //   color: blackColor,
                    //   fontWeight: FontWeight.w700,
                    //   height: 1.2,
                    //   maxLine: 2,
                    //   overflow: TextOverflow.ellipsis,
                    //   fontSize: 18.0,
                    // ),
                    // const SizedBox(height: 10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: const CustomImage(path: KImages.locationIcon),
                        ),
                        Utils.horizontalSpace(8.0),
                        Flexible(
                          child: CustomTextStyle(
                            text: property!.data!.project!.address!,
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            maxLine: 2,
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
              ),
             // PropertyHorizontalView(property: property),
              const ProjectTextTabView(),
              property!.data!.vendor!=null ?  Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 14.0)
                  ,
                  // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0).copyWith(top: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.network(
                          RemoteUrls.vendorImagePhotoURL+(property!.data!.vendor!.photo??""),
                          height: size.height * 0.08,
                          width: size.height * 0.08,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png', // Apni placeholder image ka path yahan dein
                              height: size.height * 0.08,
                              width: size.height * 0.08,
                              fit: BoxFit.fill,
                            );
                          },

                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: CustomTextStyle(
                                    text: property!.data!.vendor!.vendorInfo!.name!,
                                    fontSize: 20.0,
                                    maxLine: 1,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                  ),
                                ),
                                Utils.horizontalSpace(
                                    property!.data!.vendor!.status == 1 ? 4.0 : 0),
                                if (property!.data!.vendor!.status == 1) ...[
                                  const Icon(
                                    Icons.verified_rounded,
                                    color: Color(0xFF01BF8B),
                                    size: 18.0,
                                  )
                                ],
                              ],
                            ),
                            CustomTextStyle(
                              text: property!.data!.vendor!.vendorInfo!.city!,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ):
              Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 14.0)
                  ,
                  // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0).copyWith(top: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.network(
                          RemoteUrls.adminImageURl+(property!.data!.admin!.image??""),
                          height: size.height * 0.08,
                          width: size.height * 0.08,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png', // Apni placeholder image ka path yahan dein
                              height: size.height * 0.08,
                              width: size.height * 0.08,
                              fit: BoxFit.fill,
                            );
                          },

                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: CustomTextStyle(
                                    text: property!.data!.admin!.firstName!,
                                    fontSize: 20.0,
                                    maxLine: 1,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                  ),
                                ),
                                Utils.horizontalSpace(
                                    property!.data!.admin!.status == 1 ? 4.0 : 0),
                                if (property!.data!.admin!.status == 1) ...[
                                  const Icon(
                                    Icons.verified_rounded,
                                    color: Color(0xFF01BF8B),
                                    size: 18.0,
                                  )
                                ],
                              ],
                            ),
                            CustomTextStyle(
                              text: property!.data!.admin!.address!,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 0),

              Utils.verticalSpace(20),
              BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
                  builder: (context, state) {

                    if(homeCubit.singleProject!.data!.relatedProjects!=null){
                      List<project.RelatedProjects>? recommendPropertyResponse = homeCubit.singleProject!.data!.relatedProjects!;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  Utils.symmetric(h: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextStyle(text: "Similar Projects",fontSize: 18.0,fontWeight: FontWeight.w700,),

                              ],
                            ),
                          ),
                          Utils.verticalSpace(6.0),
                          ...List.generate( recommendPropertyResponse!=null ? recommendPropertyResponse!.length>10 ? 10: recommendPropertyResponse!.length:0, (index){
                            final item =  recommendPropertyResponse![index];
                            return Padding(
                              padding: Utils.symmetric(h: 16.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                      onTap: () => Navigator.pushReplacementNamed(
                              context,
                              RouteNames.projectDetailsScreen,
                              arguments: item.id.toString(),
                            ),
                                      child: RelatedProjectCardView2(property: item))
                                ],),
                            );
                          })

                        ],
                      );
                    }
                    else
                    {
                      return const FetchErrorText(text: 'Something went wrong!');
                    }
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

