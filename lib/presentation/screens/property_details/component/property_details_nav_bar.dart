import 'dart:io';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/logic/cubit/booking/booking_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/data_provider/remote_url.dart';
import '../../../../data/model/create_property/cities_model.dart';
import '../../../../logic/bloc/login/login_bloc.dart';
import '../../../../logic/cubit/create_property/create_info_cubit.dart';
import '../../../../logic/cubit/home/cubit/property_details_cubit.dart';
import '../../../router/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widget/contact_button.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/primary_button.dart';
import 'date_time_view.dart';

class PropertyDetailNavBar extends StatelessWidget {
  const PropertyDetailNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginBloc = context.read<LoginBloc>();
    void getErrorMessage() {
      return Utils.showSnackBar(context, 'WhatsApp is not installed yet!');
    }

    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoaded) {
          final agent = state.singlePropertyModel.vendor;
          final admin = state.singlePropertyModel.admin;
          return agent!=null ?
          Container(
            width: size.width,
            // height: 190.0,

            padding: const EdgeInsets.only(bottom: 5.0,top: 5),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                // Align(
                //   alignment: Alignment.center,
                //   child: GestureDetector(
                //     onTap: () {
                //       if (loginBloc.userInfo != null &&
                //           loginBloc.userInfo!.accessToken.isNotEmpty) {
                //         context.read<BookingCubit>().clear();
                //         Navigator.pushNamed(
                //             context, RouteNames.createBookingScreen);
                //       } else {
                //         Utils.showSnackBarWithLogin(context);
                //       }
                //     },
                //     // onTap: () => _bookingDialog(context),
                //     child: Container(
                //      // margin: const EdgeInsets.symmetric(horizontal: 20.0),
                //      //  padding: const EdgeInsets.symmetric(
                //      //      horizontal: 22.0, vertical: 12.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(color: whiteColor),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(4.0)),
                //       ),
                //       child: const CustomTextStyle(
                //         text: 'Booking',
                //         color: whiteColor,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 18.0,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: Utils.symmetric(h: 20.0),
                  child: PrimaryButton(
                      bgColor: yellowColor,
                      textColor: blackColor,
                      text: "Enquiry Now", onPressed: (){
                    if (loginBloc.userInfo != null &&
                        loginBloc.userInfo!.accessToken.isNotEmpty) {
                      context.read<BookingCubit>().clear();
                      _bookingDialog(context,agent.id.toString(),state.singlePropertyModel.property!.id.toString(),"vendor");
                    } else {
                      Utils.showSnackBarWithLogin(context);
                    }
                  }),
                ),



                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     // ContactButton(
                //     //   onPressed: () {
                //     //     if (loginBloc.userInfo != null &&
                //     //         loginBloc.userInfo!.accessToken.isNotEmpty) {
                //     //       Navigator.pushNamed(
                //     //           context, RouteNames.sendMessageScreen,
                //     //           arguments: agent.email);
                //     //     } else {
                //     //       Utils.showSnackBarWithLogin(context);
                //     //     }
                //     //   },
                //     //   bgColor: whiteColor,
                //     //   text: 'Message',
                //     //   icon: KImages.messageIcon,
                //     //   iconTextColor: blackColor,
                //     // ),
                //    GestureDetector(
                //      onTap: (){
                //        if (loginBloc.userInfo != null &&
                //                loginBloc.userInfo!.accessToken.isNotEmpty) {
                //
                //              // Navigator.pushNamed(
                //              //     context, RouteNames.sendMessageScreen,
                //              //     arguments: agent!.email);
                //            } else {
                //              Utils.showSnackBarWithLogin(context);
                //            }
                //      },
                //      child: Container(
                //        decoration: BoxDecoration(
                //          borderRadius: BorderRadius.circular(8.0),
                //          color: whiteColor
                //        ),
                //        child: Padding(
                //          padding: Utils.symmetric(h: 30.0, v: 10.0),
                //          child: Row(children: [
                //              const CustomImage(path: KImages.messageIcon),
                //              Utils.horizontalSpace(8.0),
                //              const CustomTextStyle(text: "Message",fontSize: 16.0,fontWeight: FontWeight.w500,),
                //          ],),
                //        ),
                //      ),
                //    ),
                //
                //     GestureDetector(
                //       onTap: ()async{
                //         if (loginBloc.userInfo != null &&
                //             loginBloc.userInfo!.accessToken.isNotEmpty) {
                //           //Uri uri = Uri(scheme: 'call', path: agent.phone);
                //           final android =
                //               "whatsapp://send?phone=${agent!.phone}&text=Hello, ${agent.name} ";
                //           final ios =
                //               "https://wa.me/${agent!.phone}?text=${Uri.parse('Hello, I need your help')}";
                //           final androidUrl = Uri.parse(android);
                //           final iosUrl = Uri.parse(ios);
                //           try {
                //             if (agent.phone.isNotEmpty) {
                //               if (Platform.isIOS) {
                //                 await launchUrl(iosUrl,
                //                 mode: LaunchMode.externalApplication);
                //               } else {
                //                 await launchUrl(androidUrl,
                //                 mode: LaunchMode.externalApplication);
                //               }
                //             } else {
                //               Utils.showSnackBar(
                //                   context, 'Phone number is not available');
                //             }
                //           } catch (e) {
                //             debugPrint('exception-occurred ${e.toString()}');
                //             getErrorMessage();
                //           }
                //         } else {
                //           Utils.showSnackBarWithLogin(context);
                //         }
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(8.0),
                //             color: const Color(0xFF00bc144),
                //         ),
                //         child: Padding(
                //           padding: Utils.symmetric(h: 30.0, v: 10.0),
                //           child: Row(children: [
                //             const CustomImage(path: KImages.whatsAppIcon,color: whiteColor,height: 20,),
                //             Utils.horizontalSpace(8.0),
                //             const CustomTextStyle(text: "What\'s App",fontSize: 16.0,fontWeight: FontWeight.w500,color: whiteColor,),
                //           ],),
                //         ),
                //       ),
                //     ),
                //
                //
                //     // ContactButton(
                //     //   onPressed: () async {
                //     //     if (loginBloc.userInfo != null &&
                //     //         loginBloc.userInfo!.accessToken.isNotEmpty) {
                //     //       //Uri uri = Uri(scheme: 'call', path: agent.phone);
                //     //       final android =
                //     //           "whatsapp://send?phone=${agent.phone}&text=Hello, ${agent.name} ";
                //     //       final ios =
                //     //           "https://wa.me/${agent.phone}?text=${Uri.parse('Hello, I need your help')}";
                //     //       final androidUrl = Uri.parse(android);
                //     //       final iosUrl = Uri.parse(ios);
                //     //       try {
                //     //         if (agent.phone.isNotEmpty) {
                //     //           if (Platform.isIOS) {
                //     //             await launchUrl(iosUrl,
                //     //                 mode: LaunchMode.externalApplication);
                //     //           } else {
                //     //             await launchUrl(androidUrl,
                //     //                 mode: LaunchMode.externalApplication);
                //     //           }
                //     //         } else {
                //     //           Utils.showSnackBar(
                //     //               context, 'Phone number is not available');
                //     //         }
                //     //       } catch (e) {
                //     //         debugPrint('exception-occurred ${e.toString()}');
                //     //         getErrorMessage();
                //     //       }
                //     //     } else {
                //     //       Utils.showSnackBarWithLogin(context);
                //     //     }
                //     //   },
                //     //   bgColor: const Color(0xFF0bc144),
                //     //   text: 'What\'s App',
                //     //   icon: KImages.whatsAppIcon,
                //     //   iconTextColor: whiteColor,
                //     // ),
                //   ],
                // ),
              ],
            ),
          ):
          Container(
            width: size.width,
            // height: 190.0,

            padding: const EdgeInsets.only(bottom: 5.0,top: 5),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                // Align(
                //   alignment: Alignment.center,
                //   child: GestureDetector(
                //     onTap: () {
                //       if (loginBloc.userInfo != null &&
                //           loginBloc.userInfo!.accessToken.isNotEmpty) {
                //         context.read<BookingCubit>().clear();
                //         Navigator.pushNamed(
                //             context, RouteNames.createBookingScreen);
                //       } else {
                //         Utils.showSnackBarWithLogin(context);
                //       }
                //     },
                //     // onTap: () => _bookingDialog(context),
                //     child: Container(
                //      // margin: const EdgeInsets.symmetric(horizontal: 20.0),
                //      //  padding: const EdgeInsets.symmetric(
                //      //      horizontal: 22.0, vertical: 12.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(color: whiteColor),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(4.0)),
                //       ),
                //       child: const CustomTextStyle(
                //         text: 'Booking',
                //         color: whiteColor,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 18.0,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: Utils.symmetric(h: 20.0),
                  child: PrimaryButton(
                      bgColor: yellowColor,
                      textColor: blackColor,
                      text: "Enquiry Now", onPressed: (){
                    if (loginBloc.userInfo != null ) {
                      context.read<BookingCubit>().clear();
                      _bookingDialog(context,"0",state.singlePropertyModel.property!.id.toString(),"admin");
                    } else {
                      Utils.showSnackBarWithLogin(context);
                    }
                  }),
                ),



                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     // ContactButton(
                //     //   onPressed: () {
                //     //     if (loginBloc.userInfo != null &&
                //     //         loginBloc.userInfo!.accessToken.isNotEmpty) {
                //     //       Navigator.pushNamed(
                //     //           context, RouteNames.sendMessageScreen,
                //     //           arguments: agent.email);
                //     //     } else {
                //     //       Utils.showSnackBarWithLogin(context);
                //     //     }
                //     //   },
                //     //   bgColor: whiteColor,
                //     //   text: 'Message',
                //     //   icon: KImages.messageIcon,
                //     //   iconTextColor: blackColor,
                //     // ),
                //    GestureDetector(
                //      onTap: (){
                //        if (loginBloc.userInfo != null &&
                //                loginBloc.userInfo!.accessToken.isNotEmpty) {
                //
                //              // Navigator.pushNamed(
                //              //     context, RouteNames.sendMessageScreen,
                //              //     arguments: agent!.email);
                //            } else {
                //              Utils.showSnackBarWithLogin(context);
                //            }
                //      },
                //      child: Container(
                //        decoration: BoxDecoration(
                //          borderRadius: BorderRadius.circular(8.0),
                //          color: whiteColor
                //        ),
                //        child: Padding(
                //          padding: Utils.symmetric(h: 30.0, v: 10.0),
                //          child: Row(children: [
                //              const CustomImage(path: KImages.messageIcon),
                //              Utils.horizontalSpace(8.0),
                //              const CustomTextStyle(text: "Message",fontSize: 16.0,fontWeight: FontWeight.w500,),
                //          ],),
                //        ),
                //      ),
                //    ),
                //
                //     GestureDetector(
                //       onTap: ()async{
                //         if (loginBloc.userInfo != null &&
                //             loginBloc.userInfo!.accessToken.isNotEmpty) {
                //           //Uri uri = Uri(scheme: 'call', path: agent.phone);
                //           final android =
                //               "whatsapp://send?phone=${agent!.phone}&text=Hello, ${agent.name} ";
                //           final ios =
                //               "https://wa.me/${agent!.phone}?text=${Uri.parse('Hello, I need your help')}";
                //           final androidUrl = Uri.parse(android);
                //           final iosUrl = Uri.parse(ios);
                //           try {
                //             if (agent.phone.isNotEmpty) {
                //               if (Platform.isIOS) {
                //                 await launchUrl(iosUrl,
                //                 mode: LaunchMode.externalApplication);
                //               } else {
                //                 await launchUrl(androidUrl,
                //                 mode: LaunchMode.externalApplication);
                //               }
                //             } else {
                //               Utils.showSnackBar(
                //                   context, 'Phone number is not available');
                //             }
                //           } catch (e) {
                //             debugPrint('exception-occurred ${e.toString()}');
                //             getErrorMessage();
                //           }
                //         } else {
                //           Utils.showSnackBarWithLogin(context);
                //         }
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(8.0),
                //             color: const Color(0xFF00bc144),
                //         ),
                //         child: Padding(
                //           padding: Utils.symmetric(h: 30.0, v: 10.0),
                //           child: Row(children: [
                //             const CustomImage(path: KImages.whatsAppIcon,color: whiteColor,height: 20,),
                //             Utils.horizontalSpace(8.0),
                //             const CustomTextStyle(text: "What\'s App",fontSize: 16.0,fontWeight: FontWeight.w500,color: whiteColor,),
                //           ],),
                //         ),
                //       ),
                //     ),
                //
                //
                //     // ContactButton(
                //     //   onPressed: () async {
                //     //     if (loginBloc.userInfo != null &&
                //     //         loginBloc.userInfo!.accessToken.isNotEmpty) {
                //     //       //Uri uri = Uri(scheme: 'call', path: agent.phone);
                //     //       final android =
                //     //           "whatsapp://send?phone=${agent.phone}&text=Hello, ${agent.name} ";
                //     //       final ios =
                //     //           "https://wa.me/${agent.phone}?text=${Uri.parse('Hello, I need your help')}";
                //     //       final androidUrl = Uri.parse(android);
                //     //       final iosUrl = Uri.parse(ios);
                //     //       try {
                //     //         if (agent.phone.isNotEmpty) {
                //     //           if (Platform.isIOS) {
                //     //             await launchUrl(iosUrl,
                //     //                 mode: LaunchMode.externalApplication);
                //     //           } else {
                //     //             await launchUrl(androidUrl,
                //     //                 mode: LaunchMode.externalApplication);
                //     //           }
                //     //         } else {
                //     //           Utils.showSnackBar(
                //     //               context, 'Phone number is not available');
                //     //         }
                //     //       } catch (e) {
                //     //         debugPrint('exception-occurred ${e.toString()}');
                //     //         getErrorMessage();
                //     //       }
                //     //     } else {
                //     //       Utils.showSnackBarWithLogin(context);
                //     //     }
                //     //   },
                //     //   bgColor: const Color(0xFF0bc144),
                //     //   text: 'What\'s App',
                //     //   icon: KImages.whatsAppIcon,
                //     //   iconTextColor: whiteColor,
                //     // ),
                //   ],
                // ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

