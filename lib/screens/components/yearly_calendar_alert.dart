import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lifetime_log/screens/pages/yearly_calendar_page.dart';
import 'package:lifetime_log/screens/parts/colored_tabbar.dart';

class TabInfo {
  TabInfo(this.label, this.widget);

  String label;
  Widget widget;
}

class YearlyCalendarAlert extends ConsumerStatefulWidget {
  const YearlyCalendarAlert({super.key});

  @override
  ConsumerState<YearlyCalendarAlert> createState() =>
      _YearlyCalendarAlertState();
}

class _YearlyCalendarAlertState extends ConsumerState<YearlyCalendarAlert> {
  List<TabInfo> tabs = [];

  ///
  @override
  Widget build(BuildContext context) {
    makeTab();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.transparent,
            //-------------------------//これを消すと「←」が出てくる（消さない）
            leading: const Icon(Icons.check_box_outline_blank,
                color: Colors.transparent),
            //-------------------------//これを消すと「←」が出てくる（消さない）

            bottom: ColoredTabBar(
              color: Colors.transparent,
              tabBar: TabBar(
                isScrollable: true,
                indicatorColor: Colors.blueAccent,
                tabs: tabs.map((TabInfo tab) => Tab(text: tab.label)).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(children: tabs.map((tab) => tab.widget).toList()),
      ),
    );
  }

  ///
  void makeTab() {
    tabs = [];

    final list = <int>[];

    for (var i = 2023; i <= DateTime.now().year; i++) {
      list.add(i);
    }

    list
      ..sort((a, b) => -1 * a.compareTo(b))
      ..forEach((element) {
        tabs.add(
          TabInfo(
            element.toString(),
            YearlyCalendarPage(date: DateTime(element)),
          ),
        );
      });
  }
}
