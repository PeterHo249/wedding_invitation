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
          width: 20.0,
          color: Colors.white,
        ),
      ),
      child: isVerticalScreen(context)
          ? buildVerticalScreen(context)
          : buildHorizontalScreen(context),
    );
  }

  Widget buildVerticalScreen(BuildContext context) {
    return Container();
  }

  Widget buildHorizontalScreen(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isReversedOrder ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: buildInformationRow(context),
    );
  }

  List<Widget> buildInformationRow(BuildContext context) {
    var widgets = [
      SizedBox(
        width: MediaQuery.of(context).size.height - 40.0,
        child: Image.asset(
          horizontalImage,
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.5 - 20.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: isReversedOrder
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: buildInformationText(context),
          ),
        ),
      ),
    ];

    if (isReversedOrder) {
      widgets = widgets.reversed.toList();
    }

    return widgets;
  }

  List<Widget> buildInformationText(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          patronName,
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontSize: 50,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          fullname,
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          familyOrder,
          style: TextStyle(
              fontSize: 20, color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    ];
  }
}
