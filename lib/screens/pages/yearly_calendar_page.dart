import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/screens/components/lifetime_record_display_alert.dart';
import 'package:lifetime_log/screens/parts/_lifetime_dialog.dart';
import 'package:lifetime_log/state/holiday/holiday_notifier.dart';
import 'package:lifetime_log/state/lifetime/lifetime.dart';
import 'package:lifetime_log/utility/utility.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class YearlyCalendarPage extends ConsumerStatefulWidget {
  const YearlyCalendarPage({super.key, required this.date});

  final DateTime date;

  @override
  ConsumerState<YearlyCalendarPage> createState() => _YearlyCalendarPageState();
}

class _YearlyCalendarPageState extends ConsumerState<YearlyCalendarPage> {
  DateTime yearFirst = DateTime.now();

  List<String> youbiList = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  List<String> days = [];

  final Utility _utility = Utility();

  final autoScrollController = AutoScrollController();

  List<GlobalKey> globalKeyList = [];

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  void initState() {
    super.initState();

    ref.read(lifetimeProvider.notifier).getAllLifetimeRecord();
  }

  ///
  @override
  Widget build(BuildContext context) {
    _context = context;
    _ref = ref;

    globalKeyList = List.generate(100, (index) => GlobalKey());

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.date.year == DateTime.now().year) {
        final diffDays =
            DateTime.now().difference(DateTime(DateTime.now().year)).inDays;
        final index = (diffDays / 7).floor();

        final target = globalKeyList[index].currentContext!;

        await Scrollable.ensureVisible(
          target,
          duration: const Duration(milliseconds: 1000),
        );
      }
    });

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
              Expanded(child: _getCalendar()),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _getCalendar() {
    yearFirst = DateTime(widget.date.yyyy.toInt());

    final yearEnd = DateTime(yearFirst.year + 1, 1, 0);

    final diff = yearEnd.difference(yearFirst).inDays;
    final yearDaysNum = diff + 1;

    final youbi = yearFirst.youbiStr;
    final youbiNum = youbiList.indexWhere((element) => element == youbi);

    final weekNum = ((yearDaysNum + youbiNum) / 7).ceil();

    days = List.generate(weekNum * 7, (index) => '');

    for (var i = 0; i < (weekNum * 7); i++) {
      if (i >= youbiNum) {
        final gendate = yearFirst.add(Duration(days: i - youbiNum));

        if (yearFirst.year == gendate.year) {
          days[i] = gendate.mmdd;
        }
      }
    }

    final list = <Widget>[];
    for (var i = 0; i < weekNum; i++) {
      list.add(_getRow(days: days, rowNum: i));
    }

    return SingleChildScrollView(
        controller: autoScrollController, child: Column(children: list));
  }

  ///
  Widget _getRow({required List<String> days, required int rowNum}) {
    final list = <Widget>[];

    for (var i = rowNum * 7; i < ((rowNum + 1) * 7); i++) {
      final exDays = (days[i] == '') ? <String>[] : days[i].split('-');

      list.add(
        Expanded(
          child: (days[i] == '')
              ? Container()
              : GestureDetector(
                  onTap: () async {
                    await LifetimeDialog(
                      dismiss: false,
                      context: _context,
                      widget: LifetimeRecordDisplayAlert(
                        date: DateTime.parse(
                          '${widget.date.yyyy}-${days[i]} 00:00:00',
                        ),
                      ),
                      clearBarrierColor: true,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: _getBorder(mmdd: days[i]),
                      color: _getBgColor(mmdd: days[i]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: _context.screenSize.height / 40),
                          child: Text(
                            (exDays[1] == '01') ? exDays[0] : days[i],
                            style: TextStyle(
                              fontSize: (exDays[1] == '01') ? 12 : 8,
                              color: (exDays[1] == '01')
                                  ? const Color(0xFFFBB6CE)
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _dispRowNum(mmdd: days[i], rowNum: rowNum),
                            _displayYellowMark(
                              date: DateTime.parse(
                                '${widget.date.yyyy}-${days[i]} 00:00:00',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      );
    }

    return Row(
      key: globalKeyList[rowNum],
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  ///
  Widget _displayYellowMark({required DateTime date}) {
    final lifetimeMap =
        ref.watch(lifetimeProvider.select((value) => value.lifetimeMap));

    if (lifetimeMap[date.yyyymmdd] != null) {
      return Icon(
        Icons.star,
        size: 8,
        color: Colors.yellowAccent.withOpacity(0.5),
      );
    }

    return Container();
  }

  ///
  Border _getBorder({required String mmdd}) {
    final genDate = DateTime.parse('${widget.date.yyyy}-$mmdd');

    return (genDate.yyyymmdd == DateTime.now().yyyymmdd)
        ? Border.all(color: Colors.orangeAccent.withOpacity(0.4), width: 2)
        : Border.all(color: Colors.white.withOpacity(0.2), width: 2);
  }

  ///
  Color _getBgColor({required String mmdd}) {
    if (mmdd == '') {
      return Colors.transparent;
    }

    final holidayState = _ref.watch(holidayProvider);

    final genDate = DateTime.parse('${widget.date.yyyy}-$mmdd');

    return _utility.getYoubiColor(
        date: genDate, youbiStr: genDate.youbiStr, holiday: holidayState.data);
  }

  ///
  Widget _dispRowNum({required String mmdd, required int rowNum}) {
    final genDate = DateTime.parse('${widget.date.yyyy}-$mmdd');

    return Text(
      (genDate.youbiStr == 'Sunday') ? (rowNum + 1).toString() : '',
      style: TextStyle(
        fontSize: 10,
        color: (genDate.youbiStr == 'Sunday')
            ? Colors.white.withOpacity(0.6)
            : Colors.transparent,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:lifetime_log/extensions/extensions.dart';
// import 'package:lifetime_log/models/lifetime.dart';
// import 'package:lifetime_log/screens/components/lifetime_record_display_alert.dart';
// import 'package:lifetime_log/screens/parts/_lifetime_dialog.dart';
// import 'package:lifetime_log/state/holiday/holiday_notifier.dart';
// import 'package:lifetime_log/utility/utility.dart';
// import 'package:scroll_to_index/scroll_to_index.dart';
//
// // ignore: must_be_immutable
// class YearlyCalendarPage extends ConsumerWidget {
//   YearlyCalendarPage(
//       {super.key, required this.date, required this.lifetimeMap});
//
//   final DateTime date;
//   final Map<String, LifetimeModel> lifetimeMap;
//
//   DateTime yearFirst = DateTime.now();
//
//   List<String> youbiList = [
//     'Sunday',
//     'Monday',
//     'Tuesday',
//     'Wednesday',
//     'Thursday',
//     'Friday',
//     'Saturday'
//   ];
//
//   List<String> days = [];
//
//   final Utility _utility = Utility();
//
//   final autoScrollController = AutoScrollController();
//
//   List<GlobalKey> globalKeyList = [];
//
//   late BuildContext _context;
//   late WidgetRef _ref;
//
//   ///
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     _context = context;
//     _ref = ref;
//
//     globalKeyList = List.generate(100, (index) => GlobalKey());
//
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       if (date.year == DateTime.now().year) {
//         final diffDays =
//             DateTime.now().difference(DateTime(DateTime.now().year)).inDays;
//         final index = (diffDays / 7).floor();
//
//         final target = globalKeyList[index].currentContext!;
//
//         await Scrollable.ensureVisible(
//           target,
//           duration: const Duration(milliseconds: 1000),
//         );
//       }
//     });
//
//     return AlertDialog(
//       titlePadding: EdgeInsets.zero,
//       contentPadding: EdgeInsets.zero,
//       backgroundColor: Colors.transparent,
//       insetPadding: EdgeInsets.zero,
//       content: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         width: double.infinity,
//         height: double.infinity,
//         child: DefaultTextStyle(
//           style: const TextStyle(fontSize: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               Container(width: context.screenSize.width),
//               Expanded(child: _getCalendar()),
//               const SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   ///
//   Widget _getCalendar() {
//     yearFirst = DateTime(date.yyyy.toInt());
//
//     final yearEnd = DateTime(yearFirst.year + 1, 1, 0);
//
//     final diff = yearEnd.difference(yearFirst).inDays;
//     final yearDaysNum = diff + 1;
//
//     final youbi = yearFirst.youbiStr;
//     final youbiNum = youbiList.indexWhere((element) => element == youbi);
//
//     final weekNum = ((yearDaysNum + youbiNum) / 7).ceil();
//
//     days = List.generate(weekNum * 7, (index) => '');
//
//     for (var i = 0; i < (weekNum * 7); i++) {
//       if (i >= youbiNum) {
//         final gendate = yearFirst.add(Duration(days: i - youbiNum));
//
//         if (yearFirst.year == gendate.year) {
//           days[i] = gendate.mmdd;
//         }
//       }
//     }
//
//     final list = <Widget>[];
//     for (var i = 0; i < weekNum; i++) {
//       list.add(_getRow(days: days, rowNum: i));
//     }
//
//     return SingleChildScrollView(
//         controller: autoScrollController, child: Column(children: list));
//   }
//
//   ///
//   Widget _getRow({required List<String> days, required int rowNum}) {
//     final list = <Widget>[];
//
//     for (var i = rowNum * 7; i < ((rowNum + 1) * 7); i++) {
//       final exDays = (days[i] == '') ? <String>[] : days[i].split('-');
//
//       list.add(
//         Expanded(
//           child: (days[i] == '')
//               ? Container()
//               : GestureDetector(
//                   onTap: () async {
//                     await LifetimeDialog(
//                       dismiss: false,
//                       context: _context,
//                       widget: LifetimeRecordDisplayAlert(
//                         date: DateTime.parse(
//                           '${date.yyyy}-${days[i]} 00:00:00',
//                         ),
//                       ),
//                       clearBarrierColor: true,
//                     );
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.all(3),
//                     padding: const EdgeInsets.all(3),
//                     decoration: BoxDecoration(
//                       border: _getBorder(mmdd: days[i]),
//                       color: _getBgColor(mmdd: days[i]),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ConstrainedBox(
//                           constraints: BoxConstraints(
//                               minHeight: _context.screenSize.height / 40),
//                           child: Text(
//                             (exDays[1] == '01') ? exDays[0] : days[i],
//                             style: TextStyle(
//                               fontSize: (exDays[1] == '01') ? 12 : 8,
//                               color: (exDays[1] == '01')
//                                   ? const Color(0xFFFBB6CE)
//                                   : Colors.white,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             _dispRowNum(mmdd: days[i], rowNum: rowNum),
//                             _displayYellowMark(
//                               date: DateTime.parse(
//                                 '${date.yyyy}-${days[i]} 00:00:00',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//         ),
//       );
//     }
//
//     return Row(
//       key: globalKeyList[rowNum],
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: list,
//     );
//   }
//
//   ///
//   Widget _displayYellowMark({required DateTime date}) {
//     if (lifetimeMap[date.yyyymmdd] != null) {
//       return Icon(
//         Icons.star,
//         size: 8,
//         color: Colors.yellowAccent.withOpacity(0.5),
//       );
//     }
//
//     return Container();
//   }
//
//   ///
//   Border _getBorder({required String mmdd}) {
//     final genDate = DateTime.parse('${date.yyyy}-$mmdd');
//
//     return (genDate.yyyymmdd == DateTime.now().yyyymmdd)
//         ? Border.all(color: Colors.orangeAccent.withOpacity(0.4), width: 2)
//         : Border.all(color: Colors.white.withOpacity(0.2), width: 2);
//   }
//
//   ///
//   Color _getBgColor({required String mmdd}) {
//     if (mmdd == '') {
//       return Colors.transparent;
//     }
//
//     final holidayState = _ref.watch(holidayProvider);
//
//     final genDate = DateTime.parse('${date.yyyy}-$mmdd');
//
//     return _utility.getYoubiColor(
//         date: genDate, youbiStr: genDate.youbiStr, holiday: holidayState.data);
//   }
//
//   ///
//   Widget _dispRowNum({required String mmdd, required int rowNum}) {
//     final genDate = DateTime.parse('${date.yyyy}-$mmdd');
//
//     return Text(
//       (genDate.youbiStr == 'Sunday') ? (rowNum + 1).toString() : '',
//       style: TextStyle(
//         fontSize: 10,
//         color: (genDate.youbiStr == 'Sunday')
//             ? Colors.white.withOpacity(0.6)
//             : Colors.transparent,
//       ),
//     );
//   }
// }
