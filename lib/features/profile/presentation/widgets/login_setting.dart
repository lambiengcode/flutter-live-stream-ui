import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/row_icon_text.dart';

class LoginSetting extends StatelessWidget {
  const LoginSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LOGIN",
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Switch account",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.user_switch_thin,
          onTap: () {},
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Log out",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.sign_out,
          onTap: () {},
        ),
      ],
    );
  }
}
