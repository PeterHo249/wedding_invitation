import 'package:flutter/material.dart';
import 'package:wedding_invitation/overlay_image.dart';
import 'package:wedding_invitation/constant.dart';
import 'package:wedding_invitation/utils.dart';

class EndingPage extends StatelessWidget {
  const EndingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const OverlayImage(
          opacity: 0.95,
          verticalImagePath: endingVerticalPath,
          horizontalImagePath: endingHorizontalPath,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'I take you to be my wife.\n\nI promise to be true to you\nin good times and in bad,\nin sickness and in health.\n\nI will love you and honor you\nall the days of my life!',
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  color: Colors.white,
                  fontSize: getScale(context, 35),
                  wordSpacing: 6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
