import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:real_estate/data/data_provider/remote_url.dart';
import 'package:real_estate/logic/bloc/login/login_bloc.dart';
import 'package:real_estate/presentation/router/route_names.dart';

import '../../../../data/model/agent/agent_profile_model.dart';
import '../../../../data/model/auth/user_profile_model.dart';
import '../../../../logic/cubit/profile/profile_cubit.dart';
import '../../../../logic/cubit/profile/profile_state_model.dart';
import '../../../../logic/cubit/setting/app_setting_cubit.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';

class PersonInformation extends StatelessWidget {
  const PersonInformation({super.key, required this.properties});
  final AgentProfileModel properties;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final List<Map<String, String>> propertyList = [
    //   {"number": '20', "title": 'Property'},
    //   {"number": '330', "title": 'Total Sell'},
    //   {"number": '40', "title": 'Apartment'},
    // ];
    // final profile = context.read<LoginBloc>().userInfo!.user;
    // print('proffffff ${profile.address}');
    final profileCubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileStateModel>(
      builder: (context, state) {
        final profile = state.profileState;
        if (profile is AgentProfileLoaded) {
          print(jsonEncode(properties));
          return ProfileInLoaded(profile: profile.users!,properties: properties,);
        }
        print(jsonEncode(profileCubit.users));
        return ProfileInLoaded(profile: profileCubit.users,properties: properties,);
      },
    );
  }
}

class ProfileInLoaded extends StatelessWidget {
  const ProfileInLoaded({super.key, required this.profile, required this.properties});
  final UserProfileModel? profile;
  final AgentProfileModel? properties;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final appSetting = context.read<AppSettingCubit>();
    final image = profile!=null && profile!.image!=null && profile!.image!.isNotEmpty
        ? profile!.image
        : "";

    return SizedBox(
      height: size.height * 0.30,
      width: size.width,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            child: CustomImage(
              path: KImages.profileBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20.0,
            left: 10.0,
            child: Row(
              children: [
                //const SizedBox(width: 10.0),
                GestureDetector(
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
                const SizedBox(width: 10.0),
                const CustomTextStyle(
                  text: 'Profile',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: whiteColor,
                )
              ],
            ),
          ),
          Positioned.fill(
              top: -size.height / 120.0,
              left: 10.0,
              right: 0.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: ClipOval(
                      child: Image.network(
                         RemoteUrls.imageUrl(image!),
                        height: size.height * 0.14,
                        width: size.height * 0.14,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            height: size.height * 0.14,
                            width: size.height * 0.14,
                            child: Center(
                              child: LoadingAnimationWidget.inkDrop(
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            'https://cdn-icons-png.flaticon.com/512/4042/4042356.png', // Apni placeholder image ka path yahan dein
                            height: size.height * 0.14,
                            width: size.height * 0.14,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                        text:  properties!.vendorInfo!.name.toString()??"",
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const CustomImage(
                            path: KImages.locationIcon,
                            color: whiteColor,
                          ),
                          const SizedBox(width: 6.0),
                          CustomTextStyle(
                            text:
                                properties!.vendorInfo!.address??","
                                ,
                            color: whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const CustomImage(
                            path: KImages.callIcon,
                            color: whiteColor,
                            height: 12.0,
                            width: 12.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 6.0),
                          CustomTextStyle(
                            text: properties!.phone??'',
                            color: whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )),
          Positioned(
            right: size.width * 0.01,
            top: size.height * 0.01,
           /* child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0)
              ),
              height: 50.0,
              width: 50.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: const CustomImage(path: KImages.defaultImage, fit: BoxFit.cover,)),
            ),*/
            child: ElevatedButton.icon(
              //onPressed: () => messageDialog(context),
              onPressed: () => Navigator.pushNamed(
                  context, RouteNames.updateProfileScreen,
                  arguments: profile),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(100.0, 40.0)),
                backgroundColor: MaterialStateProperty.all(yellowColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
                elevation: MaterialStateProperty.all(0.0),
                shadowColor: MaterialStateProperty.all(transparent),
                splashFactory: NoSplash.splashFactory,
              ),
              icon: const CustomImage(
                path: KImages.settingIcon03,
                color: blackColor,
              ),
              label: const CustomTextStyle(
                text: 'Edit',
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: blackColor,
              ),
            ),
          ),
          Positioned(
            bottom: -20.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: Utils.all(value: 10.0),
                    // height: 66,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: whiteColor
                    ),
                    child:  Column(children: [
                      CustomTextStyle(text: properties!.totalProperties.toString(), fontSize: 18,fontWeight: FontWeight.w600,),
                      const CustomTextStyle(text: 'Property', fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7E8BA0),),
                    ],),
                  ),

                  Container(
                    padding: Utils.all(value: 10.0),
                    // height: 66,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: whiteColor
                    ),
                    child:  Column(children: [
                      CustomTextStyle(text:properties!.totalProjects.toString(), fontSize: 18,fontWeight: FontWeight.w600,),
                      const CustomTextStyle(text: 'Total Project', fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7E8BA0),),
                    ],),
                  ),
                  Container(
                    padding: Utils.all(value: 10.0),
                    // height: 66,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: whiteColor
                    ),
                    child:  Column(children: [
                      CustomTextStyle(text:properties!.totalAgents.toString(), fontSize: 18,fontWeight: FontWeight.w600,),
                      const CustomTextStyle(text: 'Total Agent', fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF7E8BA0),),
                    ],),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget propertiesCount(int count, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextStyle(
            text: count.toString().padLeft(2, '0'),
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: blackColor),
        const SizedBox(height: 5.0),
        CustomTextStyle(
            text: title,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: grayColor),
      ],
    );
  }
}
