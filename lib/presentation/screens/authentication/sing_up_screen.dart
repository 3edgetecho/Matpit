import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../../logic/bloc/signup/sign_up_bloc.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/utils/k_images.dart';
import '../../../../presentation/widget/custom_images.dart';
import '../../../../presentation/widget/primary_button.dart';
import '../../../data/data_provider/remote_url.dart';
import '../../../data/model/city_response.dart';
import '../../../data/model/state_response.dart';
import '../../../logic/cubit/setting/app_setting_cubit.dart';
import '../../router/route_names.dart';
import '../../utils/utils.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/error_text.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final String subTitle =
      "Are you want to Buy New house,\nPlease Create account & Inter New House";
  bool isShow = true;
  bool isShowConfirm = true;
  String selectValue = "User";
  States? selectState;
  Cities? selectCity;
  List<States> stateListData = [];
  List<Cities> cityListData = [];
  final TextEditingController userController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  void showPassword() {
    setState(() {
      isShow = !isShow;
    });
  }

  void showConfirmPassword() {
    setState(() {
      isShowConfirm = !isShowConfirm;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchStates();

    setState(() {

    });
  }
  final spacer = const SizedBox(height: 18.0);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<SignUpBloc>();
    final appSetting =
        context.read<AppSettingCubit>().settingModel!.mobileAppContent;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: BlocListener<SignUpBloc, SignUpModelState>(
          listenWhen: (previous, current) {
            return previous.state != current.state;
          },
          listener: (context, state) {
            final myState = state.state;
            if (myState is SignUpStateFormError) {
              Utils.errorSnackBar(context, myState.errorMsg);
            }
            // else if (state.state is SignUpStateFormError) {
            //   final status = state.state as SignUpStateFormError;
            //   Utils.showSnackBar(context, status.errorMsg);
            // }
            else if (myState is SignUpStateLoaded) {
              final loadedData = state.state as SignUpStateLoaded;
              // Navigator.pushNamedAndRemoveUntil(
              //     context, RouteNames.verificationScreen, (route) => false,
              //     arguments: true);
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.loginScreen, (route) => true);

              Utils.showSnackBar(context, loadedData.msg);
            } else if (state.state is AccountActivateSuccess) {
              final messageState = state.state as AccountActivateSuccess;
              Utils.showSnackBar(context, messageState.msg);
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.loginScreen, (route) => true);
            }
          },
          child: SizedBox(
            height: size.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomImage(
                  path: RemoteUrls.imageUrl(appSetting.loginBgImage) ??
                      KImages.signUpBackgroundImage,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  top: size.height * 0.14,
                  // left: size.width * 0.05,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextStyle(
                            text: 'Create Account',
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0,
                            color: whiteColor,
                          ),
                          const SizedBox(height: 5.0),
                          CustomTextStyle(
                            text: subTitle,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            height: 1.8,
                            color: whiteColor,
                          ),
                          SizedBox(height: size.height * 0.04),
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            // buildWhen: (previous, current) =>
                            //     previous.password != current.password,
                            builder: (context, state) {
                              final s = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  DropdownButtonFormField<String>(
                                    isDense: true,
                                    isExpanded: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: borderColor,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: borderColor),
                                      ),
                                    ),
                                    value: selectValue,
                                    hint: const CustomTextStyle(
                                      text: 'Type',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                    ),
                                    icon: const Icon(Icons.keyboard_arrow_down_sharp, color: blackColor),
                                    items: ["User","Vendor"]
                                        .map<DropdownMenuItem<String>>(
                                          (e) => DropdownMenuItem(
                                        value: e,
                                        child: CustomTextStyle(
                                          text: e,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    )
                                        .toList(),
                                    onChanged: (val) {
                                      selectValue = val!;
                                      bloc.add(SignUpEventType(val.toLowerCase()));

                                      setState(() {

                                      });
                                    },
                                  ),
                                  spacer,
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    initialValue: state.name,
                                    onChanged: (value) =>
                                        bloc.add(SignUpEventName(value)),
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          credentialIcon(KImages.userIcon),
                                      hintText: 'your name',
                                    ),
                                  ),
                                  //Utils.verticalSpace(6),
                                  if (s is SignUpStateLoadedError) ...[
                                    if (s.errors.name.isNotEmpty)
                                      ErrorText(text: s.errors.name.first),
                                  ],
                                  spacer,
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    initialValue: state.name,
                                    onChanged: (value) =>
                                        bloc.add(SignUpEventUserName(value)),
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          credentialIcon(KImages.userIcon),
                                      hintText: 'your username',
                                    ),
                                  ),
                                  //Utils.verticalSpace(6),
                                  if (s is SignUpStateLoadedError) ...[
                                    if (s.errors.username.isNotEmpty)
                                      ErrorText(text: s.errors.username.first),
                                  ]
                                ],
                              );
                            },
                          ),
                          spacer,
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            builder: (context, state) {
                              final s = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    initialValue: state.email,
                                    onChanged: (value) =>
                                        bloc.add(SignUpEventEmail(value)),
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          credentialIcon(KImages.emailIcon),
                                      hintText: 'your email address',
                                    ),
                                  ),
                                  if (state.name.isNotEmpty)
                                    if (s is SignUpStateLoadedError) ...[
                                      if (s.errors.email.isNotEmpty)
                                        ErrorText(text: s.errors.email.first),
                                    ]
                                ],
                              );
                            },
                          ),
                          spacer,
                          DropdownButtonFormField<States>(
                            isDense: true,
                            isExpanded: true,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: borderColor,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),
                            ),
                            value: selectState,
                            hint: const CustomTextStyle(
                              text: 'Select State',
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                            ),
                            icon: const Icon(Icons.keyboard_arrow_down_sharp, color: blackColor),
                            items: stateListData
                                .map<DropdownMenuItem<States>>(
                                  (e) => DropdownMenuItem(
                                value: e,
                                child: CustomTextStyle(
                                  text: e.name!,
                                  fontSize: 16.0,
                                ),
                              ),
                            )
                                .toList(),
                            onChanged: (val) {
                              selectState = val!;
                              bloc.add(SignUpEventState(val.name!));

                              selectCity = null;

                              fetchCities(val!.stateId.toString());

                              setState(() {

                              });
                            },
                          ),
                          spacer,
                          DropdownButtonFormField<Cities>(
                            isDense: true,
                            isExpanded: true,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: borderColor,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor),
                              ),
                            ),
                            value: selectCity,
                            hint: const CustomTextStyle(
                              text: 'Select City',
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                            ),
                            icon: const Icon(Icons.keyboard_arrow_down_sharp, color: blackColor),
                            items: cityListData
                                .map<DropdownMenuItem<Cities>>(
                                  (e) => DropdownMenuItem(
                                value: e,
                                child: CustomTextStyle(
                                  text: e.name!,
                                  fontSize: 16.0,
                                ),
                              ),
                            )
                                .toList(),
                            onChanged: (val) {
                              selectCity = val!;
                              bloc.add(SignUpEventCity(val.name!));

                            //  fetchCities(val!.c.toString());

                              setState(() {

                              });
                            },
                          ),
                          spacer,
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            builder: (context, state) {
                              final s = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    initialValue: state.phone,
                                    onChanged: (value) =>
                                        bloc.add(SignUpEventPhone(value)),
                                    //obscureText: isShow,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                        credentialIcon(KImages.phoneIcon,),
                                        hintText: 'Phone no.',
                                       ),
                                  ),
                                  if (state.email.isNotEmpty &&
                                      state.phone == '')
                                    if (s is SignUpStateLoadedError) ...[
                                      if (s.errors.phone.isNotEmpty)
                                        ErrorText(text: s.errors.phone.first),
                                    ]
                                ],
                              );
                            },
                          ),
                          spacer,
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            builder: (context, state) {
                              final s = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    initialValue: state.password,
                                    onChanged: (value) =>
                                        bloc.add(SignUpEventPassword(value)),
                                    obscureText: isShow,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            credentialIcon(KImages.lockIcon),
                                        hintText: 'Password',
                                        suffixIcon: IconButton(
                                          splashRadius: 20.0,
                                          onPressed: showPassword,
                                          icon: Icon(
                                            isShow
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: grayColor,
                                            size: 20.0,
                                          ),
                                        )),
                                  ),
                                  if (state.email.isNotEmpty &&
                                      state.passwordConfirmation == '')
                                    if (s is SignUpStateLoadedError) ...[
                                      if (s.errors.password.isNotEmpty)
                                        ErrorText(text: s.errors.password.first),
                                    ]
                                ],
                              );
                            },
                          ),
                          spacer,
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            builder: (context, state) {
                              final s = state.state;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    initialValue: state.passwordConfirmation,
                                    onChanged: (value) => bloc
                                        .add(SignUpEventPasswordConfirm(value)),
                                    obscureText: isShowConfirm,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            credentialIcon(KImages.lockIcon),
                                        hintText: 'Confirm Password',
                                        suffixIcon: IconButton(
                                          splashRadius: 20.0,
                                          onPressed: showConfirmPassword,
                                          icon: Icon(
                                            isShowConfirm
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: grayColor,
                                            size: 20.0,
                                          ),
                                        )),
                                  ),
                                  if (state.password.isNotEmpty)
                                    if (s is SignUpStateLoadedError) ...[
                                      if (s.errors.password.isNotEmpty)
                                        ErrorText(text: s.errors.password.first),
                                    ]
                                ],
                              );
                            },
                          ),
                          spacer,
                          BlocBuilder<SignUpBloc, SignUpModelState>(
                            builder: (context, state) {
                              if (state.state is SignUpStateLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return PrimaryButton(
                                onPressed: () {
                                  Utils.closeKeyBoard(context);
                                  bloc.add(SignUpEventSubmit());
                                },
                                text: 'Sign Up',
                                borderRadiusSize: 5.0,
                              );
                            },
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomTextStyle(
                                text: "Already have an account? ",
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                                color: whiteColor,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, RouteNames.loginScreen),
                                child: const CustomTextStyle(
                                  text: "Login",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.0,
                                  color: yellowColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: size.height * 0.03,
                //   right: size.width * 0.05,
                //   child: Utils.defaultIcon(context),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> fetchStates() async {
    final url = Uri.parse("${RemoteUrls.rootUrl2}get-states");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

        List data = jsonData['states'];
        stateListData = data.map((item) => States.fromJson(item)).toList();
        setState(() {

        });

    } else {
      throw Exception("Failed to load states");
    }
  }

  Future<void> fetchCities(String id) async {
    final url = Uri.parse("${RemoteUrls.rootUrl2}get-cities?state_id=$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

        List data = jsonData['cities'];
        cityListData = data.map((item) => Cities.fromJson(item)).toList();
        setState(() {

        });

    } else {
      throw Exception("Failed to load states");
    }
  }
}
