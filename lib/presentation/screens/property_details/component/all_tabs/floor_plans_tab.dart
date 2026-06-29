import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:real_estate/data/data_provider/remote_url.dart';

import '../../../../../logic/cubit/home/cubit/property_details_cubit.dart';
import '../../../../utils/constraints.dart';
import '../single_floor_structure.dart';

class FloorPlansTab extends StatelessWidget {
  const FloorPlansTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoaded) {
          final floors =state.singlePropertyModel.property!.floorPlanningImage??"";
          print(RemoteUrls.planningFeatureURL+floors);
          return SizedBox(
              height: 300,
              child: floors.isNotEmpty ? Image.network(RemoteUrls.planningFeatureURL+floors,
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

                    fit: BoxFit.fill,
                  );
                },
              ):SizedBox())

            /*ListView.builder(
            itemCount: floors!.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 20.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => *//*SingleFloorStructure(
              plan: floors[index],
              isExpand: index == 1 ? true : false,
            ),*//*
          )*/;
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class FloorPlansProjectTab extends StatelessWidget {
  const FloorPlansProjectTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is ProjectDetailsLoaded) {
          final floors =state.projectResponse.data!.project!.floorplanImages!;
          return

            ListView.builder(
            itemCount: floors!.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 20.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              print(RemoteUrls.floorPlanImageURL+floors![index].image.toString());
                return
                InkWell(
                  onTap: (){
                    openFullImage(context, RemoteUrls.floorPlanImageURL+floors![index].image.toString());
                  },
                  child: SingleFloorStructure2(
                    title: "Floor Plan ${index+1}",

                                image: RemoteUrls.floorPlanImageURL+floors![index].image.toString(),


                              ),
                );
            }
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}


class ProjectTypeTab extends StatelessWidget {
  const ProjectTypeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is ProjectDetailsLoaded) {
          final floors =state.projectResponse.data!.project!.projectTypeContents!;
          print("Length=>${floors!.length}");
          return

            ListView.builder(
            itemCount: floors!.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 20.0),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {

                return
                  ProjectTypeView(
                  title: floors[index],



            );
            }
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
