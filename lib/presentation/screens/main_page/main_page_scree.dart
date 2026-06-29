// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:real_estate/logic/cubit/agency/agency_cubit.dart';
// import 'package:real_estate/logic/cubit/company/company_cubit.dart';
// import 'package:real_estate/logic/cubit/order/order_cubit.dart';
// import 'package:real_estate/presentation/screens/property_create/new_property_create_screen.dart';
//
// import '../../../../presentation/utils/constraints.dart';
// import '../../../../presentation/utils/k_images.dart';
// import '../../../../presentation/utils/utils.dart';
// import '../../../../presentation/widget/custom_images.dart';
// import '../../../../presentation/widget/custom_test_style.dart';
// import '../../../logic/bloc/login/login_bloc.dart';
// import '../../../logic/cubit/about_us/about_us_cubit.dart';
// import '../../../logic/cubit/agent/agent_cubit.dart';
// import '../../../logic/cubit/booking/booking_cubit.dart';
// import '../../../logic/cubit/contact_us/contact_us_cubit.dart';
// import '../../../logic/cubit/create_property/create_info_cubit.dart';
// import '../../../logic/cubit/filter_property/filter_property_cubit.dart';
// import '../../../logic/cubit/home/cubit/home_cubit.dart';
// import '../../../logic/cubit/kyc/kyc_cubit.dart';
// import '../../../logic/cubit/payment/price_plan/price_plan_cubit.dart';
// import '../../../logic/cubit/privacy_policy/privacy_policy_cubit.dart';
// import '../../../logic/cubit/profile/profile_cubit.dart';
// import '../../../logic/cubit/setting/app_setting_cubit.dart';
// import '../../../logic/cubit/support/support_cubit.dart';
// import '../../../logic/cubit/wishlist/wishlist_cubit.dart';
// import '../all_settings/all_settings_screen.dart';
// import '../dashboard/dashboard_screen.dart';
// import '../home/home_screen.dart';
// import '../my_deals/my_deals_screen.dart';
// import '../my_saved/my_saved_screen.dart';
// import '../property_create/choose_property_option_screen.dart';
// import 'component/bottom_navigation_bar.dart';
// import 'component/main_controller.dart';
//
// class MainPageScreen extends StatefulWidget {
//   const MainPageScreen({super.key});
//
//   @override
//   State<MainPageScreen> createState() => _MainPageScreenState();
// }
//
// class _MainPageScreenState extends State<MainPageScreen> {
//   final _homeController = MainController();
//   late LoginBloc loginBloc;
//   late List<Widget> screenList;
//
//   @override
//   void initState() {
//     super.initState();
//
//     loginBloc = context.read<LoginBloc>();
//
//
//     //print("typr${loginBloc.userInfo!.type}");
//      if(loginBloc.userInfo!.type == "vendor" ){
//
//
//       screenList = [
//         const HomeScreen(),
//         const MyDealsScreen(),
//
//        // const NewPropertyCreateScreen(id: "",),
//         const MySavedScreen(),
//         //const DashboardScreen(),
//          AllSettingScreen(isShowBack:false),
//         // const OrderScreen(),
//         // Container(),
//       ];
//     }
//     else {
//
//       screenList = [
//         const HomeScreen(),
//        // const MyDealsScreen(),
//
//        // const ChoosePropertyOptionScreen(),
//         const MySavedScreen(),
//         //const DashboardScreen(),
//         AllSettingScreen(isShowBack:false),
//         // const OrderScreen(),
//         // Container(),
//       ];
//     }
//
//
//    // context.read<PrivacyPolicyCubit>().getFaqContent();
//    // context.read<PrivacyPolicyCubit>().getTermsAndCondition();
//    // context.read<PrivacyPolicyCubit>().getPrivacyPolicy();
//     context.read<WishlistCubit>().getWishListProperties();
//    // context.read<ContactUsCubit>().getContactUs();
//    // context.read<AboutUsCubit>().getAboutUs();
//     //context.read<AgentCubit>().getAllAgent();
//   //  context.read<PricePlanCubit>().getPricePlan();
//     //context.read<FilterPropertyCubit>().getAllProperty();
//    // context.read<CreateInfoCubit>().getPropertyChooseInfo();
//     context.read<ProfileCubit>().getAgentProfile();
//     context.read<ProfileCubit>().getAgentDashboardInfo();
//     //context.read<ProfileCubit>().getAgentDashboardInfo();
//    // context.read<CreateInfoCubit>().getCreateInfo('rent');
//    // context.read<SupportCubit>().getPriorityList();
//    // context.read<KycCubit>().getKycInfo();
//    // context.read<BookingCubit>().getCompareList();
//    // context.read<CompanyCubit>().getAgencyKyc();
//    // context.read<CompanyCubit>().getCompanyProfile();
//    // context.read<OrderCubit>().getAllOrders();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         exitApp(context);
//         return true;
//       },
//       child: Scaffold(
//         body: StreamBuilder<int>(
//           initialData: 0,
//           stream: _homeController.naveListener.stream,
//           builder: (context, AsyncSnapshot<int> snapshot) {
//             int item = snapshot.data ?? 0;
//             return screenList[item];
//           },
//         ),
//         bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
//           builder: (context, state) {
//             // if (state is HomeDataLoaded) {
//               return const MyBottomNavigationBar();
//             // } else {
//             //   return const SizedBox.shrink();
//             // }
//           },
//         ),
//         // bottomNavigationBar: const MyBottomNavigationBar(),
//       ),
//     );
//   }
//
//   exitApp(BuildContext context) async {
//     Utils.showCustomDialog(
//       context,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 25.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const CustomImage(path: KImages.logoutIcon),
//             const SizedBox(height: 10.0),
//             const CustomTextStyle(
//               textAlign: TextAlign.center,
//               text: 'Are you sure\nYou want to Exit?',
//               fontSize: 24.0,
//               fontWeight: FontWeight.w500,
//             ),
//             const SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 logoutButton(
//                     'No', () => Navigator.of(context).pop(), blackColor),
//                 const SizedBox(width: 14.0),
//                 logoutButton('Exit', () => SystemNavigator.pop(), primaryColor),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget logoutButton(String text, VoidCallback onPressed, Color bgColor) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ButtonStyle(
//           minimumSize: MaterialStateProperty.all(const Size(100.0, 40.0)),
//           backgroundColor: MaterialStateProperty.all(bgColor),
//           elevation: MaterialStateProperty.all(0.0),
//           shadowColor: MaterialStateProperty.all(transparent),
//           splashFactory: NoSplash.splashFactory,
//           shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(borderRadius: borderRadius))),
//       child: CustomTextStyle(
//         text: text,
//         fontWeight: FontWeight.w500,
//         fontSize: 18.0,
//         color: whiteColor,
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/bloc/login/login_bloc.dart';
import '../../../logic/cubit/home/cubit/home_cubit.dart';
import '../../../logic/cubit/profile/profile_cubit.dart';
import '../../../logic/cubit/wishlist/wishlist_cubit.dart';

