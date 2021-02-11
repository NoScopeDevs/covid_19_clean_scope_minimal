part of 'covid_19_provider.dart';

/// Defines all the Covid_19 logic the app will use
class Covid19Notifier extends StateNotifier<Covid19State> {
  /// Base constructor expects a [ProviderReference] to
  /// read its usecases and also defines inital state
  Covid19Notifier(ProviderReference ref)
      : assert(ref != null),
        _getCovidLatestTotals = ref.watch(_getCovidLatestTotalsProvider),
        super(const Covid19State.initial());

  /// use cases
  final GetCovidLatestTotals _getCovidLatestTotals;

  ///Method that increments the counter
  Future<void> getCovidData() async {
    state = const Covid19State.loading();
    final failureOrData = await _getCovidLatestTotals();
    state = _eitherLoadedOrErrorState(failureOrData);
  }

  Covid19State _eitherLoadedOrErrorState(
    Either<Failure, LatestTotals> failureOrTrivia,
  ) {
    return failureOrTrivia.fold(
      (failure) => Covid19State.error('Error occured: ${failure.toString()}'),
      (covid19Data) => Covid19State.data(latestTotals: covid19Data),
    );
  }
}
