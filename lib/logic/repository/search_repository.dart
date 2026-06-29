import 'package:dartz/dartz.dart';

import '/presentation/error/failure.dart';
import '../../data/data_provider/remote_data_source.dart';
import '../../data/model/search_response_model/search_response_model.dart';
import '../../presentation/error/exception.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchOverviewModel>> getSearchProperty(Uri uri);

}

class SearchRepositoryImpl implements SearchRepository {
  final RemoteDataSource remoteDataSource;

  const SearchRepositoryImpl({required this.remoteDataSource});


  @override
  Future<Either<Failure, SearchOverviewModel>> getSearchProperty(Uri uri) async {
    try {
      final result = await remoteDataSource.getSearchProperty(uri);

      print(result);
      if (result != null) {
        final data = SearchOverviewModel.fromJson(result);

        return Right(data);
      } else {
        return Left(ServerFailure('Invalid response format', 500));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }



}
