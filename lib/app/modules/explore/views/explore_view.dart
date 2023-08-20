import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiitak_mac_test/app/modules/explore/controllers/explore_controller.dart';
import 'package:jiitak_mac_test/app/modules/explore/widget/calendar_week_view.dart';
import 'package:jiitak_mac_test/app/modules/explore/widget/dashboard_card.dart';
import 'package:jiitak_mac_test/app/modules/explore/widget/header.dart';
import 'package:jiitak_mac_test/app/modules/stamp/views/stamp_view.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Header(),
          titleSpacing: 0.0,
          toolbarHeight: 98.h,
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "explore",
          key: const Key("explore"),
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          focusColor: Get.isDarkMode ? Colors.black : Colors.white,
          hoverColor: Get.isDarkMode ? Colors.black : Colors.white,
          splashColor: Get.isDarkMode ? Colors.black : Colors.white,
          foregroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          focusElevation: null,

          //Floating action button on Scaffold
          onPressed: () {
            Get.to(() => const StampView());
          },
          child: Icon(
            Icons.location_on_outlined,
            size: 30.0,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ), //icon inside button
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const CalendarWeekView(),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return const DashBoardCard();
              },
            )
          ],
        ));
  }
}
