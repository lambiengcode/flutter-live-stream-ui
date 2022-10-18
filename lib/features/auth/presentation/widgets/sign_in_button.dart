// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class SignInButton extends StatelessWidget {
  final String title;
  final String iconAsset;
  final Function() onPressed;

  const SignInButton({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.sp),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 11.25.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 14.5.w),
            Image.asset(
              iconAsset,
              height: 16.sp,
              width: 16.sp,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 10.sp),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.w700,
                fontSize: 11.5.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
