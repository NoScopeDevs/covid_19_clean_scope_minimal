// ignore_for_file: public_member_api_docs
import 'package:dio/dio.dart';
import 'package:errors/errors.dart';

import '../models/latest_totals_model.dart';

abstract class IRemoteDataSource {
  /// https://covid-19-data.p.rapidapi.com/totals
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LatestTotalsModel> getCovidLatestData();
}

class RemoteDataSource implements IRemoteDataSource {
  final dio = Dio();

  @override
  Future<LatestTotalsModel> getCovidLatestData() =>
      _getDataFromUrl('https://covid-19-data.p.rapidapi.com/totals');

  Future<LatestTotalsModel> _getDataFromUrl(String url) async {
    final response = await dio.get(
      url,
      options: Options(headers: {
        'Content-Type': 'application/json',
        'x-rapidapi-key': 'b778c6faf7msh344ad66a9ae4580p1b8e61jsn60eca30436fe',
        'x-rapidapi-host': 'covid-19-data.p.rapidapi.com',
        'useQueryString': true,
      }),
    );

    if (response.statusCode == 200) {
      return LatestTotalsModel.fromJson(response.data[0]);
    } else {
      throw ServerException();
    }
  }
}
