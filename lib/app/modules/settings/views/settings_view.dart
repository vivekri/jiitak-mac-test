import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiitak_mac_test/config/theme/dark_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/light_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/my_theme.dart';
import 'package:jiitak_mac_test/config/theme/theme_extensions/header_container_theme_data.dart';
import 'package:jiitak_mac_test/config/translations/localization_service.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Get.isDarkMode
                ? DarkThemeColors.iconColor
                : LightThemeColors.iconColor),
        title: Text(
          'SettingsView',
          style: TextStyle(
              color: Get.isDarkMode
                  ? DarkThemeColors.iconColor
                  : LightThemeColors.iconColor),
        ),
        centerTitle: true,
        actions: [
          5.horizontalSpace,
          InkWell(
            onTap: () => MyTheme.changeTheme(),
            child: Ink(
              child: Container(
                height: 39.h,
                width: 39.h,
                decoration:
                    theme.extension<HeaderContainerThemeData>()?.decoration,
                child: SvgPicture.asset(
                  Get.isDarkMode
                      ? 'assets/vectors/moon.svg'
                      : 'assets/vectors/sun.svg',
                  fit: BoxFit.none,
                  color: Colors.white,
                  height: 10,
                  width: 10,
                ),
              ),
            ),
          ),
          5.horizontalSpace,
          InkWell(
            onTap: () => LocalizationService.updateLanguage(
              LocalizationService.getCurrentLocal().languageCode == 'ar'
                  ? 'en'
                  : LocalizationService.getCurrentLocal().languageCode == 'en'
                      ? 'zh'
                      : 'ar',
            ),
            child: Ink(
              child: Container(
                height: 39.h,
                width: 39.h,
                decoration:
                    theme.extension<HeaderContainerThemeData>()?.decoration,
                child: SvgPicture.asset(
                  'assets/vectors/language.svg',
                  fit: BoxFit.none,
                  color: Colors.white,
                  height: 10,
                  width: 10,
                ),
              ),
            ),
          ),
          16.horizontalSpace
        ],
      ),
      body: const Center(
        child: Text(
          'SettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
