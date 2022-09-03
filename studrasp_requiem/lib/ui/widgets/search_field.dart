import 'package:flutter/material.dart';

import '../../styles/build_context_extension.dart';
import '../../styles/widget_styles.dart';
import 'custom_search_field.dart';

class SearchTextField extends StatelessWidget {
  final List<String> values;
  final String? hint;
  final bool isTop;
  final TextEditingController controller;

  const SearchTextField({Key? key, required this.values, required this.controller, this.hint, this.isTop = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return SearchField(
      controller: controller,
      showListTop: isTop,
      suggestions: values
          .map(
            (e) => SearchFieldListItem(
              e,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  e,
                  style: textStyles.label,
                ),
              ),
            ),
          )
          .toList(),
      itemHeight: 42,
      marginColor: colors.separator,
      searchStyle: textStyles.label,
      maxSuggestionsInViewPort: 3,
      hint: hint,
      suggestionsDecoration: BoxDecoration(
        borderRadius: BurderRadiusStyles.normal,
        color: colors.backgroundPrimary,
        boxShadow: [
          BoxShadow(
            color: colors.disable!.withOpacity(0.5),
            blurRadius: 32.0,
            spreadRadius: 0.1,
          ),
        ],
      ),
      suggestionStyle: textStyles.smallLabel,
    );
  }
}
