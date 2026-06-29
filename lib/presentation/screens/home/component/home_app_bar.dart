import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/generated/assets.dart';

import '../../../../data/data_provider/remote_url.dart';
import '../../../../logic/bloc/login/login_bloc.dart';
import '../../../../logic/cubit/profile/profile_cubit.dart';
import '../../../router/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_images.dart';
import '../../../widget/custom_test_style.dart';
import '../../all_settings/all_settings_screen.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.logo, required this.image});

  final String logo;
  final String image;

  @override
  State<StatefulWidget> createState() =>_HomeAppBar();


}

class _HomeAppBar extends State<HomeAppBar> {

  String? cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCityName().then((city) {
      cityName = city;

      setState(() {

      });
      print('Current City: $city');
    });
  }
  @override
  Widget build(BuildContext context) {
    final login = context.read<LoginBloc>();
    final profile = context.read<ProfileCubit>();
    return Container(
      height: 80.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hey "+(login.userInfo!=null && login.userInfo!.user!=null ? login.userInfo!.user.userName??"":""),style: GoogleFonts.nunito(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700),),
              Text(cityName ?? (login.userInfo!=null && login.userInfo!.user!=null ? login.userInfo!.user.city??"Good":"Jodhpur"),style: GoogleFonts.nunito(fontSize: 13,color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w500),),
            ],
          ),

          Row(
            children: [
              login.userInfo!.type == "vendor" ?  GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                            context, RouteNames.premiumMembershipScreen);
                  // if (login.userInfo!.user. == 0) {
                  //   Navigator.pushNamed(
                  //       context, RouteNames.premiumMembershipScreen);
                  // } else {

                  // }
                },
                child: Image.asset(Assets.memberShipIcon,height: 35,),
              ):SizedBox(),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AllSettingScreen(isShowBack:true);
                  },));
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: whiteColor, width: 2.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/4042/4042356.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<String?> getCityName() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check location service
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 'Location services are disabled.';
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return '';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return '';
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Reverse geocoding to get address
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      return placemarks.first.locality; // ✅ This is your city
    }

    return 'City not found';
  }
}
