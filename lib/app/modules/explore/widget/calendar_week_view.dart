import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiitak_mac_test/config/theme/dark_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/light_theme_colors.dart';
import 'package:jiitak_mac_test/config/translations/localization_service.dart';

class CalendarWeekView extends StatelessWidget {
  const CalendarWeekView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: EasyDateTimeLine(
        dayProps: const EasyDayProps(
          dayStructure: DayStructure.dayStrDayNum,
          inactiveBorderRadius: 10.0,
          activeBorderRadius: 10,
          inactiveDayDecoration: BoxDecoration(),
          height: 67.0,
          width: 44.0,
          todayStrStyle: TextStyle(
              height: 1.5,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: LightThemeColors.accentColor),
          todayMonthStrStyle: TextStyle(
            height: 1.5,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
          todayNumStyle: TextStyle(
            height: 1.5,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: LightThemeColors.accentColor,
          ),
          activeDayStrStyle: TextStyle(
              height: 1.5,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          activeDayNumStyle: TextStyle(
              height: 1.5,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          inactiveDayNumStyle: TextStyle(
            height: 1.5,
            fontSize: 17.0,
          ),
          inactiveDayStrStyle: TextStyle(
            height: 1.5,
            fontSize: 17.0,
          ),
        ),
        headerProps: const EasyHeaderProps(
          showMonthPicker: false,
          showHeader: false,
        ),
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          //[selectedDate] the new date selected.
        },
        timeLineProps: const EasyTimeLineProps(
          separatorPadding: 10,
        ),
        activeColor: Get.isDarkMode
            ? DarkThemeColors.actionbarDark
            : LightThemeColors.actionbarDark,
        locale: LocalizationService.getCurrentLocal().toString(),
      ),
    );
  }
}
