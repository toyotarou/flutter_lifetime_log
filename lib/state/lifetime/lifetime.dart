// ignore_for_file: avoid_dynamic_calls

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifetime_log/data/http/client.dart';
import 'package:lifetime_log/data/http/path.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/models/lifetime.dart';
import 'package:lifetime_log/models/lifetime_item.dart';
import 'package:lifetime_log/utility/utility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lifetime.freezed.dart';

part 'lifetime.g.dart';

@freezed
class LifetimeState with _$LifetimeState {
  const factory LifetimeState({
    LifetimeModel? lifetime,
    @Default([]) List<LifetimeModel> lifetimeList,
    @Default({}) Map<String, LifetimeModel> lifetimeMap,
    @Default([]) List<LifetimeItemModel> lifetimeItemList,
    @Default(0) int itemPos,
    @Default([]) List<String> lifetimeStringList,
  }) = _LifetimeState;
}

@riverpod
class Lifetime extends _$Lifetime {
  final utility = Utility();

  ///
  @override
  LifetimeState build() {
    final list = List.generate(24, (index) => '');

    return LifetimeState(lifetimeStringList: list);
  }

  ///
  Future<void> getLifetimeItem() async {
    final client = ref.read(httpClientProvider);

    await client.post(path: APIPath.getLifetimeRecordItem).then((value) {
      final list = <LifetimeItemModel>[];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final val = LifetimeItemModel.fromJson(
          value['data'][i] as Map<String, dynamic>,
        );

        list.add(val);
      }

      state = state.copyWith(lifetimeItemList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> getAllLifetimeRecord() async {
    final client = ref.read(httpClientProvider);

    await client.post(path: APIPath.getAllLifetimeRecord).then((value) {
      final list = <LifetimeModel>[];
      final map = <String, LifetimeModel>{};

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final model = LifetimeModel.fromJson(
          value['data'][i] as Map<String, dynamic>,
        );

        list.add(model);
        map['${model.year}-${model.month}-${model.day}'] = model;
      }

      state = state.copyWith(lifetimeList: list, lifetimeMap: map);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> setItemPos({required int pos}) async =>
      state = state.copyWith(itemPos: pos);

  ///
  Future<void> setLifetimeStringList(
      {required int pos, required String item}) async {
    final items = <String>[...state.lifetimeStringList];
    items[pos] = item;
    state = state.copyWith(lifetimeStringList: items);
  }

  ///
  Future<void> inputLifetime({required DateTime date}) async {
    final client = ref.read(httpClientProvider);

    final items = <String?>[...state.lifetimeStringList];

    final uploadData = <String, dynamic>{};
    uploadData['date'] = date.yyyymmdd;
    uploadData['lifetime'] = items.join('|');

    await client
        .post(path: APIPath.insertLifetime, body: uploadData)
        .then((value) {})
        .catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}

//------------------------------------------------------------------//

@riverpod
Future<LifetimeState> dateLifetime(
  DateLifetimeRef ref, {
  required String date,
}) async {
  final utility = Utility();

  var lifetimeModel = LifetimeModel(
    id: 0,
    year: '',
    month: '',
    day: '',
    hour00: '',
    hour01: '',
    hour02: '',
    hour03: '',
    hour04: '',
    hour05: '',
    hour06: '',
    hour07: '',
    hour08: '',
    hour09: '',
    hour10: '',
    hour11: '',
    hour12: '',
    hour13: '',
    hour14: '',
    hour15: '',
    hour16: '',
    hour17: '',
    hour18: '',
    hour19: '',
    hour20: '',
    hour21: '',
    hour22: '',
    hour23: '',
  );

  final client = ref.read(httpClientProvider);

  await client.post(
    path: APIPath.getLifetimeDateRecord,
    body: {'date': date},
  ).then((value) {
    if (value['data'] != null) {
      final model = LifetimeModel.fromJson(
        value['data'] as Map<String, dynamic>,
      );

      lifetimeModel = model;
    }
  }).catchError((error, _) {
    utility.showError('予期せぬエラーが発生しました');
  });

  return Future.value(LifetimeState(lifetime: lifetimeModel));
}
