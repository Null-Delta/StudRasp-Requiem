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

    if (splitSpace.length > 1 &&
        splitSpace[0].isNotEmpty &&
        splitSpace[1].isNotEmpty) {
      return splitSpace[0].substring(0, 1).toUpperCase() +
          splitSpace[1].substring(0, 1).toUpperCase();
    }

    final split = name.split(RegExp(r"(?=(?!^)[A-Z])"));

    if (split.length == 1 && split[0].length > 1) {
      return split[0].substring(0, 2).toUpperCase();
    } else if (split.length > 1 && split[0].isNotEmpty && split[1].isNotEmpty) {
      return split[0].substring(0, 1).toUpperCase() +
          split[1].substring(0, 1).toUpperCase();
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyles;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary!,
        shape: BoxShape.circle,
        border: Border.all(color: colors.separator!, width: 3),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(999)),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            highlightColor: colors.separator,
            onTap: () {},
            child: Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Text(
                getCharacters(name),
                style: textStyle.title!.copyWith(
                  fontSize: 48,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
