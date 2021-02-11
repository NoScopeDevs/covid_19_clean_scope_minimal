import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:errors/errors.dart';

import '../../domain/domain.dart';
import '../datasources/remote_data_source.dart';

typedef _GetLatestTotals = Future<LatestTotals> Function();

/// Covid_19 repository implementation
class Covid19Repository implements ICovid19Repository {
  /// Covid_19 repository constructor
  Covid19Repository({
    @required this.remoteDataSource,
  }) : assert(remoteDataSource != null);

  ///Remote that source that makes api call
  final IRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, LatestTotals>> getTotalsData() {
    return getCovidData(remoteDataSource.getCovidLatestData);
  }

  ///Get the latest data on covid cases
  Future<Either<Failure, LatestTotals>> getCovidData(
    _GetLatestTotals getLatestTotals,
  ) async {
    try {
      final latestTotals = await getLatestTotals();
      return Right(latestTotals);
    } on ServerException {
      return Left(ServerFailure());
    } on DioError {
      return Left(ServerFailure());
    }
  }
}
