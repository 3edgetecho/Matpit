import 'package:dartz/dartz.dart';
import 'package:real_estate/data/model/home/home_data_model.dart';
import 'package:real_estate/data/model/product/Amenities_model.dart' as getAmenities;


import '../../data/model/product/project_response.dart' as project;
import '../../data/model/product/single_property_model.dart' as single;
import '/data/model/create_property/create_property_model.dart';
import '../../data/data_provider/local_data_source.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/create_property/edit_info/edit_info_model.dart';
import '../../data/model/product/property_choose_model.dart';
import '../../presentation/error/exception.dart';
import '../../presentation/error/failure.dart';
import '../cubit/add_property/add_property_state_model.dart';

abstract class PropertyRepository {
  Future<Either<Failure, List<Categories>>> getPropertyCreateInfo(
      String token, String purpose);

  Future<Either<dynamic, String>> contactUsProperty(
      String token, var purpose);

  // Future<Either<Failure, List<getAmenities.AmenitiesModel>>> getAmenitiesInfo2(
  //     String token,);

  Future<Either<dynamic, String>> createProperty(
      AddPropertyModel data, String token);

  Future<Either<dynamic, String>> createProject(
      AddPropertyModel data, String token);

  Future<Either<dynamic, String>> updateProperty(
      String id, AddPropertyModel data, String token);

  Future<Either<dynamic, String>> updateProject(
      String id, AddPropertyModel data, String token);

  Future<Either<dynamic, String>> deleteSliderImage(String id, String token);

  Future<Either<Failure, String>> deleteProperty(String id, String token);

  Future<Either<dynamic, String>> deleteSingleNearestLocation(
      String id, String token);

  Future<Either<dynamic, String>> deleteSingleAddInfo(String id, String token);

  Future<Either<dynamic, String>> deleteSinglePlan(String id, String token);

  Future<Either<Failure, single.SinglePropertyModel>> getPropertyEditInfo(
      String id, String token);

  Future<Either<Failure, project.ProjectResponse>> getProjectEditInfo(
      String id, String token);

  Future<Either<Failure, PropertyChooseModel>> getPropertyChooseInfo(
      String token);
}

class PropertyRepositoryImp extends PropertyRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  PropertyRepositoryImp(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<Categories>>> getPropertyCreateInfo(
      String token, String purpose) async {
    try {
      final result =
          await remoteDataSource.getPropertyCreateInfo(token, purpose);
      List<Categories> data = result.map((item) => Categories.fromJson(item)).toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  // @override
  // Future<Either<Failure, List<getAmenities.AmenitiesModel>>> getAmenitiesInfo2(
  //     String token, String purpose) async {
  //   try {
  //     final result =
  //         await remoteDataSource.getPropertyCreateInfo(token, purpose);
  //     List<Categories> data = result.map((item) => getAmenities.AmenitiesModel.fromJson(item)).toList();
  //     return Right(data);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message, e.statusCode));
  //   }
  // }

  @override
  Future<Either<dynamic, String>> createProject(
      AddPropertyModel data, String token) async {
    try {
      final result = await remoteDataSource.createProjectRequest(data, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }@override
  Future<Either<dynamic, String>> contactUsProperty(
      String token, var purpose) async {
    try {
      final result = await remoteDataSource.contactUsProperty(token, purpose);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }
@override
  Future<Either<dynamic, String>> createProperty(
      AddPropertyModel data, String token) async {
    try {
      final result = await remoteDataSource.createPropertyRequest(data, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<Failure, single.SinglePropertyModel>> getPropertyEditInfo(
      String id, String token) async {
    try {

      final result = await remoteDataSource.getPropertyEditInfo(id, token);
      print("result=>$result");
      final data = single.SinglePropertyModel.fromJson(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }@override
  Future<Either<Failure, project.ProjectResponse>> getProjectEditInfo(
      String id, String token) async {
    try {

      final result = await remoteDataSource.getProjectEditInfo(id, token);
      print("result=>$result");
      final data = project.ProjectResponse.fromJson(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> updateProperty(
      String id, AddPropertyModel data, String token) async {
    try {
      final result =
          await remoteDataSource.updatePropertyRequest(id, data, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> updateProject(
      String id, AddPropertyModel data, String token) async {
    try {
      final result =
          await remoteDataSource.updateProjectRequest(id, data, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> deleteSingleAddInfo(
      String id, String token) async {
    try {
      final result = await remoteDataSource.removeSingleAddInfoApi(id, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> deleteSingleNearestLocation(
      String id, String token) async {
    try {
      final result =
          await remoteDataSource.removeSingleNearestLocationApi(id, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> deleteSinglePlan(
      String id, String token) async {
    try {
      final result = await remoteDataSource.removeSinglePlanApi(id, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<dynamic, String>> deleteSliderImage(
      String id, String token) async {
    try {
      final result = await remoteDataSource.removeSliderImageApi(id, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProperty(
      String id, String token) async {
    try {
      final result = await remoteDataSource.deleteProperty(id, token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Future<Either<Failure, PropertyChooseModel>> getPropertyChooseInfo(
      String token) async {
    try {
      final result = await remoteDataSource.getPropertyChooseInfo(token);
      final data = PropertyChooseModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
