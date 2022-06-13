import 'package:drag_drop_flutter/app/utils/validators.dart';
import 'package:drag_drop_flutter/app/values/app_colors.dart';
import 'package:drag_drop_flutter/app/values/app_text_style.dart';
import 'package:drag_drop_flutter/app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? labelText, hintText;
  final String? initialValue, prefixText, suffixText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final int? maxLength, maxLines;
  final int minLines;
  final bool readOnly, addHint, enabled;
  final bool? isDense;
  final Function()? onTap;
  final InputBorder? border;
  final AutovalidateMode autovalidateMode;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? prefixIconPadding;
  final Color? fillColor;

  const CustomTextFieldWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator = Validators.validateEmpty,
    this.onChanged,
    this.onSaved,
    this.maxLength,
    this.maxLines,
    this.minLines = 1,
    this.initialValue,
    this.readOnly = false,
    this.onTap,
    this.border = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.kPrimaryColor)),
    this.enabled = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.addHint = false,
    this.suffixIconConstraints,
    this.prefixText,
    this.suffixText,
    this.isDense,
    this.prefixIconPadding,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyle.regularStyle.copyWith(
      color: AppColors.mineShaft,
      fontSize: 15,
    );

    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      initialValue: initialValue,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      onSaved: onSaved,
      enabled: enabled,
      inputFormatters: maxLength == null
          ? null
          : [
              LengthLimitingTextInputFormatter(maxLength),
              if (keyboardType == TextInputType.number)
                FilteringTextInputFormatter.digitsOnly,
            ],
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: fillColor != null,
        isDense: isDense,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        labelStyle: AppTextStyle.regularStyle,
        // alignLabelWithHint: maxLines == null,
        labelText: addHint
            ? null
            : ((controller?.text != null || !readOnly) ? labelText : null),
        hintText: hintText,
        hintStyle: AppTextStyle.regularStyle,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 40,
          maxWidth: 40,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: prefixIconPadding ?? const EdgeInsets.only(right: 10),
                child: prefixIcon,
              ),
        prefixText: prefixText,
        suffixText: suffixText,
        prefixStyle: textStyle,
        suffixStyle: textStyle,
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: suffixIcon,
              ),
        suffixIconConstraints: suffixIconConstraints ??
            const BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
      ),
    );
  }
}

class CustomTextFieldWithLabel extends StatelessWidget {
  final String? labelText, hintText;
  final String? initialValue, prefixText, suffixText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final int? maxLength, maxLines;
  final int minLines;
  final bool readOnly, addHint, enabled;
  final bool? isDense;
  final Function()? onTap;
  final InputBorder? border;
  final AutovalidateMode autovalidateMode;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? prefixIconPadding;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  const CustomTextFieldWithLabel(
      {Key? key,
      this.labelText,
      this.hintText,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType = TextInputType.text,
      this.validator = Validators.validateEmpty,
      this.onChanged,
      this.onSaved,
      this.maxLength,
      this.maxLines,
      this.minLines = 1,
      this.initialValue,
      this.readOnly = false,
      this.onTap,
      this.border = const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.FFCFD3DF)),
      this.enabled = true,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.addHint = false,
      this.suffixIconConstraints,
      this.prefixText,
      this.suffixText,
      this.isDense,
      this.prefixIconPadding,
      this.fillColor,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyle.regularStyle.copyWith(
      color: AppColors.mineShaft,
      fontSize: 15,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomText(
            text: "$labelText",
            size: 16,
            color: AppColors.FF1D1D1D,
          ),
        ),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          initialValue: initialValue,
          keyboardType: keyboardType,
          autovalidateMode: autovalidateMode,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          minLines: minLines,
          maxLines: maxLines,
          onSaved: onSaved,
          enabled: enabled,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          inputFormatters: maxLength == null
              ? null
              : [
                  LengthLimitingTextInputFormatter(maxLength),
                  if (keyboardType == TextInputType.number)
                    FilteringTextInputFormatter.digitsOnly,
                ],
          decoration: InputDecoration(
            /*helperText: ' ',*/
            contentPadding: contentPadding,
            fillColor: fillColor,
            filled: fillColor != null,
            isDense: isDense,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            labelStyle: AppTextStyle.regularStyle,
            // alignLabelWithHint: maxLines == null,
            // labelText: addHint
            //     ? null
            //     : ((controller?.text != null || !readOnly) ? labelText : null),
            hintText: hintText,
            hintStyle: AppTextStyle.hintTextStyle,
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding:
                        prefixIconPadding ?? const EdgeInsets.only(right: 10),
                    child: prefixIcon,
                  ),
            prefixText: prefixText,
            suffixText: suffixText,
            prefixStyle: textStyle,
            suffixStyle: textStyle,
            suffixIcon: suffixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: suffixIcon,
                  ),
            suffixIconConstraints: suffixIconConstraints ??
                const BoxConstraints(
                  maxHeight: 40,
                  maxWidth: 40,
                ),
          ),
        ),
      ],
    );
  }
}
