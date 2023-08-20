import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiitak_mac_test/app/modules/explore/widget/form_text_field.dart';
import 'package:jiitak_mac_test/app/modules/settings/views/settings_view.dart';
import 'package:jiitak_mac_test/config/theme/dark_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/light_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/theme_extensions/header_container_theme_data.dart';
import 'package:jiitak_mac_test/config/translations/strings_enum.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            15.verticalSpace,
            Row(
              children: [
                24.horizontalSpace,
                Expanded(
                  child: FormTextField(
                    labelText: Strings.whereDoYouWork.tr,
                    onChange: (value) {},
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const SettingsView());
                  },
                  child: Ink(
                    child: Container(
                      height: 39.h,
                      width: 39.h,
                      decoration: theme
                          .extension<HeaderContainerThemeData>()
                          ?.decoration!
                          .copyWith(color: Colors.transparent),
                      child: SvgPicture.asset(
                        'assets/vectors/setting.svg',
                        fit: BoxFit.none,
                        color: theme.hintColor,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                ),
                5.horizontalSpace,
                InkWell(
                  onTap: () {},
                  child: Ink(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 40,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ),
                24.horizontalSpace,
              ],
            ),
            12.verticalSpace,
            Container(
              height: 33,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.77, 0.64),
                  end: const Alignment(-0.77, -0.64),
                  colors: [
                    Get.isDarkMode
                        ? DarkThemeColors.actionbarLight
                        : LightThemeColors.actionbarLight,
                    Get.isDarkMode
                        ? DarkThemeColors.actionbarDark
                        : LightThemeColors.actionbarDark,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  Strings.dayOfWeek.tr,
                  style:
                      theme.textTheme.bodySmall!.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ));
  }
}
