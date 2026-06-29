import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../logic/bloc/login/login_bloc.dart';
import '../../../logic/cubit/profile/profile_cubit.dart';
import '../../../logic/cubit/setting/app_setting_cubit.dart';
import '../../router/route_names.dart';
import 'components/setting_error_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appSettinBloc = context.read<AppSettingCubit>();
    final loginBloc = context.read<LoginBloc>();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Splash'),
      // ),
      body: BlocConsumer<AppSettingCubit, AppSettingState>(
        listener: (context, state) {
          if (state is AppSettingStateLoaded) {
            if (loginBloc.isLogedIn) {
              context.read<ProfileCubit>().getAgentProfile();
              context.read<ProfileCubit>().getAgentDashboardInfo();
              Navigator.pushReplacementNamed(
                  context, RouteNames.mainPageScreen);
            } else if (appSettinBloc.isOnBoardingShown) {
              Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
            } else {
              Navigator.pushReplacementNamed(
                  context, RouteNames.onBoardingScreen);
            }
          }
        },
        builder: (context, state) {
          if (state is AppSettingStateError) {
            return SettingErrorWidget(message: state.meg);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 80.0),
              //   child: CustomImage(
              //     path: KImages.laqqarIogo,
              //   ),
              // ),
              Center( child: Image.asset( KImages.logo,
              height: 90,
                width: 90,
              )),
              // SizedBox(height: 5.0),
              // Text(
              //   'Homec',
              //   style: TextStyle(
              //       color: whiteColor,
              //       fontSize: 30.0,
              //       fontWeight: FontWeight.w600),
              // )
            ],
          );
        },
      ),
    );
  }
}
