import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/lesson/lesson_model.dart';
import '../../styles/colors.dart';
import '../../styles/widget_styles.dart';

final currentLessonInCard = Provider.autoDispose<Lesson>((ref) {
  return Lesson.empty();
});

class LessonCard extends StatelessWidget {
  const LessonCard({Key? key, required this.lesson}) : super(key: key);

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        currentLessonInCard.overrideWithValue(lesson),
      ],
      child: const _LessonCard(),
    );
  }
}

class _LessonCard extends ConsumerWidget {
  const _LessonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lesson = ref.read(currentLessonInCard);
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colors.backgroundPrimary,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(AppPadding.medium),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colors.separator!,
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _LessonCardHeader(),
                const SizedBox(height: AppPadding.small),
                Text(
                  lesson.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppPadding.small),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        '${lesson.audience} • ${lesson.type}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(lesson.teacher),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LessonCardHeader extends ConsumerStatefulWidget {
  const _LessonCardHeader({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LessonCardHeaderState();
}

class _LessonCardHeaderState extends ConsumerState<_LessonCardHeader> {
  @override
  Widget build(BuildContext context) {
    final lesson = ref.read(currentLessonInCard);
    final colors = Theme.of(context).extension<AppColors>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: colors.accentPrimary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: colors.backgroundPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppPadding.small),
            const Text('9:30 - 11:00'),
          ],
        ),
        const Text('data'),
      ],
    );
  }
}
