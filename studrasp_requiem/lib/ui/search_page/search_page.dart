import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/text_field_style.dart';

class SearchPage<T> extends StatefulWidget {
  final List<T> Function(String name) filter;
  final Widget Function(T) itemBuilder;

  const SearchPage({Key? key, required this.filter, required this.itemBuilder})
      : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState<T>();
}

class _SearchPageState<T> extends State<SearchPage<T>> {
  final searchFieldFocus = FocusNode();
  List<T> searchResult = [];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Поиск",
          style: textStyles.title,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Assets.images.circleChevronLeft
                .svg(color: colors.accentPrimary),
            splashRadius: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 42,
              child: TextField(
                focusNode: searchFieldFocus,
                onEditingComplete: () {
                  setState(() {
                    searchResult = widget.filter("");
                  });
                  searchFieldFocus.unfocus();
                },
                style: textStyles.label,
                cursorColor: colors.accentPrimary,
                decoration: textFieldDecoration(context).copyWith(
                  hintText: "Поиск",
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            thickness: 1,
            color: colors.separator,
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemBuilder: (context, index) {
                return widget.itemBuilder(searchResult[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  thickness: 1,
                  color: colors.separator,
                );
              },
              itemCount: searchResult.length,
            ),
          ),
        ],
      ),
    );
  }
}
