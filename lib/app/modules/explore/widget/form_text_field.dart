import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormTextField extends StatelessWidget {
  final double textSize;
  final bool isPassword;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final TextInputType? type;
  final ValueChanged onChange;
  const FormTextField(
      {super.key,
      this.textSize = 14,
      this.isPassword = false,
      this.initialValue = "",
      this.type = TextInputType.text,
      this.labelText,
      this.hintText,
      this.helperText,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: textSize,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      obscureText: isPassword,
      initialValue: initialValue,
      keyboardType: type,
      decoration: InputDecoration(
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
      ),
      onChanged: (value) => onChange(value),
    );
  }
}
