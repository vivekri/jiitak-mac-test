import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiitak_mac_test/app/modules/editprofile/views/widgets/drop_down_range_picker.dart';
import 'package:jiitak_mac_test/app/modules/editprofile/views/widgets/form_text_field.dart';
import 'package:jiitak_mac_test/app/modules/editprofile/views/widgets/image_picker_widget.dart';
import 'package:jiitak_mac_test/app/modules/editprofile/views/widgets/map_widget.dart';
import 'package:jiitak_mac_test/app/modules/editprofile/views/widgets/week_day.dart';
import 'package:jiitak_mac_test/app/modules/editprofile/views/widgets/yes_no_widget.dart';
import 'package:jiitak_mac_test/config/theme/dark_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/light_theme_colors.dart';

import '../controllers/editprofile_controller.dart';

class EditprofileView extends GetView<EditprofileController> {
  const EditprofileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0.5,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Ink(
            child: Container(
                margin: const EdgeInsets.only(
                    left: 20, bottom: 17, top: 3, right: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: const Color(0x408C807A),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                )),
          ),
        ),
        title: Column(
          children: [
            Text('店舗プロフィール編集',
                style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Get.isDarkMode
                        ? DarkThemeColors.bodyTextColor
                        : LightThemeColors.bodyTextColor)),
          ],
        ),
        leadingWidth: 76,
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(() => const EditprofileView());
                  },
                  icon: Icon(Icons.notifications_none_outlined,
                      size: 40,
                      color: Get.isDarkMode
                          ? DarkThemeColors.iconColor
                          : LightThemeColors.iconColor)),
              Positioned(
                right: 0,
                top: 6,
                child: Container(
                  height: 22,
                  width: 22,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: DarkThemeColors.actionbarDark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      '99+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
          15.horizontalSpace
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FormTextField(
                onChange: (value) {},
                labelText: '店舗名',
                initialValue: 'Mer キッチン',
              ),
              FormTextField(
                onChange: (value) {},
                labelText: '代表担当者名',
                initialValue: '林田　絵梨花',
              ),
              FormTextField(
                onChange: (value) {},
                labelText: '店舗電話番号',
                initialValue: '123 - 4567 8910',
              ),
              FormTextField(
                onChange: (value) {},
                labelText: '店舗住所',
                initialValue: '大分県豊後高田市払田791-13',
              ),
              const MapWidget(),
              const ImagePickerWidget(
                labelText: '店舗外観',
                helperText: '（最大3枚まで）',
              ),
              const ImagePickerWidget(
                labelText: '店舗外観',
                helperText: '（最大3枚まで）',
              ),
              const ImagePickerWidget(
                labelText: '店舗外観',
                helperText: '（最大3枚まで）',
              ),
              const ImagePickerWidget(
                labelText: '店舗外観',
                helperText: '（最大3枚まで）',
              ),
              DropDownRangePicker(
                labelText: '営業時間',
                onChange: (value) {},
                initialValue: "10:00",
                initialEndValue: "20:00",
                listString: const ["10:00", "11:00", "20:00"],
                isRange: true,
              ),
              DropDownRangePicker(
                labelText: 'ランチ時間',
                onChange: (value) {},
                initialValue: "11:00",
                initialEndValue: "15:00",
                listString: const ["10:00", "11:00", "15:00"],
                isRange: true,
              ),
              const WeekDay(
                weeks: [false, false, false, false, false, true, true, true],
                weekList: ["月", "火", "水", "木", "金", "土", "日", "祝"],
                labelText: '定休日',
              ),
              DropDownRangePicker(
                labelText: '料理カテゴリー',
                onChange: (value) {},
                initialValue: "料理カテゴリー選択",
                listString: const ["料理カテゴリー選択", "料理カテゴリー", "料理カテゴ"],
                isRange: false,
              ),
              DropDownRangePicker(
                labelText: '予算',
                onChange: (value) {},
                initialValue: "¥ 1,000",
                initialEndValue: "¥ 2,000",
                listString: const ["¥ 1,000", "¥ 2,000", "¥ 3,000"],
                isRange: true,
              ),
              FormTextField(
                onChange: (value) {},
                labelText: 'キャッチコピー',
                initialValue: '美味しい！リーズナブルなオムライスランチ！',
              ),
              FormTextField(
                onChange: (value) {},
                labelText: '座席数',
                initialValue: '40席',
              ),
              const YesNoWidget(
                value: true,
                labelText: '喫煙席',
              ),
              const YesNoWidget(
                value: true,
                labelText: '駐車場',
              ),
              const ImagePickerWidget(
                isLimit: true,
                isLimitFlag: true,
                labelText: '来店プレゼント',
              ),
              FormTextField(
                onChange: (value) {},
                labelText: '来店プレゼント名',
                initialValue: 'いちごクリームアイスクリーム, ジュース',
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          DarkThemeColors.actionbarDark)),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text('編集を保存')),
                    ],
                  )),
              15.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}
