import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/data/model/payment/pricing_plan_model.dart';
import '/logic/cubit/payment/payment/payment_cubit.dart';
import '/logic/cubit/setting/app_setting_cubit.dart';
import '../../../../logic/bloc/login/login_bloc.dart';
import '../../../router/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_test_style.dart';

class SubscriptionFees extends StatelessWidget {
  const SubscriptionFees({super.key, required this.pricePlan});

  final PricePlan pricePlan;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final icon =
        context.read<AppSettingCubit>().settingModel!.setting.currencyIcon;

    final paymentCubit = context.read<PaymentCubit>();
    final login = context.read<LoginBloc>();
    return Container(
      width: size.width,
      // height: 400.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius,
        border: Border.all(color: primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0)
                .copyWith(top: 0.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: borderRadius,
            ),
            child: Row(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      // WidgetSpan(
                      //   child: Transform.translate(
                      //     offset: const Offset(0.0, -16.0),
                      //     child: CustomTextStyle(
                      //       text: icon,
                      //       fontSize: 16.0,
                      //       fontWeight: FontWeight.w600,
                      //       color: blackColor,
                      //     ),
                      //   ),
                      // ),
                      TextSpan(
                        text: Utils.formatPrice(context,pricePlan.price),
                        // text: pricePlan.planPrice.toStringAsFixed(2),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 40.0,
                          color: blackColor,
                        ),
                      ),
                      TextSpan(
                        text: pricePlan.term!.isNotEmpty
                            ? '/${pricePlan.term}'
                            : pricePlan.term!,
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          color: blackColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          FeatureWidget(pricePlan: pricePlan),
          Utils.logoutListener(
            child: BlocListener<PaymentCubit, PaymentState>(
              listener: (context, state) {
                if (state is PaymentStateEnrollLoading) {
                  Utils.loadingDialog(context);
                } else {
                  Utils.closeDialog(context);
                  if (state is PaymentStateEnrollError) {
                    if (state.statusCode == 401) {
                      Utils.logout(context);
                    } else {
                      Utils.errorSnackBar(context, state.message);
                    }
                  } else if (state is PaymentStateEnrollLoaded) {
                    Utils.showSnackBar(context, state.message);
                  }
                }
              },

              child: GestureDetector(
                // onTap: pricePlan.planType == 'free'
                //     ? () => paymentCubit.freeEnrollment(pricePlan.planSlug)
                //     : () => Navigator.pushNamed(
                //         context, RouteNames.paymentMethodScreen,
                //         arguments: pricePlan.planSlug),
                onTap: () {
                  if (login.userInfo != null &&
                      login.userInfo!.accessToken.isNotEmpty) {
                    // if (pricePlan.planType == 'free') {
                    //   paymentCubit.freeEnrollment(pricePlan.planSlug);
                    // } else {
                      Navigator.pushNamed(
                          context, RouteNames.paymentMethodScreen,
                          arguments: pricePlan.title);
                    // }
                  } else {
                    Utils.showSnackBarWithLogin(context);
                  }
                },
                child: Container(
                  width: size.width * 0.6,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0)
                      .copyWith(bottom: 0.0),
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: borderRadius,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CustomTextStyle(
                        text: 'Apply for Plan',
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        color: whiteColor,
                      ),
                      Container(
                        width: size.width * 0.1,
                        height: size.height * 0.04,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.22),
                          borderRadius: borderRadius,
                        ),
                        child: const Icon(
                          Icons.arrow_right_alt_outlined,
                          color: whiteColor,
                          size: 22.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({super.key, required this.pricePlan});

  final PricePlan pricePlan;

  @override
  Widget build(BuildContext context) {
    final List<String> features = [
      "Property Submission",
      "Agent",
      "Gallery Images (Per Property)",
      "Additional Features (Per Property)",
      "Project,",
      "Project Types (Per Project)",
      "Gallery Images (Per Project)",
      " Additional Features (Per Project)",
      "Image Gallery",
    ];
    return Column(
      children: [
        isEnableProperty(features[0], (pricePlan.numberOfProperty.toString())),
        isEnableProperty(features[1], (pricePlan.numberOfAgent??0).toString()),
        isEnableProperty(features[1], pricePlan.numberOfProjectGalleryImages.toString()),
        isEnableProperty(features[2], pricePlan.numberOfPropertyAdittionlSpecifications.toString()),
        isEnableProperty(features[2], pricePlan.numberOfProjects.toString()),
        isEnableProperty(features[3], pricePlan.numberOfProjectTypes.toString()),
        isEnableProperty(features[3], pricePlan.numberOfProjectGalleryImages.toString()),
        isEnableProperty(features[4], pricePlan.numberOfProjectAdditionlSpecifications.toString()),
        // isEnableProperty(features[5], pricePlan.status),
        // isEnableProperty(features[6], pricePlan.status),
        // isEnableProperty(features[7], pricePlan.status),
        // isEnableProperty(features[8], pricePlan.status),
      ],
    );
  }

  Widget _singleFeature(String test, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.done_outlined, color: Colors.green),
          const SizedBox(width: 10.0),
          Text(
            number.toString(),
            style: GoogleFonts.dmSans(
                fontSize: 16.0, color: grayColor, fontWeight: FontWeight.w400),
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: Text(
              test,
              style: GoogleFonts.dmSans(
                  fontSize: 16.0, color: grayColor, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget isEnableProperty(String text, String status) {
    print("status=>$status");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(status != '0' && status.isNotEmpty  ? Icons.done_outlined : Icons.clear,
              color: status != '0' && status.isNotEmpty  ? Colors.green : redColor,size: 15,),
          const SizedBox(width: 10.0),
          Text(
            status.toString(),
            style: GoogleFonts.dmSans(
                fontSize: 14.0, color: grayColor, fontWeight: FontWeight.w400),
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.dmSans(
                  fontSize: 14.0, color: grayColor, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
