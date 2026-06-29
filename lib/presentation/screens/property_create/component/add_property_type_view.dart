import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/data/data_provider/remote_url.dart';
import 'package:real_estate/data/model/home/home_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/presentation/screens/property_create/component/single_choose_option.dart';
import '../../../../data/model/category/property_category_model.dart';
import '../../../../logic/cubit/add_property/add_property_cubit.dart';
import '../../../../logic/cubit/add_property/add_property_state_model.dart';
import '../../../../logic/cubit/create_property/create_info_cubit.dart';
import '../../../core/dummy_text.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_test_style.dart';
import '../../../widget/error_text.dart';

class AddPropertyTypeView extends StatefulWidget {

  const AddPropertyTypeView({super.key});

  @override
  State<AddPropertyTypeView> createState() => _AddPropertyTypeViewState();
}

class _AddPropertyTypeViewState extends State<AddPropertyTypeView> {
  late AddPropertyCubit addProperty;
  late CreateInfoCubit infoCubit;
  Categories? categoryModel;
  String? value = "Daily";
  int isActive = 0;
  String propertyType = "Rent";
  List<Categories>categoryList = [];


  _initState() {
    addProperty = context.read<AddPropertyCubit>();
    infoCubit = context.read<CreateInfoCubit>();
    //context.read<CreateInfoCubit>().getPropertyChooseInfo();

    // if (infoCubit.createPropertyInfo != null &&
    //     infoCubit.createPropertyInfo!.types!.isNotEmpty) {
    //   if (addProperty.state.typeId.isNotEmpty) {
    //     categoryModel = infoCubit.createPropertyInfo!.types!
    //         .where((e) => e.id.toString() == addProperty.state.typeId)
    //         .first;
    //   } else {
    //     categoryModel = infoCubit.createPropertyInfo!.types!.first;
    //   }
    //   addProperty.changeTypeId(categoryModel!.id.toString());
    // }
    // if (addProperty.state.rentPeriod.isNotEmpty) {
    //   value = rendPeriodList
    //       .where((element) =>
    //           element.toLowerCase() ==
    //           addProperty.state.rentPeriod.toLowerCase())
    //       .first;
    //   // print('rent-period ${addProperty.state.rentPeriod}');
    // } else {
    //   value = rendPeriodList.first;
    //   // print('rent-period-not-state $value');
    // }
    // addProperty.changeRentPeriod(value!.toLowerCase());
  }

  @override
  void initState() {
    _initState();

    loadCategories("commercial");



    setState(() {

    });
    super.initState();
  }

  Future<List<Categories>> fetchCategories(String type) async {
    final url = Uri.parse("${RemoteUrls.rootUrl2}category?type=$type");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);

