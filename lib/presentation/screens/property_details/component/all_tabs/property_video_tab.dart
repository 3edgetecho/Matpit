import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:real_estate/logic/cubit/home/cubit/property_details_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../utils/constraints.dart';

class PropertyVideoTab extends StatefulWidget {
  const PropertyVideoTab({super.key});

  @override
  State<PropertyVideoTab> createState() => _PropertyVideoTabState();
}

class _PropertyVideoTabState extends State<PropertyVideoTab> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    initController();
  }

  initController() {
    controller = WebViewController();
  }

  String getVideoId(String id) {
    return "https://www.youtube.com/embed/$id";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoaded) {
          final item = state.singlePropertyModel;
          return Column(
            children: [
              // ReadMoreText(
              //   item!.property!.description!,
              //   trimLines: 4,
              //   trimCollapsedText: 'Read More',
              //   trimExpandedText: 'Show Less',
              //   trimLength: 180,
              //   moreStyle: GoogleFonts.poppins(
              //       fontSize: 14.0,
              //       fontWeight: FontWeight.w500,
              //       color: primaryColor),
              //   lessStyle: GoogleFonts.poppins(
              //       fontSize: 14.0,
              //       fontWeight: FontWeight.w500,
              //       color: primaryColor),
              //   textAlign: TextAlign.start,
              //   style: GoogleFonts.poppins(
              //       fontSize: 14.0,
              //       fontWeight: FontWeight.w400,
              //       color: grayColor),
              // ),
              // const SizedBox(height: 12.0),
              // CustomImage(path: KImages.videoImage),
              // CustomImage(
              //     path: RemoteUrls.imageUrl(item.videoThumbnail) ??
              //         KImages.videoImage),
              SizedBox(
                height: 300.0,
                width: double.infinity,
                child: item.property!.videoUrl!=null && item.property!.videoUrl!.isNotEmpty ?  WebViewWidget(
                  controller: controller
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..enableZoom(true)
                    ..loadRequest(Uri.parse(item.property!.videoUrl??"")),
                ):SizedBox(),
              ),
              const SizedBox(height: 20.0),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}



class ProjectVideoTab extends StatefulWidget {
  const ProjectVideoTab({super.key});

  @override
  State<ProjectVideoTab> createState() => _ProjectVideoTabState();
}

class _ProjectVideoTabState extends State<ProjectVideoTab> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    initController();
  }

  initController() {
    controller = WebViewController();
  }

  String getVideoId(String id) {
    return "https://www.youtube.com/embed/$id";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is ProjectDetailsLoaded) {
          final item = state.projectResponse;
          return Column(
            children: [
              // ReadMoreText(
              //   item!.property!.description!,
              //   trimLines: 4,
              //   trimCollapsedText: 'Read More',
              //   trimExpandedText: 'Show Less',
              //   trimLength: 180,
              //   moreStyle: GoogleFonts.poppins(
              //       fontSize: 14.0,
              //       fontWeight: FontWeight.w500,
              //       color: primaryColor),
              //   lessStyle: GoogleFonts.poppins(
              //       fontSize: 14.0,
              //       fontWeight: FontWeight.w500,
              //       color: primaryColor),
              //   textAlign: TextAlign.start,
              //   style: GoogleFonts.poppins(
              //       fontSize: 14.0,
              //       fontWeight: FontWeight.w400,
              //       color: grayColor),
              // ),
              // const SizedBox(height: 12.0),
              // CustomImage(path: KImages.videoImage),
              // CustomImage(
              //     path: RemoteUrls.imageUrl(item.videoThumbnail) ??
              //         KImages.videoImage),
              SizedBox(
                height: 230.0,
                width: 350.0,
                child: item.data!.project!.videolink!=null && item.data!.project!.videolink!.isNotEmpty ?  WebViewWidget(
                  controller: controller
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..enableZoom(true)
                    ..loadRequest(Uri.parse(item.data!.project!.videolink??"")),
                ):SizedBox(),
              ),
              const SizedBox(height: 20.0),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
