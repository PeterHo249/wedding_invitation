import 'package:flutter/material.dart';
import 'package:wedding_invitation/utils.dart';

class OverlayImage extends StatelessWidget {
  const OverlayImage(
      {Key? key,
      required this.verticalImagePath,
      required this.horizontalImagePath,
      required this.opacity})
      : super(key: key);

  final double opacity;
  final String verticalImagePath;
  final String horizontalImagePath;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        isVerticalScreen(context) ? verticalImagePath : horizontalImagePath,
      ),
      fit: BoxFit.cover,
    );
  }
}
