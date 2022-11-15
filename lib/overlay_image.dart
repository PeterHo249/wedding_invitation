import 'package:flutter/material.dart';
import 'package:wedding_invitation/utils.dart';

class OverlayImage extends StatelessWidget {
  const OverlayImage({
    Key? key,
    required this.verticalImagePath,
    required this.horizontalImagePath,
  }) : super(key: key);

  final String verticalImagePath;
  final String horizontalImagePath;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        isVerticalScreen(context) ? verticalImagePath : horizontalImagePath,
      ),
      fit: BoxFit.cover,
      color: Colors.grey.withOpacity(0.95),
      colorBlendMode: BlendMode.modulate,
    );
  }
}
