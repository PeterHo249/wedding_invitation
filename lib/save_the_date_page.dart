import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    bool isVerticalScreen = screenWidth / screenHeight <= 0.8;

    return Stack(
      fit: StackFit.expand,
      children: [
        LandingImage(
          isVerticalScreen: isVerticalScreen,
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
    required this.isVerticalScreen,
    required this.portraitImagePath,
    required this.landscapeImagePath,
  }) : super(key: key);

  final bool isVerticalScreen;
  final String portraitImagePath;
  final String landscapeImagePath;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        isVerticalScreen ? portraitImagePath : landscapeImagePath,
      ),
      fit: BoxFit.fill,
      color: Colors.grey.withOpacity(0.9),
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
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: AutoSizeText(
              'Hoàng Nhật & Lan Oanh',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 1,
            ),
          ),
        ),
        const LandingDivider(
          paddingTop: 30.0,
          paddingBottom: 10.0,
        ),
        const Expanded(
          flex: 0,
          child: AutoSizeText(
            'We Are Tying The Knot',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
            maxLines: 1,
          ),
        ),
        const LandingDivider(
          paddingTop: 10.0,
          paddingBottom: 30.0,
        ),
        const Expanded(
          flex: 0,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Save The Date',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 30,
                color: Colors.white,
              ),
              maxLines: 1,
            ),
          ),
        ),
        const Expanded(
          child: Text(
            '01 - 01 - 2023',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
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
