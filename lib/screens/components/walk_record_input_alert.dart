import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lifetime_log/extensions/extensions.dart';

class WalkRecordInputAlert extends ConsumerStatefulWidget {
  const WalkRecordInputAlert({super.key, required this.date});

  final DateTime date;

  @override
  ConsumerState<WalkRecordInputAlert> createState() =>
      _WalkRecordInputAlertState();
}

class _WalkRecordInputAlertState extends ConsumerState<WalkRecordInputAlert> {
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

              Text('WalkRecordInputAlert'),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         Text(widget.date.yyyymmdd),
              //         const SizedBox(width: 20),
              //         _displayReloadButton(),
              //         const SizedBox(width: 10),
              //         _displayBetweenInputButton(),
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         if (errorMessage != '') ...[
              //           Text(
              //             errorMessage,
              //             style: const TextStyle(color: Colors.yellowAccent),
              //           ),
              //           const SizedBox(width: 20),
              //         ],
              //         GestureDetector(
              //           onTap: () async {
              //             await ref
              //                 .read(appParamProvider.notifier)
              //                 .setErrorMessage(msg: '');
              //
              //             final values = <String>[];
              //             lifetimeStringList.forEach((element) {
              //               if (element != '') {
              //                 values.add(element);
              //               }
              //             });
              //
              //             if (values.length == onedayHourNum) {
              //               await ref
              //                   .read(lifetimeProvider.notifier)
              //                   .inputLifetime(date: widget.date);
              //
              //               /// invalidateすることで表示内容が変更される
              //               ref.invalidate(dateLifetimeProvider(
              //                   date: widget.date.yyyymmdd));
              //
              //               Navigator.pop(context);
              //             } else {
              //               await ref
              //                   .read(appParamProvider.notifier)
              //                   .setErrorMessage(msg: 'cant save');
              //             }
              //           },
              //           child: const Icon(Icons.input),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 20),
              // Expanded(child: lifetimeInputParts()),
              // Divider(thickness: 2, color: Colors.white.withOpacity(0.4)),
              // lifetimeItemSetPanel(),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
