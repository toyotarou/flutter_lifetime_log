import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_param.freezed.dart';

part 'app_param.g.dart';

@freezed
class AppParamState with _$AppParamState {
  const factory AppParamState({
    @Default('') String selectedYearlyCalendarDate,
  }) = _AppParamState;
}

@riverpod
class AppParam extends _$AppParam {
  ///
  @override
  AppParamState build() => const AppParamState();

  ///
  Future<void> setSelectedYearlyCalendarDate({required DateTime date}) async {
    state = state.copyWith(selectedYearlyCalendarDate: date.yyyymmdd);
  }
}
