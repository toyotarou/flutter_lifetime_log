import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifetime_log/data/http/client.dart';
import 'package:lifetime_log/data/http/path.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/models/salary.dart';
import 'package:lifetime_log/utility/utility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'salary.freezed.dart';
part 'salary.g.dart';

@freezed
class SalaryState with _$SalaryState {
  const factory SalaryState({
    @Default([]) List<SalaryModel> salaryList,
    @Default({}) Map<String, SalaryModel> salaryMap,
  }) = _SalaryState;
}

@riverpod
class Salary extends _$Salary {
  final utility = Utility();

  ///
  @override
  SalaryState build() => const SalaryState();

  ///
  Future<void> getSalary() async {
    final client = ref.read(httpClientProvider);

    await client.post(path: APIPath.getsalary).then((value) {
      final map = <String, SalaryModel>{};

      // ignore: avoid_dynamic_calls
      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final val = SalaryTotalModel.fromJson(
          // ignore: avoid_dynamic_calls
          value['data'][i] as Map<String, dynamic>,
        );

        final exSalary = val.salary.split('|');

        for (var i = 0; i < exSalary.length; i++) {
          final ym = '${val.year}-${(i + 1).toString().padLeft(2, '0')}';
          map[ym] = SalaryModel(yearmonth: ym, salary: exSalary[i]);
        }
      }

      state = state.copyWith(salaryMap: map);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}
