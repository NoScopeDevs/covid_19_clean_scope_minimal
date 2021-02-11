import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:meta/meta.dart';

import '../domain.dart';
import '../repositories/icovid_19_repository.dart';

///Use case for covid latest totals
class GetCovidLatestTotals {
  ///This will get the covid  latest totals
  GetCovidLatestTotals({@required this.repository})
      : assert(repository != null);

  ///Covid19 Repositorye
  final ICovid19Repository repository;

  /// Callable class method
  Future<Either<Failure, LatestTotals>> call() async {
    return await repository.getTotalsData();
  }
}
