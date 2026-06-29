import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:real_estate/data/model/create_property/recommend_property_response.dart' as recommand;
import 'package:real_estate/data/model/home/home_data_model.dart';
import 'package:real_estate/presentation/router/route_names.dart';
import 'package:real_estate/presentation/utils/utils.dart';

import '../../../../data/data_provider/remote_url.dart';
import '../../../../data/model/home/project_response.dart';
import '../../../../logic/cubit/home/cubit/home_cubit.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../../utils/k_images.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/favorite_button.dart';
import 'single_property_card_view.dart';

class AllPropertyListScreen extends StatelessWidget {
  const AllPropertyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>().homeModel!.featuredProperties;
    // print(homeCubit.properties.length);
    // print(homeCubit.description);
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: CustomAppBar(
        title: "All Properties",
      ),
      body: ListView.builder(
        itemCount: homeCubit!.length,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)
            .copyWith(bottom: 40.0),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = homeCubit[index];
          return GestureDetector(
              onTap: () => Navigator.pushNamed(
                    context,
                    RouteNames.propertyDetailsScreen,
                    arguments: item.slug,
                  ),
              child: SinglePropertyCardView(property: LocationProperties.fromJson(jsonEncode(item))));
        },
      ),
    );
  }
}

class AllProjectListScreen extends StatefulWidget {
  const AllProjectListScreen({super.key});

  @override
  State<AllProjectListScreen> createState() => _AllProjectListScreenState();
}

class _AllProjectListScreenState extends State<AllProjectListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getProjectListWith(1);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final bloc = context.read<HomeCubit>();
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll - 300 && !bloc.isLoading && bloc.hasMore) {
      bloc.getProjectListWith(bloc.currentPage + 1, isPagination: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "All Project",
        bgColor: Colors.white,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final bloc = context.read<HomeCubit>();
          final projects = bloc.projectPageList;

          if (state is HomeLoadingState && projects.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeErrorState) {
            return Center(child: Text("Error: ${state.error}"));
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: projects.length + 1, // +1 for loader
            padding: const EdgeInsets.symmetric(horizontal: 15.0).copyWith(bottom: 40.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < projects.length) {
                final item = projects[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteNames.projectDetailsScreen,
                    arguments: item.id.toString(),
                  ),
                  child: itemCard(item, context),
                );
              } else {
                return (state is ProjectPaginationLoadingState)
                    ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                )
                    : SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
  Widget itemCard(ProjectResponse projectResponse,BuildContext context){
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(right: 12.0),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl:RemoteUrls.projectFeatureURL+projectResponse.featuredImage!,
                    height: double.infinity,
                    width: 140.0,
                    fit: BoxFit.fill,
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
                    child:     Row(
                      children: [
                        FavoriteButton(id: projectResponse.id.toString()),
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
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        text: Utils.formatPrice(
                            context, projectResponse.maxPrice),
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                      CustomTextStyle(
                        text: Utils.formatPrice(
                            context, projectResponse.minPrice),
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),


                    ],
                  ),
                  const SizedBox(height: 3.0),
                  Flexible(
                    child: CustomTextStyle(
                      text: projectResponse.title!,
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
                          text: projectResponse.address!,
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
          ),
        ],
      ),
    );
  }
}

class NearByPropertyList extends StatefulWidget {
  const NearByPropertyList({super.key});

  @override
  State<NearByPropertyList> createState() => _NearByPropertyListState();
}

