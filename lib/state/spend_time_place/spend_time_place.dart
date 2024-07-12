// ignore_for_file: avoid_dynamic_calls

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifetime_log/data/http/client.dart';
import 'package:lifetime_log/data/http/path.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/models/spend_time_place.dart';
import 'package:lifetime_log/utility/utility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spend_time_place.freezed.dart';

part 'spend_time_place.g.dart';

@freezed
class SpendTimePlaceState with _$SpendTimePlaceState {
  const factory SpendTimePlaceState({
    @Default([]) List<SpendTimePlaceModel> spendTimePlaceList,
    @Default({}) Map<String, List<SpendTimePlaceModel>> spendTimePlaceMap,
  }) = _SpendTimePlaceState;
}

@riverpod
Future<SpendTimePlaceState> dateSpendTimePlace(
  DateSpendTimePlaceRef ref, {
  required String date,
}) async {
  final utility = Utility();

  final client = ref.read(httpClientProvider);

  final list = <SpendTimePlaceModel>[];
  final map = <String, List<SpendTimePlaceModel>>{};

  await client.post(
    path: APIPath.getmonthlytimeplace,
    body: {'date': date},
  ).then((value) {
    if (value['data'] != null) {
      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        if (value['data'][i] != null) {
          final model = SpendTimePlaceModel.fromJson(
            value['data'][i] as Map<String, dynamic>,
          );

          if (model.date.yyyymmdd == date) {
            list.add(model);
            map[model.date.yyyymmdd] = [];
          }
        }
      }

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        if (value['data'][i] != null) {
          final model = SpendTimePlaceModel.fromJson(
            value['data'][i] as Map<String, dynamic>,
          );

          if (model.date.yyyymmdd == date) {
            map[model.date.yyyymmdd]?.add(model);
          }
        }
      }
    }
  }).catchError((error, _) {
    utility.showError('予期せぬエラーが発生しました');
  });

  return Future.value(SpendTimePlaceState(
    spendTimePlaceList: list,
    spendTimePlaceMap: map,
  ));
}
