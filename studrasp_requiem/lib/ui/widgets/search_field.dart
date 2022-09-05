import 'dart:math';

import 'package:flutter/material.dart';

import '../../styles/build_context_extension.dart';
import '../../styles/widget_styles.dart';
import 'custom_search_field.dart';

class SearchTextField extends StatelessWidget {
  final List<String> values;
  final String? hint;
  final bool isTop;
  final TextEditingController controller;

  const SearchTextField({
    Key? key,
    required this.values,
    required this.controller,
    this.hint,
    this.isTop = false,
  }) : super(key: key);

  Point<int> getSubString(String text) {
    final point = Point(
      text.indexOf(controller.text),
      text.indexOf(controller.text) + controller.text.length,
    );

    if (point.x < 0) {
      return const Point(0, 0);
    } else {
      return point;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    // controller.addListener(() {
    //   (context as Element).markNeedsBuild();
    // });

    return SearchField(
      controller: controller,
      showListTop: isTop,
      suggestions: values.map((e) {
        return SearchFieldListItem(
          e,
          widgetBuilder: () {
            final offset = getSubString(e);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: e.substring(0, offset.x),
                      style: textStyles.label!.copyWith(color: colors.disable),
                    ),
                    TextSpan(
                      text: e.substring(offset.x, offset.y),
                      style: textStyles.label!
                          .copyWith(color: colors.accentPrimary),
                    ),
                    TextSpan(
                      text: e.substring(offset.y),
                      style: textStyles.label!.copyWith(color: colors.disable),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
      itemHeight: 42,
      marginColor: colors.separator,
      searchStyle: textStyles.label,
      maxSuggestionsInViewPort: 3,
      hint: hint,
      suggestionsDecoration: BoxDecoration(
        borderRadius: BorderRadiusStyles.normal,
        color: colors.backgroundPrimary,
        boxShadow: [
          BoxShadow(
            color: colors.shadow!.withOpacity(1),
            blurRadius: 64.0,
            spreadRadius: 0.1,
          ),
        ],
      ),
      suggestionStyle: textStyles.smallLabel,
    );
  }
}
