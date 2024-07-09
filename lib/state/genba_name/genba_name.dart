import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifetime_log/data/http/client.dart';
import 'package:lifetime_log/data/http/path.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/models/genba_name.dart';
import 'package:lifetime_log/utility/utility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'genba_name.freezed.dart';

part 'genba_name.g.dart';

@freezed
class GenbaNameState with _$GenbaNameState {
  const factory GenbaNameState({
    @Default([]) List<GenbaNameModel> genbaNameList,
    @Default({}) Map<String, GenbaNameModel> genbaNameMap,
  }) = _GenbaNameState;
}

@riverpod
class GenbaName extends _$GenbaName {
  final utility = Utility();

  ///
  @override
  GenbaNameState build() => const GenbaNameState();

  ///
  Future<void> getGenbaName() async {
    final client = ref.read(httpClientProvider);

    await client.post(path: APIPath.workinggenbaname).then((value) {
      final list = <GenbaNameModel>[];
      final map = <String, GenbaNameModel>{};

      // ignore: avoid_dynamic_calls
      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final model = GenbaNameModel.fromJson(
          // ignore: avoid_dynamic_calls
          value['data'][i] as Map<String, dynamic>,
        );

        list.add(model);
        map[model.yearmonth] = model;
      }

      state = state.copyWith(genbaNameList: list, genbaNameMap: map);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}
