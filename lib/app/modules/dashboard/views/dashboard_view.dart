import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitak_mac_test/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:jiitak_mac_test/config/theme/dark_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/light_theme_colors.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  buildBottomNavigationMenu(
      BuildContext context, DashboardController dashboardController) {
    final theme = Theme.of(context);
    final TextStyle unselectedLabelStyle = TextStyle(
        color: Get.isDarkMode
            ? DarkThemeColors.iconColor
            : LightThemeColors.iconColor,
        fontWeight: FontWeight.w500,
        fontSize: 12);

    final TextStyle selectedLabelStyle = TextStyle(
        color: Get.isDarkMode
            ? DarkThemeColors.iconColorActive
            : LightThemeColors.iconColorActive,
        fontWeight: FontWeight.w500,
        fontSize: 12);

    return BottomNavigationBar(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: (value) {
        dashboardController.goToTab(value);
        setState(() {});
      },
      currentIndex: dashboardController.tabIndex.value,
      backgroundColor: Get.isDarkMode ? theme.primaryColor : Colors.white,
      unselectedItemColor: Get.isDarkMode
          ? DarkThemeColors.iconColor
          : LightThemeColors.iconColor,
      selectedItemColor: Get.isDarkMode
          ? DarkThemeColors.iconColorActive
          : LightThemeColors.iconColorActive,
      unselectedLabelStyle: unselectedLabelStyle,
      selectedLabelStyle: selectedLabelStyle,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: const Icon(
              Icons.search,
              size: 30.0,
            ),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: const Icon(
              Icons.business_center_outlined,
              size: 30.0,
            ),
          ),
          label: 'Bussiness',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: const Icon(
              Icons.business_center_outlined,
              size: 10.0,
            ),
          ),
          label: 'Punch In',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(
              bottom: 7,
            ),
            child: const Icon(
              Icons.chat_bubble_outline,
              size: 30.0,
            ),
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: const Icon(
              Icons.people,
              size: 30.0,
            ),
          ),
          label: 'My Page',
        ),
      ],
    );
  }

  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "dashboard",
        key: const Key("dashboard"),
        backgroundColor: DarkThemeColors.actionbarDark,
        focusColor: DarkThemeColors.actionbarDark,
        hoverColor: DarkThemeColors.actionbarDark,
        splashColor: DarkThemeColors.actionbarDark,
        foregroundColor: DarkThemeColors.actionbarDark,
        focusElevation: null,

        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            boxShadow: [
              BoxShadow(
                color: DarkThemeColors.actionbarDark.withOpacity(0.2),
                spreadRadius: 20,
                blurRadius: 20,
                offset: const Offset(3, 5),
              ),
            ],
          ),
          child: const Icon(
            Icons.qr_code_scanner_outlined,
            size: 30.0,
            color: Colors.white,
          ),
        ), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        controller: controller.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: controller.animateToTab,
        children: [...controller.pages],
      ),
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
    );
  }
}
