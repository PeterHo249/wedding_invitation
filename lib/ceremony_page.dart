import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_invitation/constant.dart';
import 'package:wedding_invitation/utils.dart';

class CeremonyPage extends StatelessWidget {
  const CeremonyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        border: Border.all(
          width: getScale(context, 20),
          color: Colors.white,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: buildInformation(context),
      ),
    );
  }

  List<Widget> buildInformation(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var widgets = [
      SizedBox(
        height: screenHeight * 0.25,
        child: Image.asset(
          isVerticalScreen(context) ? eventVerticalPath : eventHorizontalPath,
          fit: BoxFit.cover,
          width: screenWidth - getScale(context, 20) * 2,
        ),
      ),
      const Expanded(
        child: EventInformation(
          event: 'Thánh Lễ Hôn Phối',
          place: 'Nhà thờ Gia Lào, Gia Lào, Suối Cao, Xuân Lộc, Đồng Nai',
          time: 'Thứ bảy, 31/12/2022, 09:30 AM',
          url: 'https://goo.gl/maps/AiZxjpdK15Vh8vxK7',
        ),
      ),
    ];

    var groomParty = const Expanded(
      child: EventInformation(
        event: 'Tân Hôn',
        place: '63/2c Đông Bắc, Gia Kiệm, Thống Nhất, Đồng Nai',
        time: 'Chúa nhật, 08/01/2023, 11:00 AM',
        url: 'https://goo.gl/maps/qBaBNZ9fF1QNimX77',
      ),
    );

    var brideParty = const Expanded(
      child: EventInformation(
        event: 'Vu Quy',
        place: '15 Gia Lào, Suối Cao, Xuân Lộc, Đồng Nai',
        time: 'Chúa nhật, 01/01/2023, 11:00 AM',
        url: 'https://goo.gl/maps/KpmerATxwZdUMhNC6',
      ),
    );

    if (isVerticalScreen(context)) {
      widgets.addAll(
        [
          brideParty,
          groomParty,
        ],
      );
    } else {
      widgets.add(
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              brideParty,
              groomParty,
            ],
          ),
        ),
      );
    }

    return widgets;
  }
}

class EventInformation extends StatelessWidget {
  const EventInformation({
    Key? key,
    required this.event,
    required this.place,
    required this.time,
    required this.url,
  }) : super(key: key);

  final String event;
  final String place;
  final String time;
  final String url;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(
              getScale(context, 10),
            ),
            child: Text(
              event,
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: getScale(context, 40),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: getScale(context, 15),
            ),
            child: Divider(
              color: Theme.of(context).colorScheme.primary,
              indent: boxConstraints.maxWidth * 0.2,
              endIndent: boxConstraints.maxWidth * 0.2,
            ),
          ),
          buildTextWithIcon(
            context,
            Icons.watch_later,
            time,
          ),
          InkWell(
            onTap: () async {
              await launchUrl(
                Uri.parse(url),
                webOnlyWindowName: '_blank',
              );
            },
            child: buildTextWithIcon(
              context,
              Icons.pin_drop,
              place,
            ),
          ),
        ],
      );
    });
  }

  Widget buildTextWithIcon(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.all(
        getScale(context, 8),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 18,
              ),
            ),
            TextSpan(
              text: '  $text',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
