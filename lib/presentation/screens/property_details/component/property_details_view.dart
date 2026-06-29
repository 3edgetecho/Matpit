import 'dart:io';

import 'package:dio/dio.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:real_estate/data/data_provider/remote_url.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../state_inject_package_names.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';
import 'all_tabs/floor_plans_tab.dart';
import 'all_tabs/location_tab.dart';
import 'all_tabs/property_details_tab.dart';
import 'all_tabs/property_video_tab.dart';
import 'all_tabs/review_tab.dart';

class PropertyTextTabView extends StatefulWidget {
  const PropertyTextTabView({super.key});

  @override
  State<PropertyTextTabView> createState() => _PropertyTextTabViewState();
}

class _PropertyTextTabViewState extends State<PropertyTextTabView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: whiteColor,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      child: ExpandablePageView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    tabs.length,
                    (index) => GestureDetector(
                      onTap: () => setState(() => currentIndex = index),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: borderColor))),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 14.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: currentIndex == index
                                    ? primaryColor
                                    : transparent,
                              ),
                            ),
                          ),
                          child: CustomTextStyle(
                            text: tabs[index],
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color:
                                currentIndex == index ? blackColor : grayColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: pages[currentIndex],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final List<String> tabs = [
  'Property Details',
  'Floor Plans',
  'Property Video',
  'Location',

];

List<Widget> pages = [
  PropertyDetailsTab(),
  const FloorPlansTab(),
  const PropertyVideoTab(),
  const LocationTab(),

];


class ProjectTextTabView extends StatefulWidget {
  const ProjectTextTabView({super.key});

  @override
  State<ProjectTextTabView> createState() => _ProjectTextTabViewState();
}

class _ProjectTextTabViewState extends State<ProjectTextTabView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: whiteColor,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      child: ExpandablePageView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    tabs2.length,
                    (index) => GestureDetector(
                      onTap: () => setState(() => currentIndex = index),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: borderColor))),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 14.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: currentIndex == index
                                    ? primaryColor
                                    : transparent,
                              ),
                            ),
                          ),
                          child: CustomTextStyle(
                            text: tabs2[index],
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color:
                                currentIndex == index ? blackColor : grayColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: pages2[currentIndex],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> downloadAndOpenFile(String url) async {
  // Step 1: Request storage permission
  var status = await Permission.storage.request();
  if (!status.isGranted) {
    print("Storage permission denied");
    return;
  }

  try {
    // Step 2: Get Downloads directory
    Directory? downloadsDir;
    if (Platform.isAndroid) {
      downloadsDir = Directory('/storage/emulated/0/Download');
    } else if (Platform.isIOS) {
      downloadsDir = await getApplicationDocumentsDirectory();
    }

    // Step 3: Prepare file path
    String fileName = url.split('/').last;
    String fullPath = "${downloadsDir!.path}/$fileName";

    // Step 4: Start download using Dio
    Dio dio = Dio();
    await dio.download(
      url,
      fullPath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          print("Downloading: ${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );

    print("File downloaded to: $fullPath");

    // Step 5: Open the file
    final result = await OpenFile.open(fullPath);
    print("Open result: ${result.message}");

  } catch (e) {
    print("Download or open failed: $e");
  }
}

final List<String> tabs2 = [
  'Project Details',
  'Floor Plans',
  'Project Video',
  'Brochure',
  'Location',

];

List<Widget> pages2 = [
  ProjectDetailsTab(),
  const FloorPlansProjectTab(),
  const ProjectVideoTab(),
  BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
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
            //
            //
            //         KImages.videoImage),

            item.data!.project!.project_pdf!=null && item.data!.project!.project_pdf!.isNotEmpty ? DownloadButton(url: RemoteUrls.brochureURL+item.data!.project!.project_pdf!,):SizedBox(),
            // SizedBox(
            //   height: 230.0,
            //   width: 350.0,
            //   child: item.data!.project!.project_pdf!=null && item.data!.project!.project_pdf!.isNotEmpty ?
            //
            //   SfPdfViewer.network(RemoteUrls.brochureURL+item.data!.project!.project_pdf!):SizedBox(),
            // ),
            const SizedBox(height: 20.0),
          ],
        );
      }
      return const SizedBox.shrink();
    },
  ),
  const ProjectLocationTab(),

];

class DownloadButton extends StatefulWidget {
  final String url;
  const DownloadButton({required this.url, super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  double _progress = 0.0;
  bool _isDownloading = false;

  Future<void> downloadFile(String url) async {
    var status = await Permission.manageExternalStorage.request();
    if (!status.isGranted) return;

    setState(() {
      _isDownloading = true;
      _progress = 0.0;

    });

    print("_isDownloading=>$_isDownloading");
    print("_progress=>$_progress");

    try {
      String fileName = url.split('/').last;
      Directory? dir = Platform.isAndroid
          ? Directory('/storage/emulated/0/Download')
          : await getApplicationDocumentsDirectory();
      String fullPath = "${dir!.path}/$fileName";

      Dio dio = Dio();
      await dio.download(
        url,
        fullPath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _progress = received / total;
            });
          }
        },
      );

      setState(() {
        _isDownloading = false;
        _progress = 1.0;
      });

      await OpenFile.open(fullPath);
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isDownloading ? null : () => downloadFile(widget.url),
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  // Water-style progress fill
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: 200 * _progress,
                    height: 50,
                    color: Colors.blue.withOpacity(0.4),
                  ),
                  Center(
                    child: Text(
                      _isDownloading
                          ? "Downloading... ${(_progress * 100).toStringAsFixed(0)}%"
                          : "Download File",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
