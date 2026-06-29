part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}
class ProjectPaginationLoadingState extends HomeState {}
class FiveProjectPaginationLoadingState extends HomeState {}
class LocationPaginationLoadingState extends HomeState {}
class FiveLocationPaginationLoadingState extends HomeState {}
class FeaturePaginationLoadingState extends HomeState {}
class FiveFeaturePaginationLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;
  const HomeErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class HomeDataLoaded extends HomeState {
  final home.HomeDataModel homeDataLoaded;
  const HomeDataLoaded({required this.homeDataLoaded});

  @override
  List<Object> get props => [homeDataLoaded];
}

class EnquiryDataLoaded extends HomeState {
  final MyEnquiryResponse homeDataLoaded;
  const EnquiryDataLoaded({required this.homeDataLoaded});

  @override
  List<Object> get props => [homeDataLoaded];
}

class RecommendDataLoader extends HomeState {
  final RecommendPropertyResponse homeDataLoaded;
  const RecommendDataLoader({required this.homeDataLoaded});

  @override
  List<Object> get props => [homeDataLoaded];
}

class ProjectLoader extends HomeState {
  final List<ProjectResponse> homeDataLoaded;
  const ProjectLoader({required this.homeDataLoaded});
}

class FiveProjectLoader extends HomeState {
  final List<ProjectResponse> homeDataLoaded;
  const FiveProjectLoader({required this.homeDataLoaded});
}

class LocationPropertiesLoader extends HomeState {
  final List<home.LocationProperties> homeDataLoaded;
  const LocationPropertiesLoader({required this.homeDataLoaded});
}

class FiveLocationPropertiesLoader extends HomeState {
  final List<home.LocationProperties> homeDataLoaded;
  const FiveLocationPropertiesLoader({required this.homeDataLoaded});
}

class FeaturePropertiesLoader extends HomeState {
  final List<home.LocationProperties> homeDataLoaded;
  const FeaturePropertiesLoader({required this.homeDataLoaded});
}

class FiveFeaturePropertiesLoader extends HomeState {
  final List<home.FeaturedProperties> homeDataLoaded;
  const FiveFeaturePropertiesLoader({required this.homeDataLoaded});
}

class HomeSliderDataLoader extends HomeState {
  final List<HomeSlider> homeDataLoaded;
  const HomeSliderDataLoader({required this.homeDataLoaded});

  @override
  List<Object> get props => [homeDataLoaded];
}
