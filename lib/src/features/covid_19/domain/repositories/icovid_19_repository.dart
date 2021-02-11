import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../entities/latest_totals.dart';

/// Repository interface for covid_19
abstract class ICovid19Repository {
  ///get totals data
  Future<Either<Failure, LatestTotals>> getTotalsData();
}
