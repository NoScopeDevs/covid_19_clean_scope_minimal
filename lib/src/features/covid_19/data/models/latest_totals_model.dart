import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/latest_totals.dart';

part 'latest_totals_model.g.dart';

@JsonSerializable(nullable: false)

///Model class that performs json parsing operations
class LatestTotalsModel extends LatestTotals {
  ///Totals model have the information of json parsed models
  LatestTotalsModel({
    @required int confirmed,
    @required int recovered,
    @required int critical,
    @required int deaths,
    @required DateTime lastChange,
    @required DateTime lastUpdate,
  }) : super(
          confirmed: confirmed,
          recovered: recovered,
          critical: critical,
          deaths: deaths,
          lastChange: lastChange,
          lastUpdate: lastUpdate,
        );

  ///Get a `TotalsModel` from json
  factory LatestTotalsModel.fromJson(Map<String, dynamic> json) =>
      _$LatestTotalsModelFromJson(json);

  ///Get a `Map<String,dyanamic>` from `TotalsModel`
  Map<String, dynamic> toJson() => _$LatestTotalsModelToJson(this);
}
