import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data.dart';
import '../domain/domain.dart';

import 'covid_19_state.dart';

part 'covid_19_state_notifier.dart';

///Data source
final _covidRemoteDataSourceProvider =
    Provider<IRemoteDataSource>((ref) => RemoteDataSource());

/// Repositories Providers
final _covidRepositoryProvider = Provider<ICovid19Repository>(
  (ref) => Covid19Repository(
    remoteDataSource: ref.watch(_covidRemoteDataSourceProvider),
  ),
);

/// Use Cases Providers
final _getCovidLatestTotalsProvider = Provider<GetCovidLatestTotals>(
  (ref) => GetCovidLatestTotals(
    repository: ref.watch(_covidRepositoryProvider),
  ),
);

/// Provider to use the Covid19StateNotifier
final covid19NotifierProvider = StateNotifierProvider(
  (ref) => Covid19Notifier(ref),
);
