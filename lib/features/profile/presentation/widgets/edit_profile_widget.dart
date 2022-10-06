import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';

class ProfileEditWidget extends StatelessWidget {
  final String title;
  final String value;
  final Function()? onTap;
  final TextStyle? style;
  const ProfileEditWidget({
    Key? key,
    required this.title,
    required this.value,
    this.style,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 12.sp),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.sp),
              child: Text(
                title,
                style: text11mGB,
              ),
            ),
            const Spacer(),
            Container(
              constraints: BoxConstraints(maxWidth: 150.sp),
              child: Text(
                value,
                style: style ?? text11mCL,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
