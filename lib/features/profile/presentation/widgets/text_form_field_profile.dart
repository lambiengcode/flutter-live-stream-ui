// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';

class TextFormFieldProfile extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final double? iconSize;
  final Function(String)? onChanged;
  final Color? iconColor;
  final Widget? suffixWidget;
  final Widget? suffixIcon;
  final bool isVisibility;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  const TextFormFieldProfile({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.iconSize,
    this.iconColor,
    this.suffixWidget,
    this.inputFormatters,
    this.suffixIcon,
    this.isVisibility = true,
    this.focusNode,
    this.onChanged,
    this.validator,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
      child: Row(
        children: [
          Icon(
            icon,
            size: iconSize ?? 18.sp,
            color: iconColor ?? mCU,
          ),
          SizedBox(width: 16.sp),
          Expanded(
            child: TextFormField(
              validator: validator,
              onChanged: onChanged,
              obscureText: !isVisibility,
              focusNode: focusNode,
              keyboardType: TextInputType.number,
              inputFormatters: inputFormatters,
              style: text11mCL,
              cursorColor: colorPink,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                suffix: suffixWidget,
                suffixIcon: suffixIcon,
                isDense: maxLines == 1,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: mGD),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: mGD),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: mGD),
                ),
                hintText: hintText,
                hintStyle: text11mGM,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
