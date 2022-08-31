import 'package:flutter/material.dart';

import '../styles/build_context_extension.dart';
import '../styles/button_style.dart';
import '../styles/colors.dart';
import '../styles/fonts.dart';

enum PopupMenuActionStyle { normal, destructive }

class PopupMenuAction extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function() action;

  final PopupMenuActionStyle style;

  const PopupMenuAction({
    Key? key,
    required this.text,
    required this.icon,
    required this.action,
    this.style = PopupMenuActionStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    ;
    final textStyles = context.textStyles;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        children: [
          Text(
            text,
            style: textStyles.label!.copyWith(
              color: style == PopupMenuActionStyle.destructive ? colors.destructive : colors.accentPrimary,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 42,
            height: 42,
            child: Icon(
              icon.icon,
              size: 20,
              color: style == PopupMenuActionStyle.destructive ? colors.destructive : colors.accentPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
