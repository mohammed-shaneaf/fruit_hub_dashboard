import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/common/widgets/custom_check_box.dart';
import 'package:fruit_hub_dashboard/core/styles/app_text_style.dart';

class IsFeaturedCheckbox extends StatefulWidget {
  const IsFeaturedCheckbox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedCheckbox> createState() => _IsFeaturedCheckboxState();
}

class _IsFeaturedCheckboxState extends State<IsFeaturedCheckbox> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        16.horizontalSpace,
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'is Featured Item',
              style: AppTextStyles.semiBold16.copyWith(
                color: Color(0xff949D9E),
              ),
              children: [WidgetSpan(child: SizedBox(width: 4.w))],
            ),
          ),
        ),
      ],
    );
  }
}
