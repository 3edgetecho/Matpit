import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/presentation/utils/k_images.dart';
import '/presentation/widget/empty_widget.dart';
import '../../../data/model/filter/filter_property_list_model.dart';
import '../../../logic/cubit/filter_property/filter_property_cubit.dart';
import '../../../logic/cubit/filter_property/filter_property_state_model.dart';
import '../../router/route_names.dart';
import '../../utils/constraints.dart';
import '../../widget/custom_images.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/loading_widget.dart';
import '../../widget/page_refresh.dart';
import 'component/drawer_menu.dart';
import 'component/single_filter_properties.dart';

class FilterPropertyScreen extends StatelessWidget {
  FilterPropertyScreen({super.key, required this.type});
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final String type;

  @override
  Widget build(BuildContext context) {
    final filterCubit = context.read<FilterPropertyCubit>();

    print('filterString: $type');

      filterCubit.getFilterPropertyByType(type);
      print('not empty');

    //print('lenght: ${filterCubit.property!.propertyType!.length}');

    return Scaffold(
      key: _key,
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actionsIconTheme:
        const IconThemeData(color: primaryColor, size: 30.0, fill: 0.6),
        actions: const [SizedBox()],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const CircleAvatar(
                    backgroundColor: primaryColor,
                    minRadius: 18.0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: whiteColor,
                        size: 22.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                 CustomTextStyle(
                  text: type.toUpperCase(),
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ],
            ),
            /* ElevatedButton.icon(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 16.0)),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFFEFC64F)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
              shadowColor: MaterialStateProperty.all(transparent),
              elevation: MaterialStateProperty.all(0.0),
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.all(transparent),
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            label: const CustomTextStyle(
              text: 'Filter',
              color: blackColor,
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
            icon: const CustomImage(
              path: KImages.filterIcon,
            ),
          )*/
          ],
        ),
      ),
      //appBar: const CustomAppBar(title: 'Filter Property'),
      body: PageRefresh(
        onRefresh: () async {

            filterCubit.getFilterPropertyByType(type);

        },
        child: BlocBuilder<FilterPropertyCubit, FilterPropertyStateModel>(
          builder: (context, state) {
            final filter = state.filterState;
            if (filter is FilterPropertyLoading) {
              return const LoadingWidget();
            } else if (filter is FilterPropertyError) {
              if (filter.statusCode == 503) {
                return LoadedFilterWidget(
                    filterProperty: filterCubit.property!);
              } else {
                return Center(
                    child:
                        CustomTextStyle(text: filter.message, color: redColor));
              }
            } else if (filter is FilterPropertyLoaded) {
              return LoadedFilterWidget(filterProperty: filter.property);
            }
            return LoadedFilterWidget(filterProperty: filterCubit.property!);
          },
        ),
      ),
      //endDrawer: DrawerFilter(propertyList: filterCubit.property??null),
    );
  }
}

class LoadedFilterWidget extends StatefulWidget {
  const LoadedFilterWidget({super.key, required this.filterProperty});
  final FilterPropertyListModel filterProperty;

  @override
  State<StatefulWidget> createState() =>_LoadedFilterWidget();


}

class _LoadedFilterWidget extends State<LoadedFilterWidget> {

  int selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    final property = widget.filterProperty.properties!.data!;
    final project = widget.filterProperty.projects!;
    if (property.isNotEmpty) {
      return Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, left: 20, right: 20,bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: primaryColor),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = 1;
                        });
                      },
                      child: Container(

                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 0),
                        padding: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: selectIndex == 1
                              ? LinearGradient(
                            colors: [
                              primaryColor,
                              blackColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                              : null,
                          color: selectIndex != 1 ? Colors.transparent : null,
                        ),
                        child: Text(
                          "Property",
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            color: selectIndex == 1 ? Colors.white : Colors.black,

                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )

                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = 0;
                        });
                      },
                      child: Container(

                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 0),
                        padding: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: selectIndex == 0
                              ? LinearGradient(
                            colors: [
                              primaryColor,
                              blackColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                              : null,
                          color: selectIndex != 0 ? Colors.transparent : null,
                        ),
                        child: Text(
                          "Project",
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            color: selectIndex == 0 ? Colors.white : Colors.black,

                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )

                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child:selectIndex ==1 ?
          property.isNotEmpty?  ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0)
                  .copyWith(bottom: 20.0),
              itemCount: property.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, RouteNames.propertyDetailsScreen,
                    arguments: property[index].id.toString()),
                child: SingleFilterProperties(
                  property: property[index],
                ),
              ),
            ):Center(
    child: EmptyWidget(
    icon: KImages.emptyProperty, title: 'No Property Found!')):project.isNotEmpty ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0)
                  .copyWith(bottom: 20.0),
              itemCount: project.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, RouteNames.projectDetailsScreen,
                    arguments: project[index].id.toString()),
                child: SingleFilterProject(
                  property: project[index],
                ),
              ),
            ):Center(
                child: EmptyWidget(
                    icon: KImages.emptyProperty, title: 'No Project Found!')),
          ),
        ],
      );
    } else {
      return const Center(
        child:
        EmptyWidget(icon: KImages.emptyFilter, title: 'No Property Found!'),
      );
    }
  }
}

class FilterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FilterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actionsIconTheme:
          const IconThemeData(color: primaryColor, size: 30.0, fill: 0.6),
      actions: const [SizedBox()],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const CircleAvatar(
                  backgroundColor: primaryColor,
                  minRadius: 18.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: whiteColor,
                      size: 22.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              const CustomTextStyle(
                text: 'Properties',
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ],
          ),
         /* ElevatedButton.icon(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 16.0)),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFFEFC64F)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
              shadowColor: MaterialStateProperty.all(transparent),
              elevation: MaterialStateProperty.all(0.0),
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.all(transparent),
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            label: const CustomTextStyle(
              text: 'Filter',
              color: blackColor,
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
            icon: const CustomImage(
              path: KImages.filterIcon,
            ),
          )*/
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
