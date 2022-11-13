import 'package:flutter/material.dart';
import 'package:wedding_invitation/utils.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({
    Key? key,
    required this.isReversedOrder,
    required this.patronName,
    required this.fullname,
    required this.familyOrder,
    required this.verticalImage,
    required this.horizontalImage,
  }) : super(key: key);

  final bool isReversedOrder;
  final String patronName;
  final String fullname;
  final String familyOrder;
  final String verticalImage;
  final String horizontalImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.03),
        border: Border.all(
          width: getScale(context, 20),
          color: Colors.white,
        ),
      ),
      child: isVerticalScreen(context)
          ? buildVerticalScreen(context)
          : buildHorizontalScreen(context),
    );
  }

  Widget buildVerticalScreen(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: buildInformationWidgets(context),
    );
  }

  Widget buildHorizontalScreen(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isReversedOrder ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: buildInformationWidgets(context),
    );
  }

  List<Widget> buildInformationWidgets(BuildContext context) {
    bool isVertical = isVerticalScreen(context);

    CrossAxisAlignment crossAlignment;
    if (isVertical) {
      crossAlignment = CrossAxisAlignment.center;
    } else {
      if (isReversedOrder) {
        crossAlignment = CrossAxisAlignment.end;
      } else {
        crossAlignment = CrossAxisAlignment.start;
      }
    }

    var widgets = [
      Image.asset(
        isVertical ? verticalImage : horizontalImage,
        fit: isVertical ? BoxFit.fitWidth : BoxFit.fitHeight,
      ),
      Padding(
        padding: EdgeInsets.all(getScale(context, 30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: crossAlignment,
          children: buildInformationText(context),
        ),
      ),
    ];

    if (isVertical) {
      widgets.add(Container());
    }

    if (isReversedOrder) {
      widgets = widgets.reversed.toList();
    }

    return widgets;
  }

  List<Widget> buildInformationText(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: getScale(context, 10)),
        child: Text(
          patronName,
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontSize: getScale(context, 50),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: getScale(context, 10)),
        child: Text(
          fullname,
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontSize: getScale(context, 60),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: getScale(context, 20)),
        child: Text(
          familyOrder,
          style: TextStyle(
            fontSize: getScale(context, 20),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    ];
  }
}
