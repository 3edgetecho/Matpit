import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/data/model/contact_us/my_enquiry_response.dart';
import 'package:real_estate/data/model/home/homeSlider.dart';
import 'package:real_estate/data/model/home/project_response.dart';
import 'package:real_estate/presentation/screens/home/component/all_property_list.dart';

import '../../../../data/model/create_property/recommend_property_response.dart';
import '../../../../data/model/home/home_data_model.dart' as home;
import '../../../repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  home.HomeDataModel? homeModel;
  MyEnquiryResponse? myEnquiryResponse;
  RecommendPropertyResponse? recommendPropertyResponse;
  List<HomeSlider> sliderData = [];
  List<ProjectResponse> projectPageList  =[];
  List<home.Categories> categoryList  =[];
  List<home.LocationProperties> nearByProperty  =[];
  List<home.FeaturedProperties> featureByProperty  =[];
  List<ProjectResponse> projectResponseData  =[];
  List<home.LocationProperties> locationProperties  =[];
  List<home.LocationProperties> featureProperties  =[];

  HomeCubit(HomeRepository homeRepository)
      : _homeRepository = homeRepository,
        super(HomeLoadingState()) {

    getHomeData();
    getHomeSlider();

  }

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    getRecommendProperty();
    getFiveProjectListWith(5);
    getFiveLocationListWith(5);
    getFiveFeatureListWith(5);

    final result = await _homeRepository.getHomeData();
    result.fold(
      (failure) {
        emit(HomeErrorState(error: failure.message));
      },
      (data) {
        homeModel = data;
        emit(HomeDataLoaded(homeDataLoaded: data));
      },
    );
  }

  Future<void> getEnquiryData() async {
    emit(HomeLoadingState());


    final result = await _homeRepository.getEnquiryData();
    result.fold(
      (failure) {
        emit(HomeErrorState(error: failure.message));
      },
      (data) {
        myEnquiryResponse = data;
        emit(EnquiryDataLoaded(homeDataLoaded: data));
      },
    );
  }

  Future<void> getRecommendProperty() async {
    emit(HomeLoadingState());

    final result = await _homeRepository.getRecommendProperty();
    result.fold(
      (failure) {
        emit(HomeErrorState(error: failure.message));
      },
      (data) {
        recommendPropertyResponse = data;
        emit(RecommendDataLoader(homeDataLoaded: data));
      },
    );
  }

  bool hasMore = true;
  bool hasMore2 = true;
  bool hasMore3 = true;
  int currentPage = 1;
  int currentPage2 = 1;
  int currentPage3 = 1;
  bool isLoading = false;
  bool isLoading2 = false;
  bool isLoading3 = false;

  Future<void> getProjectListWith(int page, {bool isPagination = false}) async {
    if (isLoading || !hasMore) return;
    isLoading = true;

    if (isPagination) {
      emit(ProjectPaginationLoadingState());
    } else {

    }

    final result = await _homeRepository.getProjectWithPagination(page);
    result.fold(
          (failure) {
        emit(HomeErrorState(error: failure.message));
        isLoading = false;
      },
          (data) {
        // ✅ STOP further calls if data is empty
        if (data.isEmpty) {
          hasMore = false;
        } else {
          if (page == 1) {
            projectPageList = data;
          } else {
            projectPageList.addAll(data);
          }
          currentPage = page;
        }

        emit(ProjectLoader(homeDataLoaded: projectPageList));
        isLoading = false;
      },
    );
  }


  Future<void> getFiveProjectListWith(int page) async {

      emit(FiveProjectPaginationLoadingState());


    final result = await _homeRepository.getFiveProjectWithPagination(5);
    result.fold(
          (failure) {
        emit(HomeErrorState(error: failure.message));
        isLoading = false;
      },
          (data) {
        // ✅ STOP further calls if data is empty


            projectPageList = data;

            print("projectPageList=>${projectPageList.length}");



        emit(FiveProjectLoader(homeDataLoaded: projectPageList));
        isLoading = false;
      },
    );
  }

  Future<void> getFiveLocationListWith(int page) async {

      emit(FiveLocationPaginationLoadingState());


    final result = await _homeRepository.getFiveLocationWithPagination(page);
    result.fold(
          (failure) {
        emit(HomeErrorState(error: failure.message));
        isLoading = false;
      },
          (data) {

            print('Data111');
            print(jsonEncode(data));


            nearByProperty = data;



        emit(FiveLocationPropertiesLoader(homeDataLoaded: nearByProperty));
        isLoading = false;
      },
    );
  }

  Future<void> getFiveFeatureListWith(int page) async {

      emit(FiveFeaturePaginationLoadingState());


    final result = await _homeRepository.getFiveFeatureWithPagination(page);
    result.fold(
          (failure) {
        emit(HomeErrorState(error: failure.message));
        isLoading = false;
      },
          (data) {
        // ✅ STOP further calls if data is empty


            featureByProperty = data;



        emit(FiveFeaturePropertiesLoader(homeDataLoaded: featureByProperty));
        isLoading = false;
      },
    );
  }


  Future<void> getLocationListWith(int page, {bool isPagination = false}) async {
    if (isLoading2 || !hasMore2) return;
    isLoading2 = true;

    if (isPagination) {
      emit(LocationPaginationLoadingState());
    } else {

    }

    final result = await _homeRepository.getLocationWithPagination(page);
    result.fold(
          (failure) {
        emit(HomeErrorState(error: failure.message));
        isLoading = false;
      },
          (data) {
        // ✅ STOP further calls if data is empty
        if (data.isEmpty) {
          hasMore2 = false;
        } else {
          if (page == 1) {
            locationProperties = data;
          } else {
            locationProperties.addAll(data);
          }
          currentPage2 = page;
        }

        emit(LocationPropertiesLoader(homeDataLoaded: locationProperties));
        isLoading2 = false;
      },
    );
  }

  Future<void> getFeatureListWith(int page, {bool isPagination = false}) async {
    if (isLoading3 || !hasMore3) return;
    isLoading3 = true;

    if (isPagination) {
      emit(FeaturePaginationLoadingState());
    } else {

    }

    final result = await _homeRepository.getFeatureWithPagination(page);
    result.fold(
          (failure) {
        emit(HomeErrorState(error: failure.message));
        isLoading3 = false;
      },
          (data) {
        // ✅ STOP further calls if data is empty
        if (data.isEmpty) {
          hasMore3 = false;
        } else {
          if (page == 1) {
            featureProperties = data;
          } else {
            featureProperties.addAll(data);
          }
          currentPage3 = page;
        }

        emit(FeaturePropertiesLoader(homeDataLoaded: featureProperties));
        isLoading3 = false;
      },
    );
  }

  Future<void> getHomeSlider() async {
   // emit(HomeLoadingState());

    final result = await _homeRepository.getHomeSlider();
    result.fold(
      (failure) {
        emit(HomeErrorState(error: failure.message));
      },
      (data) {
        sliderData = data;
        print("sliderData=>$sliderData");
        emit(HomeSliderDataLoader(homeDataLoaded: sliderData));
      },
    );
  }
}
