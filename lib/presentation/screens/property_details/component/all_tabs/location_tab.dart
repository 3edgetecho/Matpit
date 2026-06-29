import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:real_estate/presentation/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../logic/cubit/home/cubit/property_details_cubit.dart';
import '../../../../utils/constraints.dart';

class LocationTab extends StatefulWidget {
  const LocationTab({super.key});

  @override
  State<LocationTab> createState() => _LocationTabState();
}

class _LocationTabState extends State<LocationTab> {
  late WebViewController controller;
  LatLng? _location;
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    initController();
  }

  initController() {
    controller = WebViewController();
  }
  Future<void> _convertAddressToLatLng(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        setState(() {
          _location = LatLng(locations[0].latitude, locations[0].longitude);
        });
      }
    } catch (e) {
      print("Address not found: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoaded) {
          final item = state.singlePropertyModel.property!;
          _convertAddressToLatLng(item!.address!);
          String htmlString = '''
                  <!DOCTYPE html>
                  <html>
                    <body>
                      <iframe
                        width="100%"
                        height="500px"
                        frameborder="0"
                        style="border:0"
                        src="https://www.google.com/maps?q=${Uri.encodeComponent(item!.address!)}&output=embed"
                        allowfullscreen>
                      </iframe>
                    </body>
                  </html>
                  ''';
          // print('mapsssss ${Utils.htmlTextConverter(item!)}');
          return Column(
            children: [
              ReadMoreText(
                item!.address!,
                trimLines: 4,
                trimCollapsedText: 'Read More',
                trimExpandedText: 'Show Less',
                trimLength: 180,
                moreStyle: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
                lessStyle: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: grayColor),
              ),
              const SizedBox(height: 12.0),
              Container(
                height: 300.0,
                width: 600.0,
                alignment: Alignment.center,
                child:

                _location == null
                    ? Center(child: CircularProgressIndicator())
                    : GoogleMap(
                  onMapCreated: (controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _location!,
                    zoom: 15,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId("address_marker"),
                      position: _location!,
                      infoWindow: InfoWindow(title: "Your Address"),
                    )
                  },
                ),
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




class ProjectLocationTab extends StatefulWidget {
  const ProjectLocationTab({super.key});

  @override
  State<ProjectLocationTab> createState() => _ProjectLocationTab();
}

class _ProjectLocationTab extends State<ProjectLocationTab> {
  late WebViewController controller;
  LatLng? _location;
  late GoogleMapController mapController;


  @override
  void initState() {
    super.initState();
    initController();
  }

  Future<void> _convertAddressToLatLng(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        setState(() {
          _location = LatLng(locations[0].latitude, locations[0].longitude);
        });
      }
    } catch (e) {
      print("Address not found: $e");
    }
  }

  initController() {
    controller = WebViewController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is ProjectDetailsLoaded) {
          final item = state.projectResponse.data!.project!;
          _convertAddressToLatLng(item!.address!);
          String htmlString = '''
                  <!DOCTYPE html>
                  <html>
                    <body>
                      <iframe
                        width="100%"
                        height="500px"
                        frameborder="0"
                        style="border:0"
                        src="https://www.google.com/maps?q=${Uri.encodeComponent(item!.address!)}&output=embed"
                        allowfullscreen>
                      </iframe>
                    </body>
                  </html>
                  ''';
          // print('mapsssss ${Utils.htmlTextConverter(item!)}');
          return Column(
            children: [
              ReadMoreText(
                item!.address!,
                trimLines: 4,
                trimCollapsedText: 'Read More',
                trimExpandedText: 'Show Less',
                trimLength: 180,
                moreStyle: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
                lessStyle: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: grayColor),
              ),
              const SizedBox(height: 12.0),
              Container(
                height: 300.0,
                width: double.infinity,
                alignment: Alignment.center,
                child:

                _location == null
                    ? Center(child: CircularProgressIndicator())
                    : GoogleMap(
                  onMapCreated: (controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _location!,
                    zoom: 25,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId("address_marker"),
                      position: _location!,
                      infoWindow: InfoWindow(title: "Your Address"),
                    )
                  },
                ),
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
