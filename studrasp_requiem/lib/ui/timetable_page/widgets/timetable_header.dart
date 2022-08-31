import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../styles/colors.dart';
import '../../../styles/fonts.dart';

class TimetableHeader extends ConsumerWidget with PreferredSizeWidget {
  const TimetableHeader({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 100);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '36/2',
                  style: textStyles.largeTitle,
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return AppBar(
      backgroundColor: colors.backgroundPrimary,
      foregroundColor: colors.accentPrimary,
      titleTextStyle: textStyles.largeTitle,
      leading: IconButton(
        icon: const Icon(Icons.calendar_month),
        splashRadius: 25,
        onPressed: () {},
      ),
      actions: [
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
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 30),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tim1etable',
                  style: textStyles.largeTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
