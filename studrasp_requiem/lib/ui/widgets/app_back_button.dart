import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../gen/assets.gen.dart';

import '../../styles/build_context_extension.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: SvgPicture.asset(
        Assets.images.circleChevronLeft.path,
        color: context.colors.accentPrimary,
      ),
      splashRadius: 24,
    );
  }
}
