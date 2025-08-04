import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/styles/app_text_style.dart';
import 'package:fruit_hub_dashboard/core/themes/app_colors_manger.dart';

AppBar buildAppBar({required String text}) {
  return AppBar(
    title: Text(
      text,
      style: AppTextStyles.bold19.copyWith(color: Colors.white),
    ),
    centerTitle: true,
    backgroundColor: AppColorsManger.lightPrimaryColor,
  );
}
