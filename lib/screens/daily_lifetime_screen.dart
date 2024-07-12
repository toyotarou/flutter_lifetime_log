import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/models/lifetime.dart';
import 'package:lifetime_log/state/lifetime/lifetime.dart';

class DailyLifetimeScreen extends ConsumerStatefulWidget {
  const DailyLifetimeScreen({super.key, required this.date});

  final DateTime date;

  @override
  ConsumerState<DailyLifetimeScreen> createState() =>
      _DailyLifetimeScreenState();
}

class _DailyLifetimeScreenState extends ConsumerState<DailyLifetimeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //
  //   getDailyLifetime();
  // }
  //
  // Future<void> getDailyLifetime() async {
  //   await ref
  //       .read(lifetimeProvider.notifier)
  //       .getDailyLifetime(date: widget.date);
  // }
  //
  //
  //
  //



  @override
  Widget build(BuildContext context) {
    final lifetime =
        ref.watch(lifetimeProvider.select((value) => value.lifetime));

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
              if (lifetime != null) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(lifetime.year),
                    Text(lifetime.month),
                    Text(lifetime.day),
                    const Divider(),
                    displayHourItem(lifetime: lifetime),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget displayHourItem({required LifetimeModel lifetime}) {
    final list = <Widget>[];

    final hourList = [
      lifetime.hour00,
      lifetime.hour01,
      lifetime.hour02,
      lifetime.hour03,
      lifetime.hour04,
      lifetime.hour05,
      lifetime.hour06,
      lifetime.hour07,
      lifetime.hour08,
      lifetime.hour09,
      lifetime.hour10,
      lifetime.hour11,
      lifetime.hour12,
      lifetime.hour13,
      lifetime.hour14,
      lifetime.hour15,
      lifetime.hour16,
      lifetime.hour17,
      lifetime.hour18,
      lifetime.hour19,
      lifetime.hour20,
      lifetime.hour21,
      lifetime.hour22,
      lifetime.hour23,
    ];

    for (var i = 0; i < hourList.length; i++) {
      list.add(getHourWidget(num: i, behavior: hourList[i]));
    }

    return Column(children: list);
  }

  Widget getHourWidget({required int num, required String behavior}) {
    return Row(
      children: [
        SizedBox(width: 20, child: Text(num.toString().padLeft(2, '0'))),
        const SizedBox(width: 20),
        Text(behavior),
      ],
    );
  }
}
