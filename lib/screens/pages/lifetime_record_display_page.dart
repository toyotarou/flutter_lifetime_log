// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/screens/components/lifetime_record_display_alert.dart';
import 'package:lifetime_log/screens/components/lifetime_record_input_alert.dart';
import 'package:lifetime_log/screens/parts/_lifetime_dialog.dart';
import 'package:lifetime_log/screens/parts/lifetime_display_parts.dart';
import 'package:lifetime_log/state/app_param/app_param.dart';
import 'package:lifetime_log/state/lifetime/lifetime.dart';
import 'package:lifetime_log/state/spend_time_place/spend_time_place.dart';

class LifetimeRecordDisplayPage extends ConsumerWidget {
  LifetimeRecordDisplayPage({super.key, required this.date});

  final DateTime date;

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

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
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(width: context.screenSize.width),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          '${date.yyyymmdd}（${date.youbiStr.substring(0, 3)}）'),
                      IconButton(
                        onPressed: () {
                          LifetimeDialog(
                            context: context,
                            widget: LifetimeRecordInputAlert(date: date),
                            clearBarrierColor: true,
                          );
                        },
                        icon: Icon(Icons.input,
                            color: Colors.white.withOpacity(0.6)),
                      ),
                    ],
                  ),
                  Expanded(child: _displayLifetime()),
                ],
              ),
              Column(
                children: [
                  Expanded(child: Container()),
                  _displayNextButton(),
                  Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayLifetime() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _displayLifetimeRecord()),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(5),
                  child: _displayTimeplace(),
                ),
              ],
            )),
      ],
    );
  }

  ///
  Widget _displayLifetimeRecord() {
    final dateLifetime = _ref.watch(dateLifetimeProvider(date: date.yyyymmdd)
        .select((value) => value.value));

    if (dateLifetime != null) {
      if (dateLifetime.lifetime != null) {
        return LifetimeDisplayParts(
            lifetime: dateLifetime.lifetime, textDisplay: true);
      }
    }

    return Container();
  }

  ///
  Widget _displayTimeplace() {
    final list = <Widget>[];

    final dateSpendTimePlace = _ref.watch(
        dateSpendTimePlaceProvider(date: date.yyyymmdd)
            .select((value) => value.value));

    if (dateSpendTimePlace != null) {
      dateSpendTimePlace.spendTimePlaceList.forEach((element) {
        list.add(Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 60, child: Text(element.time)),
              Expanded(child: Text(element.place)),
              Container(
                  alignment: Alignment.topRight,
                  width: 40,
                  child: Text(element.price.toString().toCurrency())),
            ],
          ),
        ));
      });
    }

    return SingleChildScrollView(child: Column(children: list));
  }

  ///
  Widget _displayNextButton() {
    final selectedYearlyCalendarDate = _ref.watch(
        appParamProvider.select((value) => value.selectedYearlyCalendarDate));

    var dayDiff = 0;

    if (selectedYearlyCalendarDate != '') {
      dayDiff = date
          .difference(DateTime.parse('$selectedYearlyCalendarDate 00:00:00'))
          .inDays;
    }

    return Column(
      children: [
        if (dayDiff == -3 && selectedYearlyCalendarDate != '') ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () async {
                  await _ref
                      .read(appParamProvider.notifier)
                      .setSelectedYearlyCalendarDate(
                        date: DateTime.parse(
                                '$selectedYearlyCalendarDate 00:00:00')
                            .add(
                          const Duration(days: -7),
                        ),
                      );

                  if (_context.mounted) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(_context);

                    await LifetimeDialog(
                      // ignore: use_build_context_synchronously
                      context: _context,
                      widget: LifetimeRecordDisplayAlert(
                        date: DateTime.parse(
                                '$selectedYearlyCalendarDate 00:00:00')
                            .add(const Duration(days: -7)),
                        beforeNextPageIndex: 6,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.navigate_before,
                    color: Colors.greenAccent),
              ),
              Container(),
            ],
          ),
        ],
        if (dayDiff == 3 && selectedYearlyCalendarDate != '') ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              IconButton(
                onPressed: () async {
                  await _ref
                      .read(appParamProvider.notifier)
                      .setSelectedYearlyCalendarDate(
                        date: DateTime.parse(
                                '$selectedYearlyCalendarDate 00:00:00')
                            .add(
                          const Duration(days: 7),
                        ),
                      );

                  if (_context.mounted) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(_context);

                    await LifetimeDialog(
                      // ignore: use_build_context_synchronously
                      context: _context,
                      widget: LifetimeRecordDisplayAlert(
                        date: DateTime.parse(
                                '$selectedYearlyCalendarDate 00:00:00')
                            .add(const Duration(days: 7)),
                        beforeNextPageIndex: 0,
                      ),
                    );
                  }
                },
                icon:
                    const Icon(Icons.navigate_next, color: Colors.greenAccent),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
