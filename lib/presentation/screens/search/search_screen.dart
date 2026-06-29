import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/data/model/search_response_model/search_response_model.dart';

import '/logic/bloc/search/search_bloc.dart';
import '/presentation/utils/constraints.dart';
import '/presentation/utils/k_images.dart';
import '/presentation/widget/empty_widget.dart';
import '/presentation/widget/loading_widget.dart';
import '../../../data/model/search_response_model/search_property_model.dart';
import '../../router/route_names.dart';
import 'component/search_component.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    final searchBloc = context.read<SearchBloc>();
    scrollController.addListener(() {
      final maxExtent = scrollController.position.maxScrollExtent - 200;
      if (maxExtent < scrollController.position.pixels) {
        searchBloc.add(const SearchEventLoadMoreProperty());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    // if (mounted) {
    //   clearProperty();
    // }
  }

  // clearProperty() {
  //   final searchBloc = context.read<SearchBloc>();
  //   if (searchBloc.property.isNotEmpty) {
  //     searchBloc.property.clear();
  //   }
  // }

  // @override
  // void didChangeDependencies() {
  //   clearProperty();
  //   print('didChangeDependencies');
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return WillPopScope(
      onWillPop: () async {
        if (searchBloc.allProjects.isNotEmpty) {
          searchBloc.allProjects.clear();
        }
        if (searchBloc.allProperties.isNotEmpty) {
          searchBloc.allProperties.clear();
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          // backgroundColor: whiteColor,
          appBar: SearchTextField(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.done,
                controller: searchTextEditingController,
                decoration: const InputDecoration(
                    hintText: 'Search property..',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0)),
                onChanged: (String text) {
                  if (text.isEmpty) return;
                  searchBloc.add(SearchEventProperty(name: text.trim()));
                },
                onFieldSubmitted: (String text) {
                  if (text.isEmpty) return;
                  searchBloc.add(SearchEventProperty(name: text.trim()));
                },
              ),
            ),
          ),
          body: BlocListener<SearchBloc, SearchState>(
            listener: (context, state) {},
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const LoadingWidget();
                } else if (state is SearchError) {
                  //Utils.errorSnackBar(context, state.message);
                } else if (state is SearchLoaded) {
                  return SafeArea(child: SearchLoadedWidget(property: state.properties!,project: state.projects,));
                }
                return const SizedBox.shrink();
                // return const Center(
                //   child: CustomTextStyle(
                //     text: 'something is wrong',
                //   ),
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}
class SearchLoadedWidget extends StatefulWidget {
  const SearchLoadedWidget({super.key, required this.property, required this.project});
  final List<PropertyModel> property;
  final List<ProjectModel> project;

  @override
  State<StatefulWidget> createState() =>_SearchLoaderWidget();


}

class _SearchLoaderWidget extends State<SearchLoadedWidget> {
  int selectIndex = 1;
  @override
  Widget build(BuildContext context) {


      return Column(
        children: [
          SizedBox(height: 0,),
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
         selectIndex == 1 ?
         widget.property.isNotEmpty ?  Expanded(
           child: ListView.builder(
                itemCount: widget.property.length,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0)
                    .copyWith(top: 0.0),
                itemBuilder: (context, index) =>  SearchComponent(property: widget.property[index])),
         ):Center(
             child: EmptyWidget(
                 icon: KImages.emptyProperty, title: 'No Property Found!')):widget.project.isNotEmpty ?Expanded(
                   child: ListView.builder(
                                itemCount: widget.project.length,
                                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                                physics: const ClampingScrollPhysics(),
                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0)
                   .copyWith(top: 0.0),
                                itemBuilder: (context, index) =>  SearchProjectComponent(property: widget.project[index])),
                 ):Center(
             child: EmptyWidget(
                 icon: KImages.emptyProperty, title: 'No Project Found!')),
        ],
      );

  }
}

class SearchTextField extends StatelessWidget implements PreferredSizeWidget {
  const SearchTextField({super.key, required this.child});
  final Widget child;
  final double height = 100.0;

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: transparent,
      toolbarHeight: height,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                searchBloc.allProjects.clear();
                searchBloc.allProperties.clear();
              },
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
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
