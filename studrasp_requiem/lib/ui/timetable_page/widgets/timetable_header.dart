import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../styles/colors.dart';
import '../../../styles/fonts.dart';
import 'week_timeline.dart';

class TimetableHeader extends ConsumerWidget with PreferredSizeWidget {
  const TimetableHeader({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 160);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                splashRadius: 25,
                onPressed: () {},
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.list_alt),
                    splashRadius: 25,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    splashRadius: 25,
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '36/2',
                  style: textStyles.largeTitle,
                ),
              ],
            ),
          ),
          const WeekTimeline(),
        ],
      ),
    );
  }
}
