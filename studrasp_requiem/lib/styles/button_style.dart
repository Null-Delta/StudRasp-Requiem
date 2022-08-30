import 'package:flutter/material.dart';

class CustomButtonStyle extends ButtonStyle {
  final Size buttonSize;

  const CustomButtonStyle(this.buttonSize);

  @override
  MaterialStateProperty<double?>? get elevation => MaterialStateProperty.all(0.0);

  @override
  MaterialStateProperty<Color?>? get backgroundColor => MaterialStateProperty.all(Colors.transparent);

  @override
  MaterialStateProperty<Size?>? get fixedSize => MaterialStateProperty.all(buttonSize);

  @override
  MaterialStateProperty<Size?>? get maximumSize => MaterialStateProperty.all(buttonSize);

  @override
  MaterialStateProperty<Size?>? get minimumSize => MaterialStateProperty.all(buttonSize);

  @override
  MaterialStateProperty<EdgeInsetsGeometry?>? get padding => MaterialStateProperty.all(EdgeInsets.zero);
}
