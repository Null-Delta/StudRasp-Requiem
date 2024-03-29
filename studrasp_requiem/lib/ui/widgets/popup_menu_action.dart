import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/build_context_extension.dart';

enum PopupMenuActionStyle { normal, destructive }

class PopupMenuAction extends StatelessWidget {
  final String text;
  final SvgPicture? svgIcon;
  final Icon? icon;
  final Function()? action;

  final PopupMenuActionStyle style;

  const PopupMenuAction({
    Key? key,
    required this.text,
    this.svgIcon,
    this.icon,
    this.action,
    this.style = PopupMenuActionStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
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
          const SizedBox(width: 16),
          const Spacer(),
          SizedBox(
            width: 20,
            height: 20,
            child: svgIcon ?? icon,
          )
        ],
      ),
    );
  }
}