_bookingDialog(BuildContext context,String id,String property_id,String type) {
  final cubit = context.read<CreateInfoCubit>();
  const spacer = SizedBox(height: 10.0);
  TextEditingController nameCt = TextEditingController();
  TextEditingController emailCt = TextEditingController();
  TextEditingController phoneCt = TextEditingController();
  TextEditingController messageCt = TextEditingController();
  Utils.showCustomDialog(
    context,
    hp: 16.0,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextStyle(
                  text: 'Enquiry Now',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: blackColor,
                ),
                GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const CustomImage(path: KImages.cancelIcon))
              ],
            ),
             const SizedBox(height: 14.0),
            // const DateTimeView(),
            // spacer,
            // TextFormField(
            //   decoration: const InputDecoration(hintText: 'City'),
            //   keyboardType: TextInputType.name,
            // ),
            // spacer,
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name*'),
              keyboardType: TextInputType.name,
              controller: nameCt,
            ),
            spacer,
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email*'),
              keyboardType: TextInputType.emailAddress,
              controller: emailCt,
            ),
            spacer,
            TextFormField(
              decoration: const InputDecoration(hintText: 'Phone*'),
              keyboardType: TextInputType.phone,
              controller: phoneCt,
            ),
            spacer,
            TextFormField(
              decoration: const InputDecoration(hintText: 'Description*'),
              keyboardType: TextInputType.multiline,
              controller: messageCt,
              maxLines: 4,
            ),
            const SizedBox(height: 20.0),
            Text("All fields required*",style: TextStyle(fontSize: 10,color: Colors.red),),
            PrimaryButton(
                text: 'Enquiry Now',
                onPressed: () {

                  print({
                    "name":nameCt.text,
                    "email":emailCt.text,
                    "phone":phoneCt.text,
                    "message":messageCt.text,
                    "vendor_id":type == "vendor"? id:"0",
                    "property_id":property_id,

                  });
                  if(nameCt.text.isNotEmpty && emailCt.text.isNotEmpty && phoneCt.text.isNotEmpty && messageCt.text.isNotEmpty) {
                    cubit.contactUsProperty({
                    "name":nameCt.text,
                    "email":emailCt.text,
                    "phone":phoneCt.text,
                    "message":messageCt.text,
                     "vendor_id":type == "vendor"? id:"0",
                      "property_id":property_id,

                  });
                  }
                  Navigator.of(context).pop();},
                textColor: blackColor,
                fontSize: 20.0,
                borderRadiusSize: radius,
                bgColor: yellowColor)
          ],
        ),
      ),
    ),
  );
}
}

