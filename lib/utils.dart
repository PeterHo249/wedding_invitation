import 'package:flutter/cupertino.dart';

bool isVerticalScreen(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;

  return screenWidth / screenHeight <= 0.8;
}

bool isLongHorizotalScreen(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return screenWidth >= screenHeight * 2;
}

double getScale(BuildContext context, double originValue) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 992) return 1 * originValue;
  if (screenWidth >= 768) return 0.8 * originValue;
  return 0.6 * originValue;
}
