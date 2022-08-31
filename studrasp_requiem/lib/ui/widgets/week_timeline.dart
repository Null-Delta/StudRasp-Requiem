import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import 'day_button.dart';

class WeekTimeline extends ConsumerWidget {
  const WeekTimeline({Key? key, this.weekCount}) : super(key: key);

  final int? weekCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekDay = ref.watch(currentDate).weekday - 1;

    final initialPage = weekCount != null ? 0 : 1000;

    return SizedBox(
      height: 64,
      child: PageView.builder(
        controller: PageController(
          initialPage: initialPage,
        ),
        itemCount: weekCount,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                for (int i = 0; i < 7; i++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 8,
                      ),
                      child: DayButton(
                        diration: Duration(
                          days: 7 * (index - initialPage) + (i - weekDay),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
