import 'package:flutter/material.dart';
import 'package:hogme_flutter_application/utils/colors/app_theme.dart';

BoxDecoration buttonShadow(
    {Color themeColor = AppTheme.primaryWhite, double radius = 0.0}) {
  return BoxDecoration(
      color: themeColor,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.6),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(-5, 5),
        ),
      ]);
}
