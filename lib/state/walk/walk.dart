// ignore_for_file: avoid_dynamic_calls

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifetime_log/data/http/client.dart';
import 'package:lifetime_log/data/http/path.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/models/walk.dart';
import 'package:lifetime_log/utility/utility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'walk.freezed.dart';

part 'walk.g.dart';

@freezed
class WalkState with _$WalkState {
  const factory WalkState({WalkModel? walk}) = _WalkState;
}

@riverpod
Future<WalkState> dateWalk(
  DateWalkRef ref, {
  required String date,
}) async {
  final utility = Utility();

  final client = ref.read(httpClientProvider);

  var walkModel = WalkModel(
      date: DateTime.now(),
      step: 0,
      distance: 0,
      timeplace: '',
      temple: '',
      mercari: '',
      train: '',
      spend: '');

  await client.post(path: APIPath.getWalkRecord2).then((value) {
    for (var i = 0; i < value.length.toString().toInt(); i++) {
      if (value[i] != null) {
        final model = WalkModel.fromJson(
          value[i] as Map<String, dynamic>,
        );

        if (model.date.yyyymmdd == date) {
          walkModel = model;
        }
      }
    }
  }).catchError((error, _) {
    utility.showError('予期せぬエラーが発生しました');
  });

  return Future.value(WalkState(walk: walkModel));
}
