import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitak_mac_test/app/modules/bussiness/views/bussiness_view.dart';
import 'package:jiitak_mac_test/app/modules/chat/views/chat_view.dart';
import 'package:jiitak_mac_test/app/modules/explore/views/explore_view.dart';
import 'package:jiitak_mac_test/app/modules/mypage/views/mypage_view.dart';
import 'package:jiitak_mac_test/app/modules/punchin/views/punchin_view.dart';

class DashboardController extends GetxController {
  var tabIndex = 0.obs;
  List<Widget> pages = [
    const ExploreView(),
    const BussinessView(),
    const PunchinView(),
    const ChatView(),
    const MypageView()
  ];

  late PageController pageController;

  void goToTab(int page) {
    tabIndex.value = page;
    pageController.jumpToPage(page);
  }
  void animateToTab(int page) {
    tabIndex.value = page;
   pageController.animateToPage(page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease);
  }

   @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
