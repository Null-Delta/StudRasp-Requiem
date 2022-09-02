import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../support/fast_swipe_physics.dart';
import 'day_button.dart';

class WeekTimeline extends ConsumerStatefulWidget {
  final int? weekCount;

  const WeekTimeline({Key? key, this.weekCount}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeekTimelineState();
}

class _WeekTimelineState extends ConsumerState<WeekTimeline> {
  var controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    final initialPage = widget.weekCount != null ? 0 : 1000;
    controller = PageController(initialPage: initialPage);
  }

  @override
  Widget build(BuildContext context) {
    final weekDay = ref.watch(currentDate).weekday - 1;

    ref.listen<Duration>(
      selectedDuration,
      (previous, next) {
        var offsetDay = Duration(
          days: next.inDays + weekDay,
        ).inDays;

        if (offsetDay >= 0) {
          offsetDay = offsetDay ~/ 7;
        } else {
          offsetDay = (offsetDay + 1) ~/ 7 - 1;
        }

        controller.animateToPage(
          controller.initialPage + offsetDay,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );

    return SizedBox(
      height: 76,
      child: PageView.builder(
        physics: const CustomPageViewScrollPhysics(),
        controller: controller,
        itemCount: widget.weekCount,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                for (int i = 0; i < 7; i++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 12,
                      ),
                      child: DayButton(
                        diration: Duration(
                          days: 7 * (index - controller.initialPage) + (i - weekDay),
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
