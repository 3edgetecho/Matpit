import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:real_estate/data/data_provider/remote_url.dart';
import 'package:real_estate/data/model/create_property/recommend_property_response.dart' as recommend;
import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/presentation/widget/fetch_text_error.dart';

import '../../../data/model/home/homeSlider.dart';
import '/logic/cubit/home/cubit/home_cubit.dart';
import '/logic/cubit/profile/profile_cubit.dart';
import '/presentation/utils/utils.dart';
import '/presentation/widget/loading_widget.dart';
import '/presentation/widget/page_refresh.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../data/model/home/home_data_model.dart';
import '../../../logic/cubit/profile/profile_state_model.dart';
import '../../../logic/cubit/setting/app_setting_cubit.dart';
import '../../router/route_names.dart';
import 'component/all_property_list.dart';
import 'component/fun_fact_section.dart';
import 'component/home_app_bar.dart';
import 'component/horizontal_category_view.dart';
import 'component/horizontal_property_view.dart';
import 'component/property_agents_view.dart';
import 'component/search_field.dart';
import 'component/single_property_card_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: const HomeAppBar(),
      body: PageRefresh(
        onRefresh: () async {

         homeCubit.getHomeData();
         homeCubit.getHomeSlider();
         },
        child: Utils.logoutListener(
          child: BlocListener<ProfileCubit, ProfileStateModel>(
            listener: (context, state) {
              final profile = state.profileState;
              if (profile is ProfileUpdateLoaded) {
                Utils.showSnackBar(context, profile.message);
                context.read<ProfileCubit>().getAgentProfile();
              }
              if (profile is ProfileError) {
                if (profile.statusCode == 401) {
                  // debugPrint('profile-error ${profile.message}');
                  Utils.logout(context);
                }
              }
            },
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                recommend.RecommendPropertyResponse? recommendPropertyResponse;

                if(state is RecommendDataLoader){
                  recommendPropertyResponse = state.homeDataLoaded;
                }
                if (state is HomeLoadingState) {
                  return const LoadingWidget();
                }
                if (state is HomeErrorState) {
                  return FetchErrorText(text: state.error);
                }
                if (state is HomeDataLoaded) {
                  return LoadedWidget(homeDataModel: state.homeDataLoaded,recommendPropertyResponse: recommendPropertyResponse??null,);
                }
                if (homeCubit.homeModel != null) {
                  return LoadedWidget(homeDataModel: homeCubit.homeModel!,recommendPropertyResponse: recommendPropertyResponse??null);
                } else {
                  return const LoadingWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class LoadedWidget extends StatefulWidget {
  const LoadedWidget({super.key, required this.homeDataModel,required this.recommendPropertyResponse});

  final HomeDataModel homeDataModel;
  final recommend.RecommendPropertyResponse? recommendPropertyResponse;

  @override
  State<LoadedWidget> createState() => _LoadedWidgetState();
}

class _LoadedWidgetState extends State<LoadedWidget> {
  late String image;
  // late AppSettingCubit appSetting;

  _initState() {
    // appSetting = context.read<AppSettingCubit>();
    final profileImage = context.read<ProfileCubit>();
    if (profileImage.users != null) {
      image = profileImage.users!.image??"";
    } else {
      // image = appSetting.settingModel!.setting.defaultAvatar;
    }
  }

  @override
  void initState() {
    _initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("imageeee: $image");
    final homeCubit = context.read<HomeCubit>();
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        // HomeAppBar(image: image, logo: appSetting.settingModel!.setting.logo),
        Utils.verticalSpace(0.0),
        // const HomeAppBar(),
        const SearchField(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    final type = "rent";
                    print(type);
                    Navigator.pushNamed(
                        context, RouteNames.filterPropertyScreen,
                        arguments: "rent");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    //minimumSize: const Size(0, 0), // height control
                    //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "RENT",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final type = "sale";
                    print(type);
                    Navigator.pushNamed(
                        context, RouteNames.filterPropertyScreen,
                        arguments: "sale");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    //minimumSize: const Size(0, 0), // height control
                    //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "SELL",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final type = "residential";
                    print(type);
                    Navigator.pushNamed(
                        context, RouteNames.filterPropertyScreen,
                        arguments: "residential");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    //minimumSize: const Size(0, 0), // height control
                    //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "RESIDENTIAL",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final type = "commercial";
                    print(type);
                    Navigator.pushNamed(
                        context, RouteNames.filterPropertyScreen,
                        arguments: "commercial");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    //minimumSize: const Size(0, 0), // height control
                    //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "COMMERCIAL",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),

              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 12),
        //   clipBehavior: Clip.antiAlias,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(0),
        //     border: Border.all(color: Colors.transparent),
        //   ),
        //   child: GestureDetector(
        //     onTap: () {
        //       // banner click action
        //     },
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(11),
        //       child: Image.asset(
        //         "assets/images/slider.jpeg",
        //         width: double.infinity,
        //         height: 200,
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //   ),
        // ),
        const SliderWidget(),
        Utils.verticalSpace(10.0),
        HorizontalCategoryView(category: widget.homeDataModel.categories!),
        Utils.verticalSpace(20),
        BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (homeCubit.nearByProperty != null)
                return HorizontalPropertyView2(
                    onTap: () =>
                        Navigator.push(context,MaterialPageRoute(builder: (context) => NearByPropertyList(),)),

                    headingText: "Nearby Properties",
                    featuredProperty: homeCubit.nearByProperty);
              else
              {
                return const FetchErrorText(text: 'No  Properties');
              }
            }),

        // Utils.verticalSpace(20),
        // PropertyAgentView(agentsModel: widget.homeDataModel.agent),
        Utils.verticalSpace(20),
        BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if(homeCubit.featureByProperty!.isNotEmpty){
                return   HorizontalPropertyView(
                    onTap: () =>
                        Navigator.push(context,MaterialPageRoute(builder: (context) => FeatureProperty(),)),
                    headingText: "Feature Properties",
                    featuredProperty: homeCubit.featureByProperty!);
              }
              else
              {
                return const FetchErrorText(text: 'No Feature Properties');
              }
            }
        ),

        // Utils.verticalSpace(20),
        // FunFactSection(counter: widget.homeDataModel.counter),

        Utils.verticalSpace(20),
        BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      if(homeCubit.projectPageList.isNotEmpty){
        return HorizontalPropertyView3(
            onTap: () =>
                Navigator.push(context,MaterialPageRoute(builder: (context) => AllProjectListScreen(),)),
            headingText: "Projects",
            featuredProperty: homeCubit.projectPageList!);
      }
      else
      {
        return const FetchErrorText(text: 'No Project');
      }
    }

        ),
        Utils.verticalSpace(20),
        BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {

              if(homeCubit.recommendPropertyResponse!=null){
                recommend.RecommendPropertyResponse? recommendPropertyResponse = homeCubit.recommendPropertyResponse;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  Utils.symmetric(h: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomTextStyle(text: "Recommend for you",fontSize: 18.0,fontWeight: FontWeight.w700,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => RecommendProperty(),));
                            },
                            child: const CustomTextStyle(
                              text: 'See All',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF7E8BA0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Utils.verticalSpace(6.0),
                    ...List.generate( recommendPropertyResponse!.featuredProperties!=null ? recommendPropertyResponse!.featuredProperties!.length>10 ? 10: recommendPropertyResponse!.featuredProperties!.length:0, (index){
                      final item =  recommendPropertyResponse!.featuredProperties![index];
                      return Padding(
                        padding: Utils.symmetric(h: 16.0),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  RouteNames.propertyDetailsScreen,
                                  arguments: item.id.toString(),
                                ),
                                child: SinglePropertyCardView2(property: item))
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

        // const RecommendedProperties(),
        // const SizedBox(height: 20.0),
      ],
    );
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget>
    with AutomaticKeepAliveClientMixin {
  final ValueNotifier<int> _bannerIndex = ValueNotifier(0);
  int bannersLength = 0;
  late Timer _timer;
  final PageController _pageController = PageController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    context.read<HomeCubit>().getHomeSlider();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_bannerIndex.value < bannersLength - 1) {
        _bannerIndex.value++;
      } else {
        _bannerIndex.value = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _bannerIndex.value,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bannerIndex.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    final sliderList = homeCubit.sliderData; // ✅ use existing data

    return Column(
      children: [
        if (sliderList.isNotEmpty)
          CarouselSlider(
            items: sliderList.map((e) => _buildBanner(e)).toList(),
            options: CarouselOptions(
              height: 210.h,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _bannerIndex.value = index;
                });
              },
            ),
          )
          // CarouselSlider(
          //   items: [
          //     _buildBanner(sliderList[0]),
          //   ],
          //   options: CarouselOptions(
          //     height: 210.h,
          //     viewportFraction: 1.0,
          //     enableInfiniteScroll: false, // ❌ no loop
          //     autoPlay: false,             // ❌ no autoplay
          //     enlargeCenterPage: false,
          //     padEnds: false,
          //   ),
          // )

        else
          const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }


  Widget _buildBanner(HomeSlider banner) {

    print("bannerImage=>${banner.bannerImage.toString()}");
    print("bannerImage=>${RemoteUrls.bannerImageURL + banner.bannerImage.toString()}");
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
            context, RouteNames.projectDetailsScreen,
            arguments: banner.id.toString()),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: CachedNetworkImage(
            imageUrl: RemoteUrls.bannerImageURL + banner.bannerImage.toString(),
            width: double.infinity,
            height: 200,
            fit: BoxFit.fill,
            placeholder: (context, url) => SizedBox(
              width: double.infinity,
              height: 200,
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Image.network(
              'https://ramadaplazachaofah.com/wp-content/uploads/2023/04/Hero-Banner-Placeholder-Light-2500x1172-1.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),

      ),
    );
  }
}


