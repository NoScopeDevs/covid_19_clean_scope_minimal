import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/domain.dart';

part 'covid_19_state.freezed.dart';

@freezed
abstract class Covid19State with _$Covid19State {
  /// Data is present state
  const factory Covid19State.data({@required LatestTotals latestTotals}) = Data;

  /// Initial/default state
  const factory Covid19State.initial() = Initial;

  /// Data is loading state
  const factory Covid19State.loading() = Loading;

  /// Error when loading data state
  const factory Covid19State.error([String message]) = Error;
}