import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/utils/utils.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/custom_test_style.dart';

import '../all_settings/all_settings_screen.dart';
import '../home/home_screen.dart';
import '../my_deals/my_deals_screen.dart';
import '../my_saved/my_saved_screen.dart';
import 'component/bottom_navigation_bar.dart';
import 'component/main_controller.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  final _homeController = MainController();
  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = context.read<LoginBloc>();

    // APIs call kar sakte ho yahan
    context.read<WishlistCubit>().getWishListProperties();
    context.read<ProfileCubit>().getAgentProfile();
    context.read<ProfileCubit>().getAgentDashboardInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginModelState>(
      builder: (context, state) {
        final user = loginBloc.userInfo;

        /// 🔴 Jab tak user null hai loader dikhao
        if (user == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: primaryColor),
            ),
          );
        }

        /// ✅ User aa gaya — ab screenList decide karo
        final List<Widget> screenList =
        user.type == "vendor"
            ? [
          const HomeScreen(),
          const MyDealsScreen(),
          const MySavedScreen(),
          AllSettingScreen(isShowBack: false),
        ]
            : [
          const HomeScreen(),
          const MySavedScreen(),
          AllSettingScreen(isShowBack: false),
        ];

        return WillPopScope(
          onWillPop: () async {
            exitApp(context);
            return true;
          },
          child: Scaffold(
            body: StreamBuilder<int>(
              initialData: 0,
              stream: _homeController.naveListener.stream,
              builder: (context, snapshot) {
                int item = snapshot.data ?? 0;
                return screenList[item];
              },
            ),
            bottomNavigationBar: const MyBottomNavigationBar(),
          ),
        );
      },
    );
  }

  /// Exit Dialog
  exitApp(BuildContext context) {
    Utils.showCustomDialog(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomImage(path: KImages.logoutIcon),
            const SizedBox(height: 10.0),
            const CustomTextStyle(
              textAlign: TextAlign.center,
              text: 'Are you sure\nYou want to Exit?',
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logoutButton(
                  'No',
                      () => Navigator.of(context).pop(),
                  blackColor,
                ),
                const SizedBox(width: 14.0),
                logoutButton(
                  'Exit',
                      () => SystemNavigator.pop(),
                  primaryColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton(String text, VoidCallback onPressed, Color bgColor) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(100.0, 40.0)),
        backgroundColor: MaterialStateProperty.all(bgColor),
        elevation: MaterialStateProperty.all(0.0),
        shadowColor: MaterialStateProperty.all(transparent),
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: borderRadius),
        ),
      ),
      child: CustomTextStyle(
        text: text,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
        color: whiteColor,
      ),
    );
  }
}