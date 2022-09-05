import 'package:flutter/material.dart';

import '../../../models/developer/developer.dart';
import '../../../styles/build_context_extension.dart';

class DeveloperCard extends StatelessWidget {
  const DeveloperCard({super.key, required this.developer});

  final Developer developer;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                offset: const Offset(0, 4),
                color: colors.shadow!,
                spreadRadius: 0,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 36,
            backgroundColor: colors.backgroundPrimary,
            backgroundImage: developer.image.image,
            child: const DecoratedBox(
              decoration: BoxDecoration(),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                developer.name,
                style: textStyles.title!.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                developer.email,
                style: textStyles.label,
              ),
              const SizedBox(height: 4),
              Text(
                developer.description,
                style: textStyles.label!.copyWith(
                  color: colors.disable,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
