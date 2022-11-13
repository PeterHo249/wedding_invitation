import 'package:flutter/cupertino.dart';

bool isVerticalScreen(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;

  return screenWidth / screenHeight <= 0.8;
}

bool isLongLandscapeScreen(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return screenWidth >= screenHeight * 2;
}
