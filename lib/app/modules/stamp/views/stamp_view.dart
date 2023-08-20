import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiitak_mac_test/app/modules/editprofile/views/editprofile_view.dart';
import 'package:jiitak_mac_test/config/theme/dark_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/light_theme_colors.dart';

import '../controllers/stamp_controller.dart';

class StampView extends GetView<StampController> {
  const StampView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFA7B0FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFA7B0FF),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Ink(
            child: Container(
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: const Color(0xFF939EFF),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
                )),
          ),
        ),
        title: Text('スタンプカード詳細',
            style: theme.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        leadingWidth: 76,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const EditprofileView());
              },
              icon: const Icon(
                Icons.remove_circle_outline,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 17),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Mer キッチン",
                      style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  RichText(
                      text: TextSpan(text: "現在の獲得数", children: [
                    TextSpan(
                      text: '30',
                      style: theme.textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const TextSpan(text: '個')
                  ])),
                ],
              ),
            ),
          ),
          Expanded(
              child: Card(
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22))),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 318,
                          height: 200,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                              top: 24, left: 24, bottom: 20),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 15,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: GridView.builder(
                            itemCount: 15,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 0,
                                    childAspectRatio: 1,
                                    mainAxisSpacing: 0),
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset(
                                "assets/images/stamp.png",
                                height: 60,
                                width: 60,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text('2 / 2枚目',
                          style: theme.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Get.isDarkMode
                                  ? DarkThemeColors.bodyTextColor
                                  : LightThemeColors.bodyTextColor)),
                      30.horizontalSpace
                    ],
                  ),
                  Row(
                    children: [
                      15.horizontalSpace,
                      Text('スタンプ獲得履歴',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Get.isDarkMode
                                  ? DarkThemeColors.bodyTextColor
                                  : LightThemeColors.bodyTextColor)),
                      const Spacer(),
                    ],
                  ),
                  15.verticalSpace,
                  Expanded(
                      child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(
                          color: Get.isDarkMode
                              ? DarkThemeColors.hintTextColor
                              : LightThemeColors.hintTextColor,
                        ),
                      );
                    },
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        title: Text('2021 / 11 / 18',
                            style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Get.isDarkMode
                                    ? DarkThemeColors.hintTextColor
                                    : LightThemeColors.hintTextColor)),
                        subtitle: Row(
                          children: [
                            Expanded(
                              child: Text('スタンプを獲得しました。',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Get.isDarkMode
                                          ? DarkThemeColors.bodyTextColor
                                          : LightThemeColors.bodyTextColor)),
                            ),
                            Text('1 個',
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Get.isDarkMode
                                        ? DarkThemeColors.bodyTextColor
                                        : LightThemeColors.bodyTextColor)),
                          ],
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
