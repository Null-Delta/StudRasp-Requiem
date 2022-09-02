/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Icon_doc_outline.svg
  SvgGenImage get iconDocOutline =>
      const SvgGenImage('assets/images/Icon_doc_outline.svg');

  /// File path: assets/images/Icon_edit_outline.svg
  SvgGenImage get iconEditOutline =>
      const SvgGenImage('assets/images/Icon_edit_outline.svg');

  /// File path: assets/images/Icon_plus_outline.svg
  SvgGenImage get iconPlusOutline =>
      const SvgGenImage('assets/images/Icon_plus_outline.svg');

  /// File path: assets/images/Icon_save_outline.svg
  SvgGenImage get iconSaveOutline =>
      const SvgGenImage('assets/images/Icon_save_outline.svg');

  /// File path: assets/images/Icon_save_solid.svg
  SvgGenImage get iconSaveSolid =>
      const SvgGenImage('assets/images/Icon_save_solid.svg');

  /// File path: assets/images/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/images/calendar.svg');

  /// File path: assets/images/chevron_right.svg
  SvgGenImage get chevronRight =>
      const SvgGenImage('assets/images/chevron_right.svg');

  /// File path: assets/images/circle_check_outline.svg
  SvgGenImage get circleCheckOutline =>
      const SvgGenImage('assets/images/circle_check_outline.svg');

  /// File path: assets/images/circle_chevron_left.svg
  SvgGenImage get circleChevronLeft =>
      const SvgGenImage('assets/images/circle_chevron_left.svg');

  /// File path: assets/images/circle_up.svg
  SvgGenImage get circleUp => const SvgGenImage('assets/images/circle_up.svg');

  /// File path: assets/images/command.svg
  SvgGenImage get command => const SvgGenImage('assets/images/command.svg');

  /// File path: assets/images/download.svg
  SvgGenImage get download => const SvgGenImage('assets/images/download.svg');

  /// File path: assets/images/hamburger.svg
  SvgGenImage get hamburger => const SvgGenImage('assets/images/hamburger.svg');

  /// File path: assets/images/more_horizontal.svg
  SvgGenImage get moreHorizontal =>
      const SvgGenImage('assets/images/more_horizontal.svg');

  /// File path: assets/images/search.svg
  SvgGenImage get search => const SvgGenImage('assets/images/search.svg');

  /// File path: assets/images/settings.svg
  SvgGenImage get settings => const SvgGenImage('assets/images/settings.svg');

  /// File path: assets/images/stud_rasp_dark_icon.png
  AssetGenImage get studRaspDarkIcon =>
      const AssetGenImage('assets/images/stud_rasp_dark_icon.png');

  /// File path: assets/images/stud_rasp_light_icon.png
  AssetGenImage get studRaspLightIcon =>
      const AssetGenImage('assets/images/stud_rasp_light_icon.png');

  /// File path: assets/images/transfer.svg
  SvgGenImage get transfer => const SvgGenImage('assets/images/transfer.svg');

  /// File path: assets/images/trash_full.svg
  SvgGenImage get trashFull =>
      const SvgGenImage('assets/images/trash_full.svg');

  /// File path: assets/images/vector.svg
  SvgGenImage get vector => const SvgGenImage('assets/images/vector.svg');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
