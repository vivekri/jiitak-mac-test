import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiitak_mac_test/config/theme/dark_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/light_theme_colors.dart';
import 'package:jiitak_mac_test/config/translations/strings_enum.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.all(8),
          elevation: 3,
          shadowColor: const Color(0x26889FBB),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                    "https://s3-alpha-sig.figma.com/img/4d9f/0d05/6dcd4405e664dc668c59f175062f1e02?Expires=1693180800&Signature=gtrOMNVobYullDIIikDaNkR3PNwLD5tyN8ZH~kdcYU4LeZxhtWUmmK-wNqq3q1NE3AxhiiIST8M8uBwWzmD6qn4NkFUhPC6v8z~wPdMxa6K6~7f1Cd27q06Qpd9tbc08rOoXjNcR34qUdipKyt~~F1crm4xsE-C5CA2EtkMIJb6SiijxG8z9Q9pPPY47oyP3fxKEuMcGRr5uuoXdkcgHZdiWDqPgIDBsv-4plmSye4JRpu8klrco5db7j5SXKO~Ui~R0TvyBPi5ujiVAUx~2CMvddtf1Q1qIyq6VS9I-WrD~1DnFKv3ue0245IB1AdOcSNikGP1HNHKiE0gW3ogWAg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.partTimeJobTitle.tr,
                      style: theme.textTheme.titleSmall!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    7.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: ShapeDecoration(
                            color: const Color(0x19EEAB40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: const SizedBox(
                            child: Text(
                              '介護付き有料老人ホーム',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFAAA14),
                                fontSize: 10,
                                fontFamily: 'Noto Sans JP',
                                fontWeight: FontWeight.w500,
                                height: 1.28,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '¥ 6,000',
                          style: theme.textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    Text(
                      '5月 31日（水）08 : 00 ~ 17 : 00',
                      style: theme.textTheme.titleSmall!,
                    ),
                    7.verticalSpace,
                    Text(
                      '北海道札幌市東雲町3丁目916番地17号',
                      style: theme.textTheme.titleSmall!,
                    ),
                    7.verticalSpace,
                    Text(
                      '交通費 300円',
                      style: theme.textTheme.titleSmall!,
                    ),
                    7.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '住宅型有料老人ホームひまわり倶楽部',
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: Get.isDarkMode
                                    ? DarkThemeColors.hintTextColor
                                    : LightThemeColors.hintTextColor),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Ink(
                            child: Icon(
                              Icons.favorite_border_outlined,
                              size: 30,
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 257,
            left: -5,
            child: Container(
              width: 74,
              height: 20,
              padding: const EdgeInsets.only(
                top: 4.05,
                left: 3.24,
                right: 3.24,
                bottom: 4.86,
              ),
              decoration: ShapeDecoration(
                color: const Color(0xFFFF6162),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.43),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '本日まで',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Noto Sans JP',
                      fontWeight: FontWeight.w700,
                      height: 1.30,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
