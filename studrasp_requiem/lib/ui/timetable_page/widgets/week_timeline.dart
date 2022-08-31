import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../day_button.dart';

class WeekTimeline extends ConsumerWidget {
  const WeekTimeline({Key? key}) : super(key: key);

  static const initialPage = 1000;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: PageView.builder(
        controller: PageController(
          initialPage: initialPage,
        ),
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
                        diration: Duration(days: 7 * (index - initialPage) + i),
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
