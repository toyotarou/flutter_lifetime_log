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
  }) = _LifetimeState;
}

@riverpod
class Lifetime extends _$Lifetime {
  final utility = Utility();

  ///
  @override
  LifetimeState build() => const LifetimeState();

  ///
  Future<void> getLifetimeItem() async {
    final client = ref.read(httpClientProvider);

    await client.post(path: APIPath.getLifetimeRecordItem).then((value) {
      final list = <LifetimeItemModel>[];

      // ignore: avoid_dynamic_calls
      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final val = LifetimeItemModel.fromJson(
          // ignore: avoid_dynamic_calls
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
      final map = <String, LifetimeModel>{};

      // ignore: avoid_dynamic_calls
      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final model = LifetimeModel.fromJson(
          // ignore: avoid_dynamic_calls
          value['data'][i] as Map<String, dynamic>,
        );

        map['${model.year}-${model.month}-${model.day}'] = model;
      }

      state = state.copyWith(lifetimeMap: map);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> getLifetimeYearlyRecord({required DateTime date}) async {
    final client = ref.read(httpClientProvider);

    await client.post(
      path: APIPath.getLifetimeYearlyRecord,
      body: {'date': date.yyyymmdd},
    ).then((value) {
      final map = <String, LifetimeModel>{};

      // ignore: avoid_dynamic_calls
      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final model = LifetimeModel.fromJson(
          // ignore: avoid_dynamic_calls
          value['data'][i] as Map<String, dynamic>,
        );

        map['${model.year}-${model.month}-${model.day}'] = model;
      }

      state = state.copyWith(lifetimeMap: map);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }

  ///
  Future<void> getDailyLifetime({required DateTime date}) async {
    final client = ref.read(httpClientProvider);

    await client.post(
      path: APIPath.getLifetimeDateRecord,
      body: {'date': date.yyyymmdd},
    ).then((value) {
      final model = LifetimeModel.fromJson(
        // ignore: avoid_dynamic_calls
        value['data'] as Map<String, dynamic>,
      );

      state = state.copyWith(lifetime: model);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}
