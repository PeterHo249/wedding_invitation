import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wedding_invitation/constant.dart';
import 'package:wedding_invitation/personal_information_page.dart';
import 'package:wedding_invitation/save_the_date_page.dart';

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
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
                  landscapeImagePath: landscapeImagePath,
                  portraitImagePath: portraitImagePath,
                );
              }
            case 1:
              {
                return const PersonalInformationPage(
                  isReversedOrder: false,
                  patronName: 'Giuse',
                  fullname: 'Lại Hoàng Nhật',
                  familyOrder: 'Trưởng nam',
                  verticalImage: landscapeImagePath,
                  horizontalImage: portraitImagePath,
                );
              }
            case 2:
              {
                return const PersonalInformationPage(
                  isReversedOrder: true,
                  patronName: 'Matta',
                  fullname: 'Hồ Thị Lan Oanh',
                  familyOrder: 'Út nữ',
                  verticalImage: landscapeImagePath,
                  horizontalImage: portraitImagePath,
                );
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
        itemCount: 10,
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
