import 'package:flutter/material.dart';

//關閉按鈕水波紋
class DisableSplashUtils extends InteractiveInkFeatureFactory {
  @override
  InteractiveInkFeature create({MaterialInkController? controller, RenderBox? referenceBox, Offset? position, Color? color, TextDirection? textDirection, bool containedInkWell = false, rectCallback, BorderRadius? borderRadius, ShapeBorder? customBorder, double? radius, onRemoved}) {
    return _NoInteractiveInkFeature(controller: controller!, referenceBox: referenceBox!);
  }
}

class _NoInteractiveInkFeature extends InteractiveInkFeature {
  _NoInteractiveInkFeature({
    required MaterialInkController controller,
    required RenderBox referenceBox,
  }) : super(controller: controller, referenceBox: referenceBox, color: Colors.transparent);

  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
