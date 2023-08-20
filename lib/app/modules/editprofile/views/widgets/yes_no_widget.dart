import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YesNoWidget extends StatefulWidget {
  final String? labelText;
  final bool isRequired;
  final bool value;
  const YesNoWidget({
    super.key,
    this.labelText = "",
    this.isRequired = true,
    required this.value,
  });

  @override
  State<YesNoWidget> createState() => _YesNoWidgetState();
}

class _YesNoWidgetState extends State<YesNoWidget> {
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
        Row(
          children: [
            Checkbox(value: widget.value, onChanged: (value) {}),
            const Text('有'),
            32.horizontalSpace,
            Checkbox(value: !widget.value, onChanged: (value) {}),
            const Text('無'),
          ],
        ),
        15.verticalSpace
      ],
    );
  }
}