class ProjectDetailNavBar extends StatelessWidget {
  const ProjectDetailNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginBloc = context.read<LoginBloc>();
    void getErrorMessage() {
      return Utils.showSnackBar(context, 'WhatsApp is not installed yet!');
    }

    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is ProjectDetailsLoaded) {
          final agent = state.projectResponse.data!.vendor;
          final admin = state.projectResponse.data!.admin;
          return agent!=null ?
          Container(
            width: size.width,
            // height: 190.0,

            padding: const EdgeInsets.only(bottom: 15.0,top: 15),

            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Align(
                //   alignment: Alignment.center,
                //   child: GestureDetector(
                //     onTap: () {
                //       if (loginBloc.userInfo != null &&
                //           loginBloc.userInfo!.accessToken.isNotEmpty) {
                //         context.read<BookingCubit>().clear();
                //         Navigator.pushNamed(
                //             context, RouteNames.createBookingScreen);
                //       } else {
                //         Utils.showSnackBarWithLogin(context);
                //       }
                //     },
                //     // onTap: () => _bookingDialog(context),
                //     child: Container(
                //      // margin: const EdgeInsets.symmetric(horizontal: 20.0),
                //      //  padding: const EdgeInsets.symmetric(
                //      //      horizontal: 22.0, vertical: 12.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(color: whiteColor),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(4.0)),
                //       ),
                //       child: const CustomTextStyle(
                //         text: 'Booking',
                //         color: whiteColor,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 18.0,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: Utils.symmetric(h: 20.0),
                  child: PrimaryButton(
                      bgColor: yellowColor,
                      textColor: blackColor,
                      text: "Enquiry Now", onPressed: (){
                    if (loginBloc.userInfo != null &&
                        loginBloc.userInfo!.accessToken.isNotEmpty) {
                      context.read<BookingCubit>().clear();
                      _bookingDialog(context,agent!.id.toString() ,state.projectResponse.data!.project!.id.toString(),"vendor");
                    } else {
                      Utils.showSnackBarWithLogin(context);
                    }
                  }),
                ),



                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     // ContactButton(
                //     //   onPressed: () {
                //     //     if (loginBloc.userInfo != null &&
                //     //         loginBloc.userInfo!.accessToken.isNotEmpty) {
                //     //       Navigator.pushNamed(
                //     //           context, RouteNames.sendMessageScreen,
                //     //           arguments: agent.email);
                //     //     } else {
                //     //       Utils.showSnackBarWithLogin(context);
                //     //     }
                //     //   },
                //     //   bgColor: whiteColor,
                //     //   text: 'Message',
                //     //   icon: KImages.messageIcon,
                //     //   iconTextColor: blackColor,
                //     // ),
                //    GestureDetector(
                //      onTap: (){
                //        if (loginBloc.userInfo != null &&
                //                loginBloc.userInfo!.accessToken.isNotEmpty) {
                //
                //              // Navigator.pushNamed(
                //              //     context, RouteNames.sendMessageScreen,
                //              //     arguments: agent!.email);
                //            } else {
                //              Utils.showSnackBarWithLogin(context);
                //            }
                //      },
                //      child: Container(
                //        decoration: BoxDecoration(
                //          borderRadius: BorderRadius.circular(8.0),
                //          color: whiteColor
                //        ),
                //        child: Padding(
                //          padding: Utils.symmetric(h: 30.0, v: 10.0),
                //          child: Row(children: [
                //              const CustomImage(path: KImages.messageIcon),
                //              Utils.horizontalSpace(8.0),
                //              const CustomTextStyle(text: "Message",fontSize: 16.0,fontWeight: FontWeight.w500,),
                //          ],),
                //        ),
                //      ),
                //    ),
                //
                //     GestureDetector(
                //       onTap: ()async{
                //         if (loginBloc.userInfo != null &&
                //             loginBloc.userInfo!.accessToken.isNotEmpty) {
                //           //Uri uri = Uri(scheme: 'call', path: agent.phone);
                //           final android =
                //               "whatsapp://send?phone=${agent!.phone}&text=Hello, ${agent.name} ";
                //           final ios =
                //               "https://wa.me/${agent!.phone}?text=${Uri.parse('Hello, I need your help')}";
                //           final androidUrl = Uri.parse(android);
                //           final iosUrl = Uri.parse(ios);
                //           try {
                //             if (agent.phone.isNotEmpty) {
                //               if (Platform.isIOS) {
                //                 await launchUrl(iosUrl,
                //                 mode: LaunchMode.externalApplication);
                //               } else {
                //                 await launchUrl(androidUrl,
                //                 mode: LaunchMode.externalApplication);
                //               }
                //             } else {
                //               Utils.showSnackBar(
                //                   context, 'Phone number is not available');
                //             }
                //           } catch (e) {
                //             debugPrint('exception-occurred ${e.toString()}');
                //             getErrorMessage();
                //           }
                //         } else {
                //           Utils.showSnackBarWithLogin(context);
                //         }
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(8.0),
                //             color: const Color(0xFF00bc144),
                //         ),
                //         child: Padding(
                //           padding: Utils.symmetric(h: 30.0, v: 10.0),
                //           child: Row(children: [
                //             const CustomImage(path: KImages.whatsAppIcon,color: whiteColor,height: 20,),
                //             Utils.horizontalSpace(8.0),
                //             const CustomTextStyle(text: "What\'s App",fontSize: 16.0,fontWeight: FontWeight.w500,color: whiteColor,),
                //           ],),
                //         ),
                //       ),
                //     ),
                //
                //
                //     // ContactButton(
                //     //   onPressed: () async {
                //     //     if (loginBloc.userInfo != null &&
                //     //         loginBloc.userInfo!.accessToken.isNotEmpty) {
                //     //       //Uri uri = Uri(scheme: 'call', path: agent.phone);
                //     //       final android =
                //     //           "whatsapp://send?phone=${agent.phone}&text=Hello, ${agent.name} ";
                //     //       final ios =
                //     //           "https://wa.me/${agent.phone}?text=${Uri.parse('Hello, I need your help')}";
                //     //       final androidUrl = Uri.parse(android);
                //     //       final iosUrl = Uri.parse(ios);
                //     //       try {
                //     //         if (agent.phone.isNotEmpty) {
                //     //           if (Platform.isIOS) {
                //     //             await launchUrl(iosUrl,
                //     //                 mode: LaunchMode.externalApplication);
                //     //           } else {
                //     //             await launchUrl(androidUrl,
                //     //                 mode: LaunchMode.externalApplication);
                //     //           }
                //     //         } else {
                //     //           Utils.showSnackBar(
                //     //               context, 'Phone number is not available');
                //     //         }
                //     //       } catch (e) {
                //     //         debugPrint('exception-occurred ${e.toString()}');
                //     //         getErrorMessage();
                //     //       }
                //     //     } else {
                //     //       Utils.showSnackBarWithLogin(context);
                //     //     }
                //     //   },
                //     //   bgColor: const Color(0xFF0bc144),
                //     //   text: 'What\'s App',
                //     //   icon: KImages.whatsAppIcon,
                //     //   iconTextColor: whiteColor,
                //     // ),
                //   ],
                // ),
              ],
            ),
          ):Container(
            width: size.width,
            // height: 190.0,

            padding: const EdgeInsets.only(bottom: 5.0,top: 5),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Align(
                //   alignment: Alignment.center,
                //   child: GestureDetector(
                //     onTap: () {
                //       if (loginBloc.userInfo != null &&
                //           loginBloc.userInfo!.accessToken.isNotEmpty) {
                //         context.read<BookingCubit>().clear();
                //         Navigator.pushNamed(
                //             context, RouteNames.createBookingScreen);
                //       } else {
                //         Utils.showSnackBarWithLogin(context);
                //       }
                //     },
                //     // onTap: () => _bookingDialog(context),
                //     child: Container(
                //      // margin: const EdgeInsets.symmetric(horizontal: 20.0),
                //      //  padding: const EdgeInsets.symmetric(
                //      //      horizontal: 22.0, vertical: 12.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(color: whiteColor),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(4.0)),
                //       ),
                //       child: const CustomTextStyle(
                //         text: 'Booking',
                //         color: whiteColor,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 18.0,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: Utils.symmetric(h: 20.0),
                  child: PrimaryButton(
                      bgColor: yellowColor,
                      textColor: blackColor,
                      text: "Enquiry Now", onPressed: (){
                    if (loginBloc.userInfo != null ) {
                      context.read<BookingCubit>().clear();
                      _bookingDialog(context,admin!.id.toString() ,state.projectResponse.data!.project!.id.toString(),"admin");
                    } else {
                      Utils.showSnackBarWithLogin(context);
                    }
                  }),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     // ContactButton(
                //     //   onPressed: () {
                //     //     if (loginBloc.userInfo != null &&
                //     //         loginBloc.userInfo!.accessToken.isNotEmpty) {
                //     //       Navigator.pushNamed(
                //     //           context, RouteNames.sendMessageScreen,
                //     //           arguments: agent.email);
                //     //     } else {
                //     //       Utils.showSnackBarWithLogin(context);
                //     //     }
                //     //   },
                //     //   bgColor: whiteColor,
                //     //   text: 'Message',
                //     //   icon: KImages.messageIcon,
                //     //   iconTextColor: blackColor,
                //     // ),
                //    GestureDetector(
                //      onTap: (){
                //        if (loginBloc.userInfo != null &&
                //                loginBloc.userInfo!.accessToken.isNotEmpty) {
                //
                //              // Navigator.pushNamed(
                //              //     context, RouteNames.sendMessageScreen,
                //              //     arguments: agent!.email);
                //            } else {
                //              Utils.showSnackBarWithLogin(context);
                //            }
                //      },
                //      child: Container(
                //        decoration: BoxDecoration(
                //          borderRadius: BorderRadius.circular(8.0),
                //          color: whiteColor
                //        ),
                //        child: Padding(
                //          padding: Utils.symmetric(h: 30.0, v: 10.0),
                //          child: Row(children: [
                //              const CustomImage(path: KImages.messageIcon),
                //              Utils.horizontalSpace(8.0),
                //              const CustomTextStyle(text: "Message",fontSize: 16.0,fontWeight: FontWeight.w500,),
                //          ],),
                //        ),
                //      ),
                //    ),
                //
                //     GestureDetector(
                //       onTap: ()async{
                //         if (loginBloc.userInfo != null &&
                //             loginBloc.userInfo!.accessToken.isNotEmpty) {
                //           //Uri uri = Uri(scheme: 'call', path: agent.phone);
                //           final android =
                //               "whatsapp://send?phone=${agent!.phone}&text=Hello, ${agent.name} ";
                //           final ios =
                //               "https://wa.me/${agent!.phone}?text=${Uri.parse('Hello, I need your help')}";
                //           final androidUrl = Uri.parse(android);
                //           final iosUrl = Uri.parse(ios);
                //           try {
                //             if (agent.phone.isNotEmpty) {
                //               if (Platform.isIOS) {
                //                 await launchUrl(iosUrl,
                //                 mode: LaunchMode.externalApplication);
                //               } else {
                //                 await launchUrl(androidUrl,
                //                 mode: LaunchMode.externalApplication);
                //               }
                //             } else {
                //               Utils.showSnackBar(
                //                   context, 'Phone number is not available');
                //             }
                //           } catch (e) {
                //             debugPrint('exception-occurred ${e.toString()}');
                //             getErrorMessage();
                //           }
                //         } else {
                //           Utils.showSnackBarWithLogin(context);
                //         }
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(8.0),
                //             color: const Color(0xFF00bc144),
                //         ),
                //         child: Padding(
                //           padding: Utils.symmetric(h: 30.0, v: 10.0),
                //           child: Row(children: [
                //             const CustomImage(path: KImages.whatsAppIcon,color: whiteColor,height: 20,),
                //             Utils.horizontalSpace(8.0),
                //             const CustomTextStyle(text: "What\'s App",fontSize: 16.0,fontWeight: FontWeight.w500,color: whiteColor,),
                //           ],),
                //         ),
                //       ),
                //     ),
                //
                //
                //     // ContactButton(
                //     //   onPressed: () async {
                //     //     if (loginBloc.userInfo != null &&
                //     //         loginBloc.userInfo!.accessToken.isNotEmpty) {
                //     //       //Uri uri = Uri(scheme: 'call', path: agent.phone);
                //     //       final android =
                //     //           "whatsapp://send?phone=${agent.phone}&text=Hello, ${agent.name} ";
                //     //       final ios =
                //     //           "https://wa.me/${agent.phone}?text=${Uri.parse('Hello, I need your help')}";
                //     //       final androidUrl = Uri.parse(android);
                //     //       final iosUrl = Uri.parse(ios);
                //     //       try {
                //     //         if (agent.phone.isNotEmpty) {
                //     //           if (Platform.isIOS) {
                //     //             await launchUrl(iosUrl,
                //     //                 mode: LaunchMode.externalApplication);
                //     //           } else {
                //     //             await launchUrl(androidUrl,
                //     //                 mode: LaunchMode.externalApplication);
                //     //           }
                //     //         } else {
                //     //           Utils.showSnackBar(
                //     //               context, 'Phone number is not available');
                //     //         }
                //     //       } catch (e) {
                //     //         debugPrint('exception-occurred ${e.toString()}');
                //     //         getErrorMessage();
                //     //       }
                //     //     } else {
                //     //       Utils.showSnackBarWithLogin(context);
                //     //     }
                //     //   },
                //     //   bgColor: const Color(0xFF0bc144),
                //     //   text: 'What\'s App',
                //     //   icon: KImages.whatsAppIcon,
                //     //   iconTextColor: whiteColor,
                //     // ),
                //   ],
                // ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  _bookingDialog(BuildContext context,String id,String property_id,String type) {
    final cubit = context.read<CreateInfoCubit>();
    const spacer = SizedBox(height: 10.0);
    TextEditingController nameCt = TextEditingController();
    TextEditingController emailCt = TextEditingController();
    TextEditingController phoneCt = TextEditingController();
    TextEditingController messageCt = TextEditingController();
    Utils.showCustomDialog(
      context,
      hp: 16.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextStyle(
                    text: 'Enquiry Now',
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: blackColor,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const CustomImage(path: KImages.cancelIcon))
                ],
              ),
              const SizedBox(height: 14.0),
              // const DateTimeView(),
              // spacer,
              // TextFormField(
              //   decoration: const InputDecoration(hintText: 'City'),
              //   keyboardType: TextInputType.name,
              // ),
              // spacer,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Name*'),
                keyboardType: TextInputType.name,
                controller: nameCt,
              ),
              spacer,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email*'),
                keyboardType: TextInputType.emailAddress,
                controller: emailCt,
              ),
              spacer,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Phone*'),
                keyboardType: TextInputType.phone,
                controller: phoneCt,
              ),
              spacer,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Description*'),
                keyboardType: TextInputType.multiline,
                controller: messageCt,
                maxLines: 4,
              ),
              const SizedBox(height: 20.0),
              Text("All fields required*",style: TextStyle(fontSize: 10,color: Colors.red),),
              PrimaryButton(
                  text: 'Send Message',
                  onPressed: () {

                    print({
                      "name":nameCt.text,
                      "email":emailCt.text,
                      "phone":phoneCt.text,
                      "message":messageCt.text,
                      "vendor_id":type == "vendor"? id:"0",
                      "project_id":property_id,

                    });
                    if(nameCt.text.isNotEmpty && emailCt.text.isNotEmpty && phoneCt.text.isNotEmpty && messageCt.text.isNotEmpty) {
                      cubit.contactUsProperty({
                        "name":nameCt.text,
                        "email":emailCt.text,
                        "phone":phoneCt.text,
                        "message":messageCt.text,
                        "vendor_id":type == "vendor"? id:"0",
                        "project_id":property_id,

                      });
                    }
                    Navigator.of(context).pop();},
                  textColor: blackColor,
                  fontSize: 20.0,
                  borderRadiusSize: radius,
                  bgColor: yellowColor)
            ],
          ),
        ),
      ),
    );
  }
}
