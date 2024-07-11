// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifetime_log/extensions/extensions.dart';
import 'package:lifetime_log/state/app_param/app_param.dart';
import 'package:lifetime_log/state/lifetime/lifetime.dart';

class LifetimeRecordInputAlert extends ConsumerStatefulWidget {
  const LifetimeRecordInputAlert({super.key, required this.date});

  final DateTime date;

  @override
  ConsumerState<LifetimeRecordInputAlert> createState() =>
      _LifetimeRecordInputAlertState();
}

class _LifetimeRecordInputAlertState
    extends ConsumerState<LifetimeRecordInputAlert> {
  List<TextEditingController> tecs = [];

  int onedayHourNum = 24;

  ///
  @override
  void initState() {
    super.initState();

    ref.read(lifetimeProvider.notifier).getLifetimeItem();
  }

  ///
  @override
  Widget build(BuildContext context) {
    makeTecs();

    final errorMessage =
        ref.watch(appParamProvider.select((value) => value.errorMessage));

    final lifetimeStringList =
        ref.watch(lifetimeProvider.select((value) => value.lifetimeStringList));

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(widget.date.yyyymmdd),
                      const SizedBox(width: 20),
                      _displayReloadButton(),
                      const SizedBox(width: 10),
                      _displayBetweenInputButton(),
                    ],
                  ),
                  Row(
                    children: [
                      if (errorMessage != '') ...[
                        Text(
                          errorMessage,
                          style: const TextStyle(color: Colors.yellowAccent),
                        ),
                        const SizedBox(width: 20),
                      ],
                      GestureDetector(
                        onTap: () async {
                          await ref
                              .read(appParamProvider.notifier)
                              .setErrorMessage(msg: '');

                          final values = <String>[];
                          lifetimeStringList.forEach((element) {
                            if (element != '') {
                              values.add(element);
                            }
                          });

                          if (values.length == onedayHourNum) {
                            await ref
                                .read(lifetimeProvider.notifier)
                                .inputLifetime(date: widget.date);

                            await ref
                                .read(lifetimeProvider.notifier)
                                .getDailyLifetime(date: widget.date);

                            Navigator.pop(context);
                          } else {
                            await ref
                                .read(appParamProvider.notifier)
                                .setErrorMessage(msg: 'cant save');
                          }
                        },
                        child: const Icon(Icons.input),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(child: lifetimeInputParts()),
              Divider(thickness: 2, color: Colors.white.withOpacity(0.4)),
              lifetimeItemSetPanel(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  ///
  void makeTecs() {
    for (var i = 0; i < onedayHourNum; i++) {
      tecs.add(TextEditingController(text: ''));
    }
  }

  ///
  Widget lifetimeInputParts() {
    final list = <Widget>[];

    final itemPos =
        ref.watch(lifetimeProvider.select((value) => value.itemPos));

    for (var i = 0; i < onedayHourNum; i++) {
      list.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              SizedBox(
                width: 40,
                child: ChoiceChip(
                  label: Text(i.toString()),
                  backgroundColor: Colors.black.withOpacity(0.4),
                  selectedColor: Colors.yellowAccent.withOpacity(0.4),
                  selected: i == itemPos,
                  onSelected: (bool isSelected) =>
                      ref.read(lifetimeProvider.notifier).setItemPos(pos: i),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: (i == itemPos)
                          ? Colors.yellowAccent.withOpacity(0.4)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: TextField(
                    style: const TextStyle(fontSize: 12),
                    readOnly: true,
                    controller: tecs[i],
                    decoration: const InputDecoration(
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(child: Column(children: list));
  }

  ///
  Widget lifetimeItemSetPanel() {
    final list = <Widget>[];

    final itemPos =
        ref.watch(lifetimeProvider.select((value) => value.itemPos));

    final lifetimeItemList =
        ref.watch(lifetimeProvider.select((value) => value.lifetimeItemList));

    final itemList = <String>[];
    lifetimeItemList.forEach((element) {
      if (widget.date.isBefore(DateTime(2024, 2, 11))) {
        itemList.add(element.item);
      } else {
        if (element.item != '自宅') {
          itemList.add(element.item);
        }
      }
    });

    final selectedInputChoiceChip = ref.watch(
        appParamProvider.select((value) => value.selectedInputChoiceChip));

    itemList.forEach((element) {
      list.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          child: ChoiceChip(
            label: Text(element, style: const TextStyle(fontSize: 12)),
            backgroundColor: Colors.black.withOpacity(0.1),
            selectedColor: Colors.yellowAccent.withOpacity(0.1),
            selected: element == selectedInputChoiceChip,
            onSelected: (bool isSelected) async {
              await ref
                  .read(appParamProvider.notifier)
                  .setSelectedInputChoiceChip(string: element);

              tecs[itemPos].text = element;

              await ref
                  .read(lifetimeProvider.notifier)
                  .setLifetimeStringList(pos: itemPos, item: element);
            },
          ),
        ),
      );
    });

    return Wrap(children: list);
  }

  ///
  Widget _displayBetweenInputButton() {
    final lifetimeState = ref.watch(lifetimeProvider);

    if (lifetimeState.lifetimeStringList.isEmpty) {
      return const Icon(Icons.check_box_outline_blank,
          color: Colors.transparent);
    }

    return GestureDetector(
      onTap: () async {
        var endPos = 0;
        for (var i = lifetimeState.itemPos + 1; i < onedayHourNum; i++) {
          if (lifetimeState.lifetimeStringList[i] != '') {
            break;
          }

          endPos = i;
        }

        final lifetimeStringItem =
            lifetimeState.lifetimeStringList[lifetimeState.itemPos];

        for (var i = lifetimeState.itemPos; i <= endPos; i++) {
          tecs[i].text = lifetimeStringItem;

          await ref
              .read(lifetimeProvider.notifier)
              .setLifetimeStringList(pos: i, item: lifetimeStringItem);
        }
      },
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(Icons.download_for_offline_outlined,
              color: Colors.white.withOpacity(0.6)),
        ],
      ),
    );
  }

  ///
  Widget _displayReloadButton() {
    return IconButton(
        onPressed: () {
          ref
              .read(lifetimeProvider.notifier)
              .getDailyLifetime(date: widget.date);

          final lifetime =
              ref.watch(lifetimeProvider.select((value) => value.lifetime));

          if (lifetime != null) {
            final hourDataList = [
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
              lifetime.hour23
            ];

            for (var i = 0; i < hourDataList.length; i++) {
              tecs[i].text = hourDataList[i];

              ref
                  .read(lifetimeProvider.notifier)
                  .setLifetimeStringList(pos: i, item: hourDataList[i]);
            }
          }
        },
        icon: const Icon(Icons.refresh));
  }
}
