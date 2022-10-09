import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';

class TextFieldFormRequest extends StatelessWidget {
  final String? Function(String?)? validatorForm;
  final void Function(String)? onChanged;
  final String hintText;
  final int maxLines;
  final int? maxLength;
  final bool isAvailable;
  final bool isActive;
  final TextStyle? textStyle;
  final TextStyle? textStyleHint;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final Color? colorTextField;
  final void Function()? onTap;
  final double? height;
  final AutovalidateMode? autovalidateMode;
  final Color? underLine;

  const TextFieldFormRequest({
    Key? key,
    required this.validatorForm,
    required this.hintText,
    this.textInputType,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.isAvailable = true,
    this.isActive = true,
    this.controller,
    this.suffixIcon,
    this.inputFormatters,
    this.focusNode,
    this.colorTextField,
    this.onTap,
    this.height,
    this.autovalidateMode,
    this.textStyle,
    this.textStyleHint,
    this.underLine,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: maxLength != null ? 0.0 : 10.sp,
          bottom: maxLength != null ? 4.sp : 0.0),
      width: double.infinity,
      child: TextFormField(
        onTap: onTap ?? () {},
        validator: validatorForm,
        focusNode: focusNode,
        controller: controller,
        style: textStyle ?? text11mCL,
        cursorColor: colorPink,
        keyboardType: textInputType ?? TextInputType.multiline,
        onChanged: onChanged,
        maxLines: maxLines == 1 ? null : maxLines,
        inputFormatters: inputFormatters ??
            [
              LengthLimitingTextInputFormatter(maxLength),
            ],
        decoration: InputDecoration(
          fillColor: mGM,
          hintText: hintText,
          hintStyle: textStyleHint ?? text11mGM,
          isDense: maxLines == 1,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLine ?? mGD),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLine ?? mGD),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: underLine ?? mGD),
          ),
          contentPadding: maxLines == 1
              ? EdgeInsets.symmetric(
                  vertical: 11.sp,
                  horizontal: 10.sp,
                )
              : EdgeInsets.symmetric(
                  vertical: 8.sp,
                  horizontal: 10.sp,
                ),
          suffix: suffixIcon,
        ),
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
