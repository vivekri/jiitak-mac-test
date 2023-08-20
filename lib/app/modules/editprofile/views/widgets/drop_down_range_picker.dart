import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownRangePicker extends StatelessWidget {
  final String? initialValue;
  final bool isRange;
  final String? initialEndValue;
  final String? labelText;
  final bool isRequired;
  final List<String> listString;
  final ValueChanged onChange;
  const DropDownRangePicker(
      {super.key,
      this.initialValue = "",
      this.initialEndValue = "",
      this.labelText,
      this.isRange = false,
      required this.onChange,
      required this.listString,
      this.isRequired = true});

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
        Row(
          children: [
            SizedBox(
              width: isRange ? 130 : 200,
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(
                            color: Color(0xFFEB5308), fontSize: 16.0),
                        hintText: 'Please select value',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    isEmpty: initialValue == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: initialValue == "" ? null : initialValue,
                        isDense: true,
                        onChanged: (String? newValue) {},
                        items: listString.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (isRange)
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "~",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            if (isRange)
              SizedBox(
                width: isRange ? 130 : 200,
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(
                              color: Color(0xFFEB5308), fontSize: 16.0),
                          hintText: 'Please select value',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      isEmpty: initialEndValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: initialEndValue == "" ? null : initialEndValue,
                          isDense: true,
                          onChanged: (String? newValue) {},
                          items: listString.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              )
          ],
        ),
        16.verticalSpace
      ],
    );
  }
}
