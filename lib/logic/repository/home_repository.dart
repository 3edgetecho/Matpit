import 'package:dartz/dartz.dart';
import 'package:real_estate/data/model/contact_us/my_enquiry_response.dart';
import 'package:real_estate/data/model/create_property/recommend_property_response.dart';
import 'package:real_estate/data/model/home/homeSlider.dart';
import 'package:real_estate/data/model/home/project_response.dart' as home;
import 'package:real_estate/presentation/screens/home/component/all_property_list.dart';
import 'package:real_estate/presentation/screens/home/component/recommended_properties.dart';

import '../../data/data_provider/local_data_source.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/home/home_data_model.dart' as main;
import '../../data/model/product/project_response.dart';
import '../../data/model/product/single_property_model.dart';
import '../../presentation/error/exception.dart';
import '../../presentation/error/failure.dart';

abstract class HomeRepository {
  Future<Either<dynamic,main. HomeDataModel>> getHomeData();
  Future<Either<dynamic, MyEnquiryResponse>> getEnquiryData();
  Future<Either<dynamic, RecommendPropertyResponse>> getRecommendProperty();
  Future<Either<dynamic, List<home.ProjectResponse>>> getProjectWithPagination(int page);
  Future<Either<dynamic, List<home.ProjectResponse>>> getFiveProjectWithPagination(int page);
  Future<Either<dynamic, List<main.LocationProperties>>> getLocationWithPagination(int page);
  Future<Either<dynamic, List<main.LocationProperties>>> getFiveLocationWithPagination(int page);
  Future<Either<dynamic, List<main.LocationProperties>>> getFeatureWithPagination(int page);
  Future<Either<dynamic, List<main.FeaturedProperties>>> getFiveFeatureWithPagination(int page);
  Future<Either<dynamic, List<HomeSlider>>> getHomeSlider();
  Future<Either<dynamic, SinglePropertyModel>> getSingleProperty(String slug);
  Future<Either<dynamic, ProjectResponse>> getSingleProject(String slug);
}

class HomeRepositoryImp extends HomeRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  HomeRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<dynamic, main.HomeDataModel>> getHomeData() async {
    try {
      final result = await remoteDataSource.getHomeData();
      final data = main.HomeDataModel.fromJson(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }@override
  Future<Either<dynamic, MyEnquiryResponse>> getEnquiryData() async {
    try {
      final result = await remoteDataSource.getEnquiryData();
      final data = MyEnquiryResponse.fromJson(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
  @override
  Future<Either<dynamic, RecommendPropertyResponse>> getRecommendProperty() async {
    try {
      final result = await remoteDataSource.getRecommendProperty();
      final data = RecommendPropertyResponse.fromJson(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, List<home.ProjectResponse>>> getProjectWithPagination(int page) async {
    try {
      final result = await remoteDataSource.getProjectPagination(page);
      final List<home.ProjectResponse> sliders = (result as List)
          .map((e) => home.ProjectResponse.fromJson(e))
          .toList();
      return Right(sliders);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, List<home.ProjectResponse>>> getFiveProjectWithPagination(int page) async {
    try {
      final result = await remoteDataSource.getFiveProjectWithPagination(page);
      final List<home.ProjectResponse> sliders = (result as List)
          .map((e) => home.ProjectResponse.fromJson(e))
          .toList();
      return Right(sliders);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, List<main.LocationProperties>>> getLocationWithPagination(int page) async {
    try {
      final result = await remoteDataSource.getLocationPagination(page);
      final List<main.LocationProperties> sliders = (result as List)
          .map((e) => main.LocationProperties.fromJson(e))
          .toList();
      return Right(sliders);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, List<main.LocationProperties>>> getFiveLocationWithPagination(int page) async {
    try {
      final result = await remoteDataSource.getFiveLocationPagination(page);
      final List<main.LocationProperties> sliders = (result as List)
          .map((e) => main.LocationProperties.fromJson(e))
          .toList();
      return Right(sliders);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, List<main.FeaturedProperties>>> getFiveFeatureWithPagination(int page) async {
    try {
      final result = await remoteDataSource.getFiveFeaturePagination(page);
      final List<main.FeaturedProperties> sliders = (result as List)
          .map((e) => main.FeaturedProperties.fromJson(e))
          .toList();
      return Right(sliders);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }@override
  Future<Either<dynamic, List<main.LocationProperties>>> getFeatureWithPagination(int page) async {
    try {
      final result = await remoteDataSource.getFeaturePagination(page);
      final List<main.LocationProperties> sliders = (result as List)
          .map((e) => main.LocationProperties.fromJson(e))
          .toList();
      return Right(sliders);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  Future<Either<dynamic, List<HomeSlider>>> getHomeSlider() async {
    try {
      final result = await remoteDataSource.getHomeSlider();
      final List<HomeSlider> sliders = (result as List)
          .map((e) => HomeSlider.fromJson(e))
          .toList();
      return Right(sliders);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, SinglePropertyModel>> getSingleProperty(String slug) async {
    try {
      final result = await remoteDataSource.getSinglePropertyDetails(slug);
      final data = SinglePropertyModel.fromJson(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, ProjectResponse>> getSingleProject(String slug) async {
    try {
      final result = await remoteDataSource.getSingleProjectDetails(slug);
      final data = ProjectResponse.fromJson(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
