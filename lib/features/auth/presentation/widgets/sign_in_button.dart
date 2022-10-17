import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class SignInButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const SignInButton({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.sp),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 11.25.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 16.w),
          Icon(
            icon,
            size: 18.sp,
            color: color,
          ),
          SizedBox(width: 10.sp),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
