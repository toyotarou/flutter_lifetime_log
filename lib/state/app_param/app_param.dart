import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_param.freezed.dart';

part 'app_param.g.dart';

@freezed
class AppParamState with _$AppParamState {
  const factory AppParamState({
    @Default('') String selectedYearlyCalendarDate,
    @Default('') String selectedInputChoiceChip,
    @Default('') String errorMessage,
    @Default(true) bool homeGenbaNameDisplay,
  }) = _AppParamState;
}

@riverpod
class AppParam extends _$AppParam {
  ///
  @override
  AppParamState build() => const AppParamState();

  ///
  Future<void> setSelectedYearlyCalendarDate({required DateTime date}) async =>
      state = state.copyWith(selectedYearlyCalendarDate: date.yyyymmdd);

  ///
  Future<void> setSelectedInputChoiceChip({required String string}) async =>
      state = state.copyWith(selectedInputChoiceChip: string);

  ///
  Future<void> setErrorMessage({required String msg}) async =>
      state = state.copyWith(errorMessage: msg);

  ///
  Future<void> setHomeGenbaNameDisplay({required bool flag}) async =>
      state = state.copyWith(homeGenbaNameDisplay: flag);
}
