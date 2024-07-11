import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifetime_log/const/const.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/screens/components/yearly_calendar_alert.dart';
import 'package:lifetime_log/screens/parts/_lifetime_dialog.dart';
import 'package:lifetime_log/state/app_param/app_param.dart';
import 'package:lifetime_log/state/genba_name/genba_name.dart';
import 'package:lifetime_log/state/lifetime/lifetime.dart';
import 'package:lifetime_log/state/salary/salary.dart';
import 'package:lifetime_log/state/worktime/worktime.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final controller = ItemScrollController();
  final listener = ItemPositionsListener.create();

  List<int> yearList = [];

  Map<String, int> recentlyWorkTimeMap = {};

  ///
  @override
  void initState() {
    super.initState();

    ref.read(genbaNameProvider.notifier).getGenbaName();

    ref.read(worktimeProvider.notifier).getWorktime();

    ref.read(lifetimeProvider.notifier).getAllLifetimeRecord();

    ref.read(salaryProvider.notifier).getSalary();
  }

  @override
  Widget build(BuildContext context) {
    yearList = [];

    for (var i = appStartYear; i <= DateTime.now().year; i++) {
      yearList.add(i);
    }

    makeRecentlyWorkTimeMap();

    final homeGenbaNameDisplay = ref
        .watch(appParamProvider.select((value) => value.homeGenbaNameDisplay));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            ref
                                .read(appParamProvider.notifier)
                                .setHomeGenbaNameDisplay(
                                    flag: !homeGenbaNameDisplay);
                          },
                          icon: const Icon(Icons.check_box_outline_blank),
                        ),
                        IconButton(
                          onPressed: () {
                            LifetimeDialog(
                              context: context,
                              widget: const YearlyCalendarAlert(),
                            );
                          },
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ],
                ),
                displayYearButtons(),
                const SizedBox(height: 10),
                Expanded(
                  child: displayWorkTimeRecord(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget displayYearButtons() {
    final list = <Widget>[];

    yearList.forEach((element) {
      list.add(Row(
        children: [
          GestureDetector(
            onTap: () {
              controller.jumpTo(
                index: yearList.indexWhere((element2) => element2 == element),
              );
            },
            child: CircleAvatar(
              child: Text(
                element.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ));
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: list),
    );
  }

  ///
  Widget displayWorkTimeRecord() {
    final genbaNameMap =
        ref.watch(genbaNameProvider.select((value) => value.genbaNameMap));

    final worktimeMap =
        ref.watch(worktimeProvider.select((value) => value.worktimeMap));

    final salaryMap =
        ref.watch(salaryProvider.select((value) => value.salaryMap));

    final homeGenbaNameDisplay = ref
        .watch(appParamProvider.select((value) => value.homeGenbaNameDisplay));

    return ScrollablePositionedList.builder(
      scrollDirection: Axis.horizontal,
      itemCount: yearList.length,
      itemScrollController: controller,
      itemPositionsListener: listener,
      // ItemPositionsListenerでスクロールを監視
      itemBuilder: (context, index) {
        final age = yearList[index] - birthday.year;

        return Container(
          margin: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: context.screenSize.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(yearList[index].toString()),
                    Text(
                      '${age - 1} / $age 歳',
                      style: TextStyle(
                        color: Colors.orangeAccent.withOpacity(0.5),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(12, (index) => index).map((e) {
                  final ym =
                      '${yearList[index]}-${(e + 1).toString().padLeft(2, '0')}';

                  final textOpacity = homeGenbaNameDisplay ? '0.5' : '1';

                  return Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                width: context.screenSize.width / 6,
                                alignment: Alignment.topLeft,
                                child: (salaryMap[ym] == null)
                                    ? Container()
                                    : Text(
                                        salaryMap[ym]!.salary,
                                        style: TextStyle(
                                          color: const Color(0xFFFBB6CE)
                                              .withOpacity(
                                                  textOpacity.toDouble()),
                                        ),
                                      ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: context.screenSize.width / 8,
                                alignment: Alignment.topLeft,
                                child: (worktimeMap[ym] == null)
                                    ? Container()
                                    : Text(
                                        (worktimeMap[ym]!.totalTime == '0.0')
                                            ? ''
                                            : (recentlyWorkTimeMap[ym] != null)
                                                ? recentlyWorkTimeMap[ym]
                                                    .toString()
                                                : worktimeMap[ym]!.totalTime,
                                        style: TextStyle(
                                          color: Colors.yellowAccent
                                              .withOpacity(
                                                  textOpacity.toDouble()),
                                        ),
                                      ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: context.screenSize.width / 15,
                                alignment: Alignment.topRight,
                                child: Text(
                                  (e + 1).toString().padLeft(2, '0'),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: context.screenSize.width / 2,
                        height: context.screenSize.height / 20,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          color: ((e + 1) == 8)
                              ? Colors.orangeAccent.withOpacity(0.1)
                              : Colors.transparent,
                        ),
                        child: (genbaNameMap[ym] == null)
                            ? Container()
                            : DefaultTextStyle(
                                style: const TextStyle(fontSize: 12),
                                child: (homeGenbaNameDisplay == false)
                                    ? Container()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            genbaNameMap[ym]!.genba,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            genbaNameMap[ym]!.company,
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
        );
      },
    );
  }

  ///
  void makeRecentlyWorkTimeMap() {
    final map = <String, int>{};

    ref
        .watch(lifetimeProvider.select((value) => value.lifetimeMap))
        .forEach((key, value) {
      var i = 0;

      if (value.hour00 == '仕事') {
        i++;
      }

      if (value.hour01 == '仕事') {
        i++;
      }

      if (value.hour02 == '仕事') {
        i++;
      }

      if (value.hour03 == '仕事') {
        i++;
      }

      if (value.hour04 == '仕事') {
        i++;
      }

      if (value.hour05 == '仕事') {
        i++;
      }

      if (value.hour06 == '仕事') {
        i++;
      }

      if (value.hour07 == '仕事') {
        i++;
      }

      if (value.hour08 == '仕事') {
        i++;
      }

      if (value.hour09 == '仕事') {
        i++;
      }

      if (value.hour10 == '仕事') {
        i++;
      }

      if (value.hour11 == '仕事') {
        i++;
      }

      if (value.hour12 == '仕事') {
        i++;
      }

      if (value.hour13 == '仕事') {
        i++;
      }

      if (value.hour14 == '仕事') {
        i++;
      }

      if (value.hour15 == '仕事') {
        i++;
      }

      if (value.hour16 == '仕事') {
        i++;
      }

      if (value.hour17 == '仕事') {
        i++;
      }

      if (value.hour18 == '仕事') {
        i++;
      }

      if (value.hour19 == '仕事') {
        i++;
      }

      if (value.hour20 == '仕事') {
        i++;
      }

      if (value.hour21 == '仕事') {
        i++;
      }

      if (value.hour22 == '仕事') {
        i++;
      }

      if (value.hour23 == '仕事') {
        i++;
      }

      map[key] = i;
    });

    final map2 = <String, List<int>>{};

    map
      ..forEach((key, value) {
        final exKey = key.split('-');
        map2['${exKey[0]}-${exKey[1]}'] = [];
      })
      ..forEach((key, value) {
        final exKey = key.split('-');
        map2['${exKey[0]}-${exKey[1]}']?.add(value);
      });

    map2.forEach((key, value) {
      var total = 0;
      value.forEach((element) {
        total += element;
      });

      recentlyWorkTimeMap[key] = total;
    });
  }
}
