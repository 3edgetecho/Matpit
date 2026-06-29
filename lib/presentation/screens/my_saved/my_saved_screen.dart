import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:real_estate/data/model/wishlist/wishlist_model.dart';
import 'package:real_estate/presentation/widget/primary_button.dart';

import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../../data/data_provider/remote_url.dart';
import '../../../data/model/product/property_item_model.dart';
import '../../../logic/cubit/wishlist/wishlist_cubit.dart';
import '../../router/route_names.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widget/custom_images.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/empty_widget.dart';
import '../../widget/favorite_button.dart';
import '../../widget/fetch_text_error.dart';
import '../../widget/loading_widget.dart';
import '../../widget/page_refresh.dart';
import '../home/component/single_property_card_view.dart';

class MySavedScreen extends StatefulWidget {
  const MySavedScreen({super.key});

  @override
  State<MySavedScreen> createState() => _MySavedScreenState();
}

class _MySavedScreenState extends State<MySavedScreen> {
  @override
  void initState() {
    Future.microtask(
        () => context.read<WishlistCubit>().getWishListProperties());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wishlistCubit = context.read<WishlistCubit>();
    // wishlistCubit.getWishListProperties();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'My Wishlist', showButton: false,bgColor: Colors.white,),
      body: PageRefresh(
        onRefresh: () async => wishlistCubit.getWishListProperties(),
        child: Utils.logoutListener(
            child: BlocConsumer<WishlistCubit, WishlistState>(
          listener: (context, state) {
            if (state is WishListError) {
              if (state.statusCode == 401) {
                // print('callesssssss logoutFunction');
                // context.read<LoginBloc>().add(const LoginEventLogout());
                Utils.logout(context);
              }
            }
          },
          builder: (context, state) {
            // final wishlist = state.wishlistState;
            if (state is WishListLoading) {
              return const LoadingWidget();
            } else if (state is WishListError) {
              if (state.statusCode == 503) {
                return WishlistLoadedWidget(wishlist: wishlistCubit.wishlist);
              } else if (state.statusCode == 401) {
                return _buildLoginButton(context);
              } else {
                return FetchErrorText(text: state.message);
              }
            } else if (state is WishListLoaded) {
              return WishlistLoadedWidget(
                  wishlist: state.wishlist!.wishlistId!);
            }
            return WishlistLoadedWidget(wishlist: wishlistCubit.wishlist);
            // return const Center(
            //     child: CustomTextStyle(text: 'Something went wrong'));
          },
          // buildWhen: (previous, current) {
          //   print('pre $previous');
          //   print('cur $current');
          //   return previous != current;
          // },
        )),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Center(
      child: Padding(
        padding: Utils.symmetric(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
                text: 'Login',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.loginScreen,
                    (route) => false,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class WishlistLoadedWidget extends StatelessWidget {
  const WishlistLoadedWidget({super.key, required this.wishlist});

  final List<WishlistId> wishlist;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (wishlist.isEmpty) {
      return Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        child: const EmptyWidget(
          icon: KImages.emptySavedIcon,
          title: 'No Item Found!',
        ),
      );
    } else {
      return ListView.builder(
        itemCount: wishlist.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0)
            .copyWith(bottom: 40.0),
        itemBuilder: (context, index) {
          final item = wishlist[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, RouteNames.propertyDetailsScreen,
                arguments: item.id.toString()),
            child: SinglePropertyCardView(
              property: item,
            ),
          );
        },
      );
    }
  }
}

class SinglePropertyCardView extends StatelessWidget {
  const SinglePropertyCardView({super.key, required this.property});
  final WishlistId property;

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                  const SizedBox(height: 6.0),
                  Flexible(
                    child: CustomTextStyle(
                      text: property.title!,
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
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
                        padding: const EdgeInsets.only(top: 3.0),
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
