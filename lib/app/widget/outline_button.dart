import 'package:drag_drop_flutter/app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color shadowColor;
  final String text;
  final Color textColor;
  final double? buttonWidth;
  final double? letterSpacing;
  final double? textSize;
  final double borderRadius;

  const CustomOutlineButton(
      {Key? key,
      this.onTap,
      this.textSize,
      this.shadowColor = Colors.blueAccent,
      this.textColor = Colors.white,
      this.buttonWidth,
      this.text = "Submit",
      this.borderRadius = 8,
      this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: buttonWidth,
      child: OutlinedButton(
        child: CustomText(
          text: text,
          size: textSize ?? 16,
          color: textColor,
          letterSpacing: letterSpacing,
          fontWeight: CustomFontWeight.Medium,
        ),
        onPressed: () {
          onTap?.call();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius))),
        ),
      ),
    );
  }
}
