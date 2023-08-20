import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeekDay extends StatefulWidget {
  final String? labelText;
  final bool isRequired;
  final List<bool> weeks;
  final List<String> weekList;
  const WeekDay(
      {super.key,
      this.labelText = "",
      this.isRequired = true,
      required this.weeks,
      required this.weekList});

  @override
  State<WeekDay> createState() => _WeekDayState();
}

class _WeekDayState extends State<WeekDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(widget.labelText ?? ""),
            if (widget.isRequired)
              const Text(
                " * ",
                style: TextStyle(color: Color(0xFFEB5308)),
              ),
          ],
        ),
        Wrap(
          children: [
            for (int i = 0; i < widget.weeks.length; i++)
              SizedBox(
                width: 80,
                child: Row(
                  children: [
                    Checkbox(value: widget.weeks[i], onChanged: (value) {}),
                    Text(widget.weekList[i]),
                  ],
                ),
              )
          ],
        ),
        15.verticalSpace
      ],
    );
  }
}
