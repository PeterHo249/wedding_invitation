import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wedding_invitation/ceremony_page.dart';
import 'package:wedding_invitation/constant.dart';
import 'package:wedding_invitation/ending_page.dart';
import 'package:wedding_invitation/personal_information_page.dart';
import 'package:wedding_invitation/save_the_date_page.dart';

import 'gallery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thiệp cưới Nhật và Oanh',
      theme: ThemeData(
        fontFamily: 'YanoneKaffeesatz',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff619086),
        ),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.unknown,
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              {
                return const SaveTheDatePage(
                  verticalImagePath: landingHorizontalPath,
                  horizontalImagePath: landingVerticalPath,
                );
              }
            case 1:
              {
                return const PersonalInformationPage(
                  isReversedOrder: false,
                  patronName: 'Giuse',
                  fullname: 'Lại Hoàng Nhật',
                  familyOrder: 'Quý nam',
                  verticalImage: groomVerticalPath,
                  horizontalImage: groomHorizontalPath,
                );
              }
            case 2:
              {
                return const PersonalInformationPage(
                  isReversedOrder: true,
                  patronName: 'Matta',
                  fullname: 'Hồ Thị Lan Oanh',
                  familyOrder: 'Quý nữ',
                  verticalImage: brideVerticalPath,
                  horizontalImage: brideHorizontalPath,
                );
              }
            case 3:
              {
                return const CeremonyPage();
              }
            case 4:
              {
                return const GalleryPage();
              }
            case 5:
              {
                return const EndingPage();
              }
            default:
              return Center(
                child: Text(
                  index.toString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 100,
                  ),
                ),
              );
          }
        },
        itemCount: 6,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        scrollDirection: Axis.vertical,
        loop: false,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