      if (jsonData is Map && jsonData['categories'] is List) {
        final List categoryList = jsonData['categories'];
        return categoryList.map((item) => Categories.fromJson(item)).toList();
      } else {
        throw Exception("Unexpected response format: ${jsonData.runtimeType}");
      }
    } else {
      throw Exception("Failed to load categories: ${response.statusCode}");
    }
  }


  void loadCategories(String type) async {
    try {
      categoryList = await fetchCategories(type);
      setState(() {}); // agar UI mein use kar rahe ho to
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

      return BlocBuilder<AddPropertyCubit, AddPropertyModel>(
        builder: (context, state) {
          // PropertyCategory? categoryModel;
          // if (cubit.createPropertyInfo != null &&
          //     cubit.createPropertyInfo!.types!.isNotEmpty) {
          //   categoryModel = cubit.createPropertyInfo!.types!.first;
          // }
          // if (state.typeId.isNotEmpty) {
          //   categoryModel = infoCubit.createPropertyInfo!.types!
          //       .where((element) => element.id.toString() == state.typeId)
          //       .first;
          // }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<AddPropertyCubit, AddPropertyModel>(
                builder: (context, state) {
                  final stateStatus = state.addState;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 3.0),
                              child: SingleChooseOption(
                                onTap: () {

                                  setState(() {
                                    isActive = 0;
                                    loadCategories("commercial");
                                    addProperty.changeTypeId("commercial");
                                    categoryModel = null;
                                  });
                                  // context.read<PropertyCreateBloc>().add(PropertyStateReset());
                                  // Navigator.pushNamed(context, RouteNames.addNewPropertyScreen,
                                  //     arguments: 'rent');
                                  // context.read<AddPropertyCubit>().changeType('rent');
                                  // context.read<AddPropertyCubit>().resetData();
                                  // Navigator.pushNamed(context, RouteNames.newPropertyCreateScreen,
                                  //     arguments: '');
                                },
                                isActive: isActive==0? true:false,
                                //icon: KImages.rentIcon,
                                icon: "https://cdn-icons-png.flaticon.com/512/3309/3309865.png",
                                text: "Commercial",
                                subText: "Your email address will not be published. fields are marked *",
                                iconBgColor: borderColor,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: SingleChooseOption(
                                onTap: () {
                                  setState(() {
                                    isActive = 1;
                                    loadCategories("residential");
                                    addProperty.changeTypeId("residential");
                                    categoryModel = null;
                                  });
                                  // context.read<AddPropertyCubit>().changeType('sale');
                                  // context.read<AddPropertyCubit>().resetData();
                                  // Navigator.pushNamed(context, RouteNames.newPropertyCreateScreen,
                                  //     arguments: '');
                                },
                                isActive: isActive==1? true:false,
                                //icon: KImages.saleIcon,
                                icon: "https://cdn-icons-png.flaticon.com/512/5364/5364136.png",
                                text: "Residential",
                                subText: "Your email address will not be published. fields are marked *",
                                iconBgColor: yellowColor.withOpacity(0.15),
                              ),
                            ),)
                        ],
                      ),
                      SizedBox(height: 20,),
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
                        value: propertyType,
                        hint: const CustomTextStyle(
                          text: 'Rent',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                        ),
                        icon:
                        const Icon(Icons.keyboard_arrow_down_sharp, color: blackColor),
                        items: ['Rent', 'Sale']
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
                          if (val == null) return;

                          setState(() {
                            propertyType = val;
                          });
                          addProperty.changeType(val.toLowerCase());
                          //context.read<AddPropertyCubit>().changeType(propertyType.toLowerCase());
                        },
                      ),
                      SizedBox(height: 20,),

                        DropdownButtonFormField<Categories>(
                          isDense: true,
                          isExpanded: true,
                          value: categoryModel,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: borderColor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: borderColor),
                            ),
                          ),
                          hint: const CustomTextStyle(
                            text: 'Select Category',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down_sharp,
                              color: blackColor),
                          items: categoryList
                              .map<DropdownMenuItem<Categories>>(
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
                            //bloc.add(PropertyTypeEvent(type: val!.id.toString()));
                            if (val == null) return;
                            addProperty.changeCategory(val.id.toString());
                            categoryModel = val;
                          },
                        ),

                      if (stateStatus is AddPropertyFormError) ...[
                        if (stateStatus.errors.propertytypeId.isNotEmpty)
                          ErrorText(
                              text: stateStatus.errors.propertytypeId.first)
                      ]
                    ],
                  );
                },
              ),
            ],
          );
        },
      );

  }
}

// class AddRentPeriodView extends StatelessWidget {
//   const AddRentPeriodView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<AddPropertyCubit>();
//     return BlocBuilder<AddPropertyCubit, AddPropertyModel>(
//       builder: (context, state) {
//         String value = rendPeriodList.first;
//         if (state.rentPeriod.isNotEmpty) {
//           value = rendPeriodList
//               .where((element) => element.toLowerCase() == state.rentPeriod)
//               .first;
//         }
//
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // heading('Select Category'),
//             DropdownButtonFormField<String>(
//               isDense: true,
//               isExpanded: true,
//               decoration: const InputDecoration(
//                 filled: true,
//                 fillColor: borderColor,
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: borderColor),
//                 ),
//               ),
//               value: value,
//               hint: const CustomTextStyle(
//                 text: 'Rent',
//                 fontWeight: FontWeight.w400,
//                 fontSize: 16.0,
//               ),
//               icon: const Icon(Icons.keyboard_arrow_down_sharp,
//                   color: blackColor),
//               items: rendPeriodList
//                   .map<DropdownMenuItem<String>>(
//                     (e) => DropdownMenuItem(
//                       value: e,
//                       child: CustomTextStyle(
//                         text: e,
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   )
//                   .toList(),
//               onChanged: (val) {
//                 if (val == null) return;
//                 bloc.changeRentPeriod(val.toLowerCase());
//
//                 // bloc.add(PropertyRentPeriodEvent(rentPeriod: val!.toLowerCase()));
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
