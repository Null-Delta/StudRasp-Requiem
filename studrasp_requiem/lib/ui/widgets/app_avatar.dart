import 'package:flutter/material.dart';

import '../../styles/build_context_extension.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    Key? key,
    required this.name,
    required this.size,
  }) : super(key: key);

  final String name;
  final double size;

  String getCharacters(String name) {
    final splitSpace = name.split(' ');

    if (splitSpace.length > 1) {
      return splitSpace[0].substring(0, 1).toUpperCase() +
          splitSpace[1].substring(0, 1).toUpperCase();
    }

    final split = name.split(RegExp(r"(?=(?!^)[A-Z])"));

    if (split.length == 1) {
      return split[0].substring(0, 2).toUpperCase();
    } else if (split.length > 1) {
      return split[0].substring(0, 1).toUpperCase() +
          split[1].substring(0, 1).toUpperCase();
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyles;
    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary!,
        shape: BoxShape.circle,
        border: Border.all(color: colors.separator!, width: 3),
      ),
      padding: const EdgeInsets.all(16),
      child: Container(
        width: size - 16,
        height: size - 16,
        alignment: Alignment.center,
        child: Text(
          getCharacters('starPoroxima'),
          style: textStyle.title!.copyWith(
            fontSize: 48,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
