import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_app_bar.dart';
import '../../../data/data_provider/remote_url.dart';
import '../../../data/model/product/property_choose_model.dart';
import '../../../logic/cubit/add_property/add_property_cubit.dart';
import '../../../logic/cubit/create_property/create_info_cubit.dart';

import '../screens/property_create/new_property_create_screen.dart';
import '../utils/utils.dart';
import '../widget/page_refresh.dart';
import 'component/add_property_type_view.dart';
import 'component/single_choose_option.dart';
import 'new_property_create_screen.dart';

class ChooseProjectOptionScreen extends StatefulWidget {
  const ChooseProjectOptionScreen({super.key});

  @override
  State<ChooseProjectOptionScreen> createState() =>
      _ChoosePropertyOptionScreenState();
}

class _ChoosePropertyOptionScreenState
    extends State<ChooseProjectOptionScreen> {
  @override
  void initState() {
    // Future.microtask(
    //     () => context.read<CreateInfoCubit>().getPropertyChooseInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final propertyCubit = context.read<CreateInfoCubit>();
    //propertyCubit.getPropertyChooseInfo();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Choose Property Option',
      ),
      body: PageRefresh(
        onRefresh: () async => propertyCubit.getPropertyChooseInfo(),
        child: Utils.logoutListener(
          child: LoadedPropertyChooseInfo(
          )

          /*BlocConsumer<CreateInfoCubit, CreateInfoState>(
            listener: (context, state) {

            },
            builder: (context, state) {


              if (state is CreateInfoLoading) {
                return const LoadingWidget();
              } else if (state is CreateInfoError) {
                if (state.statusCode == 503) {
                  return LoadedPropertyChooseInfo(
                      );
                } else {
                  return Center(
                    child: CustomTextStyle(
                      text: state.error,
                      color: redColor,
                      fontSize: 20.0,
                    ),
                  );
                }
              } else if (state is PropertyChooseInfoLoaded) {
                return ;
              }
              return const Center(
                  child: CustomTextStyle(text: 'Something went wrong'));
            },
          )*/,
        ),
      ),
    );
  }
}

class LoadedPropertyChooseInfo extends StatelessWidget {
  const LoadedPropertyChooseInfo({super.key});



  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: SingleChooseOption(
                  onTap: () {
                    // context.read<PropertyCreateBloc>().add(PropertyStateReset());
                    // Navigator.pushNamed(context, RouteNames.addNewPropertyScreen,
                    //     arguments: 'rent');
                     context.read<AddPropertyCubit>().changeType('rent');
                     context.read<AddPropertyCubit>().resetData();
                    // Navigator.pushNamed(context, RouteNames.newPropertyCreateScreen,
                    //     arguments: '');
                  },
                  //icon: KImages.rentIcon,
                  icon: "https://cdn3.iconfinder.com/data/icons/real-estate-property/33/rent_house_2-512.png",
                  text: "Rent",
                  isActive: false,
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
                  context.read<AddPropertyCubit>().changeType('sale');
                   context.read<AddPropertyCubit>().resetData();
                  // Navigator.pushNamed(context, RouteNames.newPropertyCreateScreen,
                  //     arguments: '');
                },
                //icon: KImages.saleIcon,
                icon: "https://cdn3.iconfinder.com/data/icons/real-estate-property/33/rent_house_2-512.png",
                text: "Sale",
                  isActive: false,
                subText: "Your email address will not be published. fields are marked *",
                iconBgColor: yellowColor.withOpacity(0.15),
                            ),
              ),)
          ],
        ),
        const SizedBox(height: 10.0),
        NewPropertyCreateScreen(id: "",)

      ],
    );
  }
}
