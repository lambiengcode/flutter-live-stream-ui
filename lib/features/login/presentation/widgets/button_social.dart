import 'package:flutter/material.dart';

import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class ButtonSocial extends StatelessWidget {
  final String title;
  final String image;
  final Color? colorBackground;
  final Color? colorTitle;
  const ButtonSocial({
    Key? key,
    required this.title,
    required this.image,
    this.colorBackground,
    this.colorTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorBackground ?? Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 18.sp,
            width: 18.sp,
            color: colorTitle,
          ),
          SizedBox(width: 15.sp),
          Text(
            'Sign In With $title',
            style: TextStyle(
              color: colorTitle ?? Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
