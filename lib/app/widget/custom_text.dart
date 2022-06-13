import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomFontWeight {
  Thin,
  ExtraLight,
  Light,
  Regular,
  Medium,
  SemiBold,
  Bold,
  ExtraBold,
  Black
}

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final CustomFontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final TextDecoration textDecoration;
  const CustomText(
      {Key? key,
      @required this.text,
      this.size,
      this.color,
      this.textAlign,
      this.maxLines,
      this.letterSpacing,
      this.fontWeight = CustomFontWeight.Regular,
      this.overflow = TextOverflow.ellipsis,
      this.textDecoration = TextDecoration.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.barlow(
        textStyle: TextStyle(color: color, decoration: textDecoration),
        fontSize: size,
        letterSpacing: letterSpacing,
        fontWeight: getFontWeight(fontWeight),
      ),
    );
  }

  FontWeight getFontWeight(CustomFontWeight? fontWeight) {
    if (fontWeight == CustomFontWeight.Thin) {
      return FontWeight.w100;
    } else if (fontWeight == CustomFontWeight.ExtraLight) {
      return FontWeight.w200;
    } else if (fontWeight == CustomFontWeight.Light) {
      return FontWeight.w300;
    } else if (fontWeight == CustomFontWeight.Regular) {
      return FontWeight.w400;
    } else if (fontWeight == CustomFontWeight.Medium) {
      return FontWeight.w500;
    } else if (fontWeight == CustomFontWeight.SemiBold) {
      return FontWeight.w600;
    } else if (fontWeight == CustomFontWeight.Bold) {
      return FontWeight.w700;
    } else if (fontWeight == CustomFontWeight.ExtraBold) {
      return FontWeight.w800;
    } else if (fontWeight == CustomFontWeight.Black) {
      return FontWeight.w900;
    }
    return FontWeight.w400;
  }
}
