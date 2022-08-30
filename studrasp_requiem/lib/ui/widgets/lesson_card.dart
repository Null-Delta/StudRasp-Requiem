import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/lesson/lesson_model.dart';
import '../../styles/colors.dart';
import '../../styles/widget_styles.dart';

final currentLessonInCard = Provider<Lesson>((ref) {
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
      padding: const EdgeInsets.all(AppPadding.normal),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colors.backgroundPrimary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('data'),
              Text('data'),
            ],
          ),
          const SizedBox(height: AppPadding.small),
          Text(
            lesson.name,
          ),
          const SizedBox(height: AppPadding.small),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${lesson.audience} • ${lesson.type}'),
              Text(lesson.teacher),
            ],
          ),
        ],
      ),
    );
  }
}
