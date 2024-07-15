// ignore_for_file: avoid_dynamic_calls

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifetime_log/data/http/client.dart';
import 'package:lifetime_log/data/http/path.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/utility/utility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spend.freezed.dart';

part 'spend.g.dart';

@freezed
class SpendState with _$SpendState {
  const factory SpendState({
    @Default([]) List<Map<String, dynamic>> spendList,
  }) = _SpendState;
}

@riverpod
Future<SpendState> dateSpend(
  DateSpendRef ref, {
  required String date,
}) async {
  final utility = Utility();

  final client = ref.read(httpClientProvider);

  final list = <Map<String, dynamic>>[];

  await client.post(
    path: APIPath.getmonthSpendItem,
    body: {'date': date},
  ).then((value) {
    if (value['data'] != null) {
      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        if (value['data'][i] != null) {
          if (value['data'][i]['item'] != null) {
            for (var j = 0;
                j < value['data'][i]['item'].length.toString().toInt();
                j++) {
              if (value['data'][i]['date'] == date) {
                final exValue =
                    value['data'][i]['item'][j].toString().split('|');
                list.add({
                  'item': exValue[0],
                  'flag': exValue[1],
                  'price': exValue[2].toInt(),
                });
              }
            }
          }
        }
      }
    }
  }).catchError((error, _) {
    utility.showError('予期せぬエラーが発生しました');
  });

  return Future.value(SpendState(spendList: list));
}
