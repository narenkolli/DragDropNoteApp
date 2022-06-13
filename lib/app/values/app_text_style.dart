import 'package:drag_drop_flutter/app/values/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  const AppTextStyle._();

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle boldStyle = _textStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle regularStyle = _textStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.FF00257C.withOpacity(0.5));

  static const TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  static const TextStyle hintTextStyle = TextStyle(
    color: Colors.black26,
    fontSize: 14,
  );
}
