import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:real_estate/data/model/product/project_list_response.dart';
import 'package:real_estate/data/model/product/property_list_response.dart';
import 'package:real_estate/logic/cubit/order/order_cubit.dart';
import 'package:http/http.dart' as http;

import '../../../data/data_provider/remote_url.dart';
import '../../../logic/cubit/create_property/cubit/update_cubit.dart';
import '../../../state_inject_package_names.dart';
import '../../utils/k_images.dart';
import '../../widget/custom_images.dart';
import '../../widget/empty_widget.dart';
import '../../widget/favorite_button.dart';
import '../home/component/agent_search.dart';
import '/presentation/utils/utils.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../../presentation/widget/primary_button.dart';
import '../../../data/model/agent/agent_profile_model.dart';
import '../../../logic/bloc/login/login_bloc.dart';
import '../../../logic/cubit/add_property/add_property_cubit.dart';
import '../../../logic/cubit/add_property/add_property_state_model.dart';
import '../../../logic/cubit/profile/profile_cubit.dart';
import '../../../logic/cubit/profile/profile_state_model.dart';
import '../../router/route_names.dart';
import '../../widget/loading_widget.dart';
import '../../widget/page_refresh.dart';
import 'component/person_information.dart';
import 'component/person_single_property.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProjectScreen> {
  ProjectListResponse projectListResponse = ProjectListResponse();
  @override
  void initState() {
    Future.microtask(() => context.read<ProfileCubit>().getMyProject());
    Future.microtask(() => context.read<ProfileCubit>().getAgentDashboardInfo());

    // SharedPreferences.getInstance().then((value) {
    //
    //   String userID = value.getString("user_id")??"";
    //   setState(() {
    //     fetchAndSaveProject(userId: userID);
    //   });
    // },);

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final loginBloc = context.read<LoginBloc>();
    final order = context.read<OrderCubit>();
    //profileCubit.getAgentProfile();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: PageRefresh(
        onRefresh: () async => profileCubit.getMyProperty(),
        child: MultiBlocListener(
          listeners: [

            BlocListener<AddPropertyCubit, AddPropertyModel>(
              listener: (context, state) {
                final updateState = state.addState;
                if (updateState is AddPropertyLoaded) {
                  profileCubit.getMyProperty();
                }
              },
            ),
          ],
          child: BlocConsumer<ProfileCubit, ProfileStateModel>(
            listener: (context, state) {

            },
            builder: (context, state) {
              final profileState = state.profileState;
              if (profileState is ProfileLoading) {
                return const LoadingWidget();
              } else if (profileState is ProfileError) {
                if (profileCubit.projectListResponse!=null) {
                  return ProfileLoadedWidget(
                      propertyListResponse: profileCubit.projectListResponse??null,);
                } else {
                  return Center(
                      child: CustomTextStyle(
                          text: profileState.message, color: redColor));
                }
              }
              // } else if (profileState is ProfileLoaded) {
              //   return ProfileLoadedWidget(properties: profileState.profile,propertyListResponse: profileState.,);
              // }
              print(jsonEncode(profileCubit.agentDetailModel ));
              if ( profileCubit.projectListResponse!=null) {

                return ProfileLoadedWidget(
                    propertyListResponse: profileCubit.projectListResponse!,);
              } else {
                return const Center(
                    child: CustomTextStyle(
                        text: 'Something went wrong', color: redColor));
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<ProfileCubit, ProfileStateModel>(
        builder: (context, state) {
          final profileState = state.profileState;
          if (profileState is ProfileLoading) {
            return const SizedBox.shrink();
          } else if (profileState is ProfileLoaded) {
            return Container(
              height: size.height * 0.12,
              width: size.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 34.0, vertical: 20.0),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: PrimaryButton(
                text: 'Create New Property',
                onPressed: () {
                  Navigator.pushNamed(
                      context, RouteNames.choosePropertyOptionScreen);

                },
                bgColor: yellowColor,
                borderRadiusSize: radius,
                textColor: blackColor,
                fontSize: 20.0,
              ),
            );
          }
          if (profileCubit.agentDetailModel != null) {
            return Container(
            //  height: size.height * 0.12,
              width: size.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 34.0, vertical: 20.0),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: PrimaryButton(
                text: 'Add New Project',
                onPressed: () {
                  Navigator.pushNamed(
                      arguments: "",
                      context, RouteNames.newProjectCreateScreen);
                },
                bgColor: yellowColor,
                borderRadiusSize: radius,
                textColor: blackColor,
                fontSize: 20.0,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class ProfileLoadedWidget extends StatelessWidget {
  const ProfileLoadedWidget({super.key, required this.propertyListResponse});


  final ProjectListResponse? propertyListResponse;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // if (properties.properties == null) {
    //   print('null');
    // } else {
    //   print('not null');
    // }
    return ListView(
      clipBehavior: Clip.none,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    CustomTextStyle(
                      text: 'My Project List',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: blackColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10,),
        if (propertyListResponse != null) ...[
          PersonSingleProperty2(properties: propertyListResponse!.data!.projects!.data!),
        ],
        SizedBox(height: size.height * 0.07),
      ],
    );
  }
}



class PersonSingleProperty2 extends StatefulWidget {
  const PersonSingleProperty2({super.key, required this.properties});

  final List<ProjectData> properties;

  @override
  State<PersonSingleProperty2> createState() => _PersonSinglePropertyState();
}

class _PersonSinglePropertyState extends State<PersonSingleProperty2> {

  String _searchQuery = ''; // To track the current search query
  late List<ProjectData> _filteredAgents; // To store filtered agents

  @override
  void initState() {
    super.initState();
    _filteredAgents = widget.properties; // Initially, all agents are shown
  }

  // Method to filter the agents based on the search query
  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();

      _filteredAgents = widget.properties.where((agent) {
        // Check if any of the propertyContents contains the search query
        return agent.proejctContents != null &&
            agent.proejctContents!.any((content) =>
                content.title!.toLowerCase().contains(_searchQuery));
      }).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: Utils.symmetric(h: 6.0),
          child: AgentSearch(onSearchChanged: _onSearchChanged),
        ),
        _filteredAgents.isEmpty
            ? Container(
          alignment: Alignment.center,
          child: const EmptyWidget(
              icon: KImages.emptyProperty, title: 'No Project Found!'),
        ) : ListView.builder(
            itemCount: _filteredAgents.length,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final result = _filteredAgents[index];
              return GestureDetector(
                onTap: () {

                  Navigator.pushNamed(
                      context, RouteNames.projectDetailsScreen,
                      arguments: result.id.toString());

                },
                child: Container(
                  //height: 200.0.h,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 140.0.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: borderRadius,
                                child: Stack(
                                  // fit: StackFit.expand,
                                  children: [
                                    Image.network(

                                      RemoteUrls.projectFeatureURL+result.featuredImage!,
                                      height: 140.0,
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
                                          height: 140,
                                          width: 140,
                                          fit: BoxFit.fill,
                                        );
                                      },
                                    ),
                                    Positioned(
                                      top: 8.0,
                                      left: 8.0,
                                      child: FavoriteButton(
                                          id: result.id.toString()),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0,top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomTextStyle(
                                          text: Utils.formatPrice(context,
                                              result.minPrice!),
                                          color: primaryColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18.0,
                                        ),
                                        CustomTextStyle(
                                          text: " - ",
                                          color: grayColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                        ),
                                        CustomTextStyle(
                                          text: Utils.formatPrice(context,
                                              result.maxPrice!),
                                          color: primaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.0,
                                        ),
                                        // CustomTextStyle(
                                        //   text: result.rentPeriod.isNotEmpty
                                        //       ? '/${result.rentPeriod}'
                                        //       : result.rentPeriod,
                                        //   color: grayColor,
                                        //   fontWeight: FontWeight.w400,
                                        //   fontSize: 14.0,
                                        // ),
                                      ],
                                    ),
                                    SizedBox(height: 6,),
                                    CustomTextStyle(
                                      text: result.proejctContents![0].title!,
                                      color: blackColor,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.left,
                                      fontSize: 18.0,
                                      maxLine: 2,
                                      height: 1.2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 6,),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        const CustomImage(
                                            path: KImages.locationIcon),
                                        const SizedBox(width: 6.0),
                                        Flexible(
                                          child: CustomTextStyle(
                                            text: result.proejctContents![0].address??"",
                                            color: grayColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.0,
                                            maxLine: 2,
                                            height: 1.2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        // ConstrainedBox(
                                        //   constraints: const BoxConstraints(
                                        //       maxHeight: 40.0, maxWidth: 190.0),
                                        //   child: CustomTextStyle(
                                        //     text: result.address,
                                        //     color: grayColor,
                                        //     fontWeight: FontWeight.w400,
                                        //     fontSize: 12.0,
                                        //     maxLine: 2,
                                        //     overflow: TextOverflow.ellipsis,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 16.0, bottom: 10.0, left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // CustomTextStyle(text: 'Status'),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 6.0),
                              decoration: BoxDecoration(
                                color: result.approveStatus.toString() == '1'
                                    ? greenColor
                                    : Colors.orange,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: CustomTextStyle(
                                text: result.approveStatus.toString() == '1'
                                    ? 'Active'
                                    : 'Pending',
                                color: whiteColor,
                                fontSize: 16.0,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // context.read<PropertyCreateBloc>().add(
                                    //       PropertyEditInfoEvent(
                                    //         propertyId: result.id.toString(),
                                    //       ),
                                    //     );
                                    // Navigator.pushNamed(
                                    //     context, RouteNames.updateScreen,
                                    //     arguments: result.id.toString());
                                    Navigator.pushNamed(context,
                                        RouteNames.newProjectCreateScreen,
                                        arguments: result.id.toString());
                                  },
                                  child: const EditBtn(),
                                ),
                                const SizedBox(width: 16.0),
                                DeleteBtn(
                                    id: result.id.toString(),
                                    status: result.status.toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}

class EditBtn extends StatelessWidget {
  const EditBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: blackColor,
        borderRadius: borderRadius,
      ),
      child: const CustomImage(
        path: KImages.editIcon,
        color: whiteColor,
      ),
    );
  }
}

class DeleteBtn extends StatelessWidget {
  const DeleteBtn({super.key, required this.id, required this.status});

  final String id;
  final String status;

  @override
  Widget build(BuildContext context) {
    final updateCubit = context.read<UpdateCubit>();
    if (status == 'enable') {}
    return BlocListener<UpdateCubit, UpdateState>(
      listenWhen: (context, state) => status == 'enable',
      listener: (context, state) {
        if (state is DeletePropertyLoading) {
          Utils.loadingDialog(context);
        } else {
          Utils.closeDialog(context);
          if (state is PropertyDeleteSuccess) {
            // Navigator.of(context).pop();
            Utils.showSnackBar(context, state.message);
          } else if (state is UpdateStateDeleteError) {
            if (state.statusCode == 403) {
              Utils.closeDialog(context);
            }
            Utils.errorSnackBar(context, state.errorMessage);
          }
        }
      },
      child: GestureDetector(
        onTap: () {
          if (status == 'enable') {
            showDialog<void>(
              context: context,
              barrierDismissible: true,
              // false = user must tap button, true = tap outside dialog
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: const CustomTextStyle(
                    text: 'Confirmation',
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                  ),
                  content: const CustomTextStyle(
                    text: 'Do you want to delete this property?',
                    fontSize: 16.0,
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const CustomTextStyle(
                        text: 'Cancel',
                        color: blackColor,
                      ),
                      onPressed: () {
                        Navigator.of(dialogContext)
                            .pop(); // Dismiss alert dialog
                      },
                    ),
                    TextButton(
                      child: const CustomTextStyle(
                        text: 'Delete',
                        color: redColor,
                      ),
                      onPressed: () {
                        updateCubit.deleteProperty(id);
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            Utils.showSnackBar(
                context, "This is not Approved property so you can't Delete");
          }
        },
        child: Container(
          height: 40.0,
          width: 40.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: redColor,
            borderRadius: borderRadius,
          ),
          child: const Icon(
            Icons.delete_outline_outlined,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
