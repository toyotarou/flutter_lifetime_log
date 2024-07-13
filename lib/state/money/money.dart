// ignore_for_file: avoid_dynamic_calls

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifetime_log/data/http/client.dart';
import 'package:lifetime_log/data/http/path.dart';
import 'package:lifetime_log/models/money.dart';
import 'package:lifetime_log/utility/utility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'money.freezed.dart';

part 'money.g.dart';

@freezed
class MoneyState with _$MoneyState {
  const factory MoneyState({MoneyModel? money}) = _MoneyState;
}

@riverpod
Future<MoneyState> dateMoney(
  DateMoneyRef ref, {
  required String date,
}) async {
  final utility = Utility();

  final client = ref.read(httpClientProvider);

  var moneyModel = MoneyModel(
    yen10000: '',
    yen5000: '',
    yen2000: '',
    yen1000: '',
    yen500: '',
    yen100: '',
    yen50: '',
    yen10: '',
    yen5: '',
    yen1: '',
    bankA: '',
    bankB: '',
    bankC: '',
    bankD: '',
    bankE: '',
    payA: '',
    payB: '',
    payC: '',
    payD: '',
    payE: '',
    payF: '',
    sum: '',
  );

  await client.post(
    path: APIPath.moneydl,
    body: {'date': date},
  ).then((value) {
    if (value['data'] != null) {
      final model = MoneyModel.fromJson(
        value['data'] as Map<String, dynamic>,
      );

      moneyModel = model;
    }
  }).catchError((error, _) {
    utility.showError('予期せぬエラーが発生しました');
  });

  return Future.value(MoneyState(money: moneyModel));
}
