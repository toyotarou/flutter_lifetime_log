import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifetime_log/data/http/client.dart';
import 'package:lifetime_log/data/http/path.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/models/work_time.dart';
import 'package:lifetime_log/utility/utility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'worktime.freezed.dart';

part 'worktime.g.dart';

@freezed
class WorktimeState with _$WorktimeState {
  const factory WorktimeState({
    @Default([]) List<WorkTimeModel> worktimeList,
    @Default({}) Map<String, WorkTimeModel> worktimeMap,
  }) = _WorktimeState;
}

@riverpod
class Worktime extends _$Worktime {
  final utility = Utility();

  ///
  @override
  WorktimeState build() => const WorktimeState();

  ///
  Future<void> getWorktime() async {
    final client = ref.read(httpClientProvider);

    await client.post(path: APIPath.worktimesummary).then((value) {
      final list = <WorkTimeModel>[];
      final map = <String, WorkTimeModel>{};

      // ignore: avoid_dynamic_calls
      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        final exValue = value['data'][i].toString().split(';');

        final exLastValue = exValue[exValue.length - 1].split('/');
        final dataList = <WorkTimeDataModel>[];
        exLastValue.forEach((element) {
          final exElement = element.split('|');

          dataList.add(WorkTimeDataModel(
            day: exElement[0],
            start: exElement[1],
            end: exElement[2],
            workTime: exElement[3],
            restMinute: exElement[4],
            youbiNum: exElement[5],
          ));
        });

        final workTimeModel = WorkTimeModel(
          yearmonth: exValue[0],
          totalTime: exValue[1],
          agentName: exValue[2],
          genbaName: exValue[3],
          salary: exValue[4],
          tanka: exValue[5],
          data: [],
        );

        list.add(workTimeModel);
        map[workTimeModel.yearmonth] = workTimeModel;
      }

      state = state.copyWith(
        worktimeList: list,
        worktimeMap: map,
      );
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}

//
//
// class WorkTimeModel {
//   WorkTimeModel({
//     required this.yearmonth,
//     required this.totalTime,
//     required this.agentName,
//     required this.genbaName,
//     required this.salary,
//     required this.tanka,
//     required this.data,
//   });
//
//   String yearmonth;
//   String totalTime;
//   String agentName;
//   String genbaName;
//   String salary;
//   String tanka;
//   List<WorkTimeData> data;
// }
//
// class WorkTimeData {
//   WorkTimeData({
//     required this.day,
//     required this.start,
//     required this.end,
//     required this.workTime,
//     required this.restMinute,
//     required this.youbiNum,
//   });
//
//   String day;
//   String start;
//   String end;
//   String workTime;
//   String restMinute;
//   String youbiNum;
// }

/*
        "2024-01;
        131.75;
        ココナラ;
        NTT DATA;
        ;
        ;

        01(月)|||||1|0/
        02(火)|||||2|0/
        03(水)|||||3|0/
        04(木)|||||4|0/05(金)|||||5|0/06(土)|||||6|0/07(日)|||||0|0/08(月)|||||1|0/

        09(火)|
        09:30|
        18:00|
        7.5|
        60|
        2|
        */
