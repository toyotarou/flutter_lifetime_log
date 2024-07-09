import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifetime_log/const/const.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/screens/parts/_lifetime_dialog.dart';
import 'package:lifetime_log/screens/yearly_calendar_alert.dart';
import 'package:lifetime_log/state/worktime/worktime.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(worktimeProvider.notifier).getWorktime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                IconButton(
                  onPressed: () {
                    LifetimeDialog(
                      context: context,
                      widget: YearlyCalendarAlert(),
                      clearBarrierColor: true,
                    );
                  },
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            Expanded(
              child: displayWorkTimeRecord(),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget displayWorkTimeRecord() {
    final list = <Widget>[];

    final worktimeMap =
        ref.watch(worktimeProvider.select((value) => value.worktimeMap));

    for (var i = appStartYear; i <= DateTime.now().year; i++) {
      list.add(
        Container(
          margin: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(i.toString()),
              ),
              Column(
                children: List.generate(12, (index) => index).map((e) {
                  final ym = '$i-${(e + 1).toString().padLeft(2, '0')}';

                  return Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            (e + 1).toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: context.screenSize.width / 2,
                        height: context.screenSize.height / 18,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        child: (worktimeMap[ym] == null)
                            ? Container()
                            : DefaultTextStyle(
                                style: const TextStyle(fontSize: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      worktimeMap[ym]!.genbaName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      worktimeMap[ym]!.agentName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: list),
    );
  }
}
