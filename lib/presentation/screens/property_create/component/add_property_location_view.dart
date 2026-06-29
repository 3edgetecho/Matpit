import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/data_provider/remote_url.dart';
import '../../../../data/model/city_response.dart';
import '../../../../data/model/create_property/cities_model.dart';
import '../../../../data/model/state_response.dart';
import '../../../../logic/cubit/add_property/add_property_cubit.dart';
import '../../../../logic/cubit/add_property/add_property_state_model.dart';
import '../../../../logic/cubit/create_property/create_info_cubit.dart';
import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import 'package:http/http.dart' as http;
import '../../../widget/custom_test_style.dart';
import '../../../widget/error_text.dart';
import '../../../widget/form_header_title.dart';

class AddPropertyLocationView extends StatefulWidget {
  const AddPropertyLocationView({super.key});

  @override
  State<AddPropertyLocationView> createState() =>
      _AddPropertyLocationViewState();
}

class _AddPropertyLocationViewState extends State<AddPropertyLocationView> {
  late AddPropertyCubit addProperty;
  late CreateInfoCubit infoCubit;
  Cities? citiesModel;

  _initState() {
    addProperty = context.read<AddPropertyCubit>();
    infoCubit = context.read<CreateInfoCubit>();

    // if (infoCubit.createPropertyInfo != null &&
    //     infoCubit.createPropertyInfo!.cities!.isNotEmpty) {
    //   if (addProperty.state.propertyLocationDto.cityId != 0) {
    //     citiesModel = infoCubit.createPropertyInfo!.cities!
    //         .where((e) => e.id == addProperty.state.propertyLocationDto.cityId)
    //         .first;
    //   } else {
    //     citiesModel = infoCubit.createPropertyInfo!.cities!.first;
    //   }
    //   final location = addProperty.state.propertyLocationDto
    //       .copyWith(cityId: citiesModel!.id);
    //   addProperty.addPropertyLocation(location);
    // }
  }

  @override
  void initState() {
    _initState();
    fetchStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPropertyCubit, AddPropertyModel>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 0.5,
                color: Colors.black,
              )),
          child: Column(
            children: [
              const FormHeaderTitle(title: "Property Location"),
              Utils.verticalSpace(14.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAddressField(),
                    Utils.verticalSpace(16),
                    _buildCity(),
                    Utils.verticalSpace(16),

                    // _buildDetailsField(),
                    // Utils.verticalSpace(16),
                    // _buildGoogleField(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGoogleField() {
    return BlocBuilder<AddPropertyCubit, AddPropertyModel>(
      builder: (context, state) {
        final stateStatus = state.addState;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: state.propertyLocationDto.googleMap,
              onChanged: (value) {
                final location =
                    state.propertyLocationDto.copyWith(googleMap: value);
                addProperty.addPropertyLocation(location);
              },
              decoration: const InputDecoration(
                  hintText: 'Google Map *',
                  labelText: 'Google Map *',
                  hintStyle: TextStyle(color: Colors.black38),
                  labelStyle: TextStyle(
                    color: Colors.black38,
                  )),
              keyboardType: TextInputType.text,
            ),
            if (stateStatus is AddPropertyFormError) ...[
              if (stateStatus.errors.googleMap.isNotEmpty)
                ErrorText(text: stateStatus.errors.googleMap.first)
            ]
          ],
        );
      },
    );
  }

  Widget _buildDetailsField() {
    return BlocBuilder<AddPropertyCubit, AddPropertyModel>(
      builder: (context, state) {
        final stateStatus = state.addState;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: state.propertyLocationDto.addressDescription,
              onChanged: (value) {
                final location = state.propertyLocationDto
                    .copyWith(addressDescription: value);
                addProperty.addPropertyLocation(location);
              },
              decoration: const InputDecoration(
                  hintText: 'Details *',
                  labelText: 'Details *',
                  hintStyle: TextStyle(color: Colors.black38),
                  labelStyle: TextStyle(
                    color: Colors.black38,
                  )),
              keyboardType: TextInputType.text,
            ),
            if (stateStatus is AddPropertyFormError) ...[
              if (stateStatus.errors.addressDescription.isNotEmpty)
                ErrorText(text: stateStatus.errors.addressDescription.first)
            ]
          ],
        );
      },
    );
  }

  Widget _buildAddressField() {
    return BlocBuilder<AddPropertyCubit, AddPropertyModel>(
      builder: (context, state) {
        final stateStatus = state.addState;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: state.propertyLocationDto.address,
              onChanged: (value) {
                final location =
                    state.propertyLocationDto.copyWith(address: value);
                addProperty.addPropertyLocation(location);
              },
              decoration: const InputDecoration(
                  hintText: 'Address *',
                  labelText: 'Address *',
                  hintStyle: TextStyle(color: Colors.black38),
                  labelStyle: TextStyle(
                    color: Colors.black38,
                  )),
              keyboardType: TextInputType.text,
            ),
            if (stateStatus is AddPropertyFormError) ...[
              if (stateStatus.errors.address.isNotEmpty)
                ErrorText(text: stateStatus.errors.address.first)
            ]
          ],
        );
      },
    );
  }

  States? selectState;
  Cities? selectCity;
  List<States> stateListData = [];
  List<Cities> cityListData = [];

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
  Widget _buildCity() {
    return BlocBuilder<AddPropertyCubit, AddPropertyModel>(
      builder: (context, state) {
        final stateStatus = state.addState;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

              DropdownButtonFormField<States>(
                isDense: true,
                isExpanded: true,
                value: selectState,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: borderColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                ),
                hint: const CustomTextStyle(
                  text: 'State',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
                icon: const Icon(Icons.keyboard_arrow_down_sharp,
                    color: blackColor),
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
                  if (val == null) return;
                  final location =
                      state.propertyLocationDto.copyWith(stateId: int.parse(val.stateId!));
                 // addProperty.addPropertyLocation(location);

                  setState(() {
                    selectState = val;

                    addProperty.changeState(val!.stateId.toString());

                    selectCity = null;

                    fetchCities(selectState!.stateId.toString());
                  });
                },
              ),


            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<Cities>(
              isDense: true,
              isExpanded: true,
              value: selectCity,
              decoration: const InputDecoration(
                filled: true,
                fillColor: borderColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
              ),
              hint: const CustomTextStyle(
                text: 'City',
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
              icon: const Icon(Icons.keyboard_arrow_down_sharp,
                  color: blackColor),
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
                if (val == null) return;
                final location =
                state.propertyLocationDto.copyWith(cityId: int.parse(val.cityId!));
              //  addProperty.addPropertyLocation(location);

                setState(() {
                  selectCity = val!;
                  addProperty.changeCity(val!.cityId.toString());
                });
              },
            ),

            if (stateStatus is AddPropertyFormError) ...[
              if (stateStatus.errors.cityId.isNotEmpty)
                ErrorText(text: stateStatus.errors.cityId.first)
            ]
          ],
        );
      },
    );
  }
}
