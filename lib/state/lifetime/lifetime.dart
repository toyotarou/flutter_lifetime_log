import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/lifetime.dart';
import '../../models/lifetime_item.dart';
import '../../utility/utility.dart';

part 'lifetime.freezed.dart';
part 'lifetime.g.dart';

@freezed
class LifetimeState with _$LifetimeState {
  const factory LifetimeState({
    LifetimeModel? lifetime,
    @Default([]) List<Lifetime> lifetimeList,
    @Default({}) Map<String, Lifetime> lifetimeMap,
    @Default([]) List<LifetimeItem> lifetimeItemList,
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
      final list = <LifetimeItem>[];

      // ignore: avoid_dynamic_calls
      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final val = LifetimeItem.fromJson(
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
