import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiitak_mac_test/config/theme/dark_theme_colors.dart';
import 'package:jiitak_mac_test/config/theme/light_theme_colors.dart';

class FormTextField extends StatelessWidget {
  final double textSize;
  final bool isPassword;
  final bool isRequired;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final TextInputType? type;
  final ValueChanged onChange;
  const FormTextField(
      {super.key,
      this.textSize = 14,
      this.isRequired = true,
      this.isPassword = false,
      this.initialValue = "",
      this.type = TextInputType.text,
      this.labelText,
      this.hintText,
      this.helperText,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(labelText ?? ""),
            if (isRequired)
              const Text(
                " * ",
                style: TextStyle(color: Color(0xFFEB5308)),
              )
          ],
        ),
        8.verticalSpace,
        TextFormField(
          style: TextStyle(
              fontSize: textSize,
              fontFamily: GoogleFonts.notoSans().fontFamily,
              color: Colors.black),
          obscureText: isPassword,
          initialValue: initialValue,
          keyboardType: type,
          decoration: InputDecoration(
            filled: false,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                borderSide: BorderSide(
                    width: 0.5,
                    color: Get.isDarkMode
                        ? DarkThemeColors.bodyTextColor.withOpacity(0.5)
                        : LightThemeColors.bodyTextColor.withOpacity(0.5))),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                borderSide: const BorderSide(
                  width: 0.5,
                )),
          ),
          onChanged: (value) => onChange(value),
        ),
        16.verticalSpace
      ],
    );
  }
}
