import 'package:flutter/material.dart';
import 'package:wedding_invitation/utils.dart';

class OverlayImage extends StatelessWidget {
  const OverlayImage({
    Key? key,
    required this.portraitImagePath,
    required this.landscapeImagePath,
  }) : super(key: key);

  final String portraitImagePath;
  final String landscapeImagePath;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        isVerticalScreen(context) ? portraitImagePath : landscapeImagePath,
      ),
      fit: BoxFit.fill,
      color: Colors.grey.withOpacity(0.95),
      colorBlendMode: BlendMode.modulate,
    );
  }
}
