import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/state/holiday/holiday_notifier.dart';
import 'package:lifetime_log/state/lifetime/lifetime.dart';
import 'package:lifetime_log/state/worktime/worktime.dart';
import 'package:lifetime_log/utility/utility.dart';

class WorkTimeDisplayAlert extends ConsumerStatefulWidget {
  const WorkTimeDisplayAlert({super.key, required this.yearmonth});

  final String yearmonth;

  @override
  ConsumerState<WorkTimeDisplayAlert> createState() =>
      _WorkingTimeDisplayAlertState();
}

class _WorkingTimeDisplayAlertState
    extends ConsumerState<WorkTimeDisplayAlert> {
  Utility utility = Utility();

  ///
  @override
  void initState() {
    super.initState();

    ref.read(lifetimeProvider.notifier).getAllLifetimeRecord();

    ref.read(worktimeProvider.notifier).getAllWorktime();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              Text(widget.yearmonth),
              Divider(
                color: Colors.white.withOpacity(0.5),
                thickness: 5,
              ),
              Expanded(child: _displayWorktimeList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayWorktimeList() {
    final list = <Widget>[];

    final holidayState = ref.watch(holidayProvider);

    final worktimeMap =
        ref.watch(worktimeProvider.select((value) => value.worktimeMap));

    if (worktimeMap[widget.yearmonth] != null) {
      worktimeMap[widget.yearmonth]!.data.forEach((element) {
        final exDay = element.day.split('(');
        final date = '${widget.yearmonth}-${exDay[0]}';

        final youbi = '$date 00:00:00'.toDateTime().youbiStr;

        list.add(Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
            color: utility.getYoubiColor(
              date: '$date 00:00:00'.toDateTime(),
              youbiStr: youbi,
              holiday: holidayState.data,
            ),
          ),
          child: Row(
            children: [
              Expanded(child: Text(element.day)),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(element.start),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(element.end),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(element.restMinute),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(element.workTime),
                ),
              ),
            ],
          ),
        ));
      });
    }

    return SingleChildScrollView(child: Column(children: list));
  }
}