class _NearByPropertyListState extends State<NearByPropertyList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // initial data load
    context.read<HomeCubit>().getLocationListWith(1);

    _scrollController.addListener(_onScroll);
  }


  void _onScroll() {
    final bloc = context.read<HomeCubit>();
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll - 300 && !bloc.isLoading2 && bloc.hasMore2) {
      bloc.getLocationListWith(bloc.currentPage2 + 1, isPagination: true);
    }
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "NearBy Properties",
        bgColor: Colors.white,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          final properties = cubit.locationProperties;

          if (state is HomeLoadingState && properties.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: properties.length + (cubit.hasMore2 ? 1 : 0),
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0).copyWith(bottom: 40.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < properties.length) {
                final item = properties[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteNames.propertyDetailsScreen,
                    arguments: item.id.toString(),
                  ),
                  child: itemCard(item, context),
                );
              } else {
                // Loader at the bottom
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget itemCard(LocationProperties projectResponse,BuildContext context){
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
                   imageUrl:  RemoteUrls.propertyFeatureURL+projectResponse.featuredImage!,
                    height: double.infinity,
                    width: 140.0,
                    fit: BoxFit.fill,
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
                    child:     Row(
                      children: [
                        FavoriteButton(id: projectResponse.id.toString()),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextStyle(
                            text: Utils.formatPrice(
                                context, projectResponse.price),
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                          ),
                          CustomTextStyle(
                            text: (projectResponse.purpose??"").toUpperCase(),
                            color: grayColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            decoration: TextDecoration.underline,

                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Flexible(
                        child: CustomTextStyle(
                          text: projectResponse.title!,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          maxLine: 2,
                          height: 1.2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomImage(path: KImages.locationIcon),
                          const SizedBox(width: 6.0),
                          Flexible(
                            child: CustomTextStyle(
                              text: projectResponse.address!,
                              color: grayColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0,
                              maxLine: 2,
                              height: 1.2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
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
                          child: Text(projectResponse!.type!.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 10),))
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



class FeatureProperty extends StatefulWidget {
  const FeatureProperty({super.key});

  @override
  State<FeatureProperty> createState() => _FeatureProperty();
}

class _FeatureProperty extends State<FeatureProperty> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // initial data load
    context.read<HomeCubit>().getFeatureListWith(1);

    _scrollController.addListener(_onScroll);
  }


  void _onScroll() {
    final bloc = context.read<HomeCubit>();
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll - 300 && !bloc.isLoading3 && bloc.hasMore3) {
      bloc.getFeatureListWith(bloc.currentPage3 + 1, isPagination: true);
    }
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "All Feature Properties",
        bgColor: Colors.white,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          final properties = cubit.featureProperties;

          if (state is HomeLoadingState && properties.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: properties.length + (cubit.hasMore3 ? 1 : 0),
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0).copyWith(bottom: 40.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < properties.length) {
                final item = properties[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteNames.propertyDetailsScreen,
                    arguments: item.id.toString(),
                  ),
                  child: itemCard(item, context),
                );
              } else {
                // Loader at the bottom
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget itemCard(LocationProperties projectResponse,BuildContext context){
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
                    imageUrl:  RemoteUrls.propertyFeatureURL+projectResponse.featuredImage!,
                    height: double.infinity,
                    width: 140.0,
                    fit: BoxFit.fill,
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
                    child:     Row(
                      children: [
                        FavoriteButton(id: projectResponse.id.toString()),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextStyle(
                            text: Utils.formatPrice(
                                context, projectResponse.price),
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                          ),
                          CustomTextStyle(
                            text: (projectResponse.purpose??"").toUpperCase(),
                            color: grayColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            decoration: TextDecoration.underline,

                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Flexible(
                        child: CustomTextStyle(
                          text: projectResponse.title!,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          maxLine: 2,
                          height: 1.2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomImage(path: KImages.locationIcon),
                          const SizedBox(width: 6.0),
                          Flexible(
                            child: CustomTextStyle(
                              text: projectResponse.address!,
                              color: grayColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0,
                              maxLine: 2,
                              height: 1.2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
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
                          child: Text(projectResponse!.type!.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 10),))
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





class RecommendProperty extends StatelessWidget {
  const RecommendProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>().recommendPropertyResponse!.featuredProperties;
    // print(homeCubit.properties.length);
    // print(homeCubit.description);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "All Recommend Properties",
        bgColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: homeCubit!.length,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0)
            .copyWith(bottom: 40.0),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = homeCubit[index];
          return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                RouteNames.propertyDetailsScreen,
                arguments: item.id.toString(),
              ),
              child: itemCard(item,context));
        },
      ),
    );
  }

  Widget itemCard(recommand.FeaturedProperties projectResponse,BuildContext context){
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
                    imageUrl:  RemoteUrls.propertyFeatureURL+projectResponse.featuredImage!,
                    height: double.infinity,
                    width: 140.0,
                    fit: BoxFit.fill,
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
                    child:     Row(
                      children: [
                        FavoriteButton(id: projectResponse.id.toString()),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextStyle(
                            text: Utils.formatPrice(
                                context, projectResponse.price),
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                          ),
                          CustomTextStyle(
                            text: (projectResponse.purpose??"").toUpperCase(),
                            color: grayColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            decoration: TextDecoration.underline,

                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Flexible(
                        child: CustomTextStyle(
                          text: projectResponse.title!,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          maxLine: 2,
                          height: 1.2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomImage(path: KImages.locationIcon),
                          const SizedBox(width: 6.0),
                          Flexible(
                            child: CustomTextStyle(
                              text: projectResponse.address!,
                              color: grayColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0,
                              maxLine: 2,
                              height: 1.2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
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
                          child: Text(projectResponse!.type!.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 10),))
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
