import 'package:flutter/material.dart';
import 'package:wedding_invitation/utils.dart';

class SaveTheDatePage extends StatelessWidget {
  final String portraitImagePath;
  final String landscapeImagePath;

  const SaveTheDatePage({
    Key? key,
    required this.landscapeImagePath,
    required this.portraitImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        LandingImage(
          portraitImagePath: portraitImagePath,
          landscapeImagePath: landscapeImagePath,
        ),
        const LandingText(),
      ],
    );
  }
}

class LandingImage extends StatelessWidget {
  const LandingImage({
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
        flex: 3,
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Text(
            isVerticalScreen(context)
                ? 'Hoàng Nhật\n& Lan Oanh'
                : 'Hoàng Nhật & Lan Oanh',
            style: TextStyle(
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.bold,
              fontSize: primaryFontSize,
              color: Colors.white,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      LandingDivider(
        paddingTop: getScale(context, 40),
        paddingBottom: getScale(context, 10),
      ),
      Expanded(
        flex: 0,
        child: Text(
          'We Are Tying The Knot',
          style: TextStyle(
            fontSize: secondaryFontSize,
            color: Colors.white,
          ),
          maxLines: 1,
        ),
      ),
      LandingDivider(
        paddingTop: getScale(context, 10),
        paddingBottom: getScale(context, 30),
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

class LandingDivider extends StatelessWidget {
  const LandingDivider({
    Key? key,
    required this.paddingTop,
    required this.paddingBottom,
  }) : super(key: key);

  final double paddingTop;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        screenWidth * 0.3,
        paddingTop,
        screenWidth * 0.3,
        paddingBottom,
      ),
      child: const Divider(
        color: Colors.white,
      ),
    );
  }
}
