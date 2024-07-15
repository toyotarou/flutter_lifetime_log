import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/state/walk/walk.dart';

class WalkRecordInputAlert extends ConsumerStatefulWidget {
  const WalkRecordInputAlert({super.key, required this.date});

  final DateTime date;

  @override
  ConsumerState<WalkRecordInputAlert> createState() =>
      _WalkRecordInputAlertState();
}

class _WalkRecordInputAlertState extends ConsumerState<WalkRecordInputAlert> {
  TextEditingController stepEditingController = TextEditingController();
  TextEditingController distanceEditingController = TextEditingController();

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
              walkRecordInputParts(),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget walkRecordInputParts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        const Text('Steps'),
        const SizedBox(height: 5),
        TextField(
          style: const TextStyle(fontSize: 12),
          controller: stepEditingController,
          decoration: const InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            border: InputBorder.none,
          ),
        ),
        const SizedBox(height: 5),
        const Text('Distance'),
        const SizedBox(height: 5),
        TextField(
          style: const TextStyle(fontSize: 12),
          controller: distanceEditingController,
          decoration: const InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            border: InputBorder.none,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Row(
              children: [
                _displayReloadButton(),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    ref.read(walkProvider.notifier).inputWalkRecord(
                          date: widget.date,
                          steps: stepEditingController.text,
                          distance: distanceEditingController.text,
                        );

                    ref.invalidate(
                        dateWalkProvider(date: widget.date.yyyymmdd));

                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.input,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  ///
  Widget _displayReloadButton() {
    return GestureDetector(
      onTap: () {
        final dateWalk = ref.watch(dateWalkProvider(date: widget.date.yyyymmdd)
            .select((value) => value.value));

        if (dateWalk != null) {
          if (dateWalk.walk != null) {
            stepEditingController.text = dateWalk.walk!.step.toString();
            distanceEditingController.text = dateWalk.walk!.distance.toString();
          }
        }
      },
      child: Icon(
        Icons.refresh,
        color: Colors.white.withOpacity(0.6),
      ),
    );
  }
}
