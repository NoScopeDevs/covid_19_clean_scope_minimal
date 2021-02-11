// ignore_for_file: public_member_api_docs

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

///Class to represent the totals status of the covid19 data
class LatestTotals extends Equatable {
  ///Represents the statuses of the different totals from the covid 19 totals
  LatestTotals({
    @required this.confirmed,
    @required this.recovered,
    @required this.critical,
    @required this.deaths,
    @required this.lastChange,
    @required this.lastUpdate,
  });

  final int confirmed;
  final int recovered;
  final int critical;
  final int deaths;
  final DateTime lastChange;
  final DateTime lastUpdate;

  @override
  List<Object> get props => [
        confirmed,
        recovered,
        critical,
        deaths,
        lastChange,
        lastUpdate,
      ];
}
