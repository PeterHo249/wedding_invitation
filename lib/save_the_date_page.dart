import 'package:flutter/material.dart';
import 'package:wedding_invitation/utils.dart';

import 'overlay_image.dart';

class SaveTheDatePage extends StatelessWidget {
  final String horizontalImagePath;
  final String verticalImagePath;

  const SaveTheDatePage({
    Key? key,
    required this.verticalImagePath,
    required this.horizontalImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        OverlayImage(
          opacity: 1,
          verticalImagePath: horizontalImagePath,
          horizontalImagePath: verticalImagePath,
        ),
        const LandingText(),
      ],
    );
  }
}

class LandingText extends StatelessWidget {
  const LandingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: buildTextColumn(context),
    );
  }

  List<Widget> buildTextColumn(BuildContext context) {
    double primaryFontSize = getScale(context, 60);
    double secondaryFontSize = primaryFontSize * 0.5;

    var widgets = [
      Expanded(
        flex: 2,
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Text(
            isVerticalScreen(context)
                ? 'Hoàng Nhật\n&\nLan Oanh'
                : 'Hoàng Nhật & Lan Oanh',
            style: TextStyle(
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.bold,
              fontSize: primaryFontSize,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Expanded(
        flex: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getScale(context, 80.0),
          ),
          child: Container(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: getScale(context, 20.0),
                horizontal: getScale(context, 100.0),
              ),
              child: Text(
                'We Are Tying The Knot',
                style: TextStyle(
                  fontSize: secondaryFontSize,
                  color: Colors.white,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Save The Date',
            style: TextStyle(
              fontFamily: 'DancingScript',
              fontSize: secondaryFontSize,
              color: Colors.white,
            ),
            maxLines: 1,
          ),
        ),
      ),
      Expanded(
        child: Text(
          '01 - 01 - 2023',
          style: TextStyle(
            fontSize: secondaryFontSize * 0.8,
            color: Colors.white,
          ),
          maxLines: 1,
        ),
      ),
    ];

    return widgets;
  }
}
