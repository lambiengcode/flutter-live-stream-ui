import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class ViewerWidget extends StatefulWidget {
  ViewerWidget({Key? key}) : super(key: key);

  @override
  State<ViewerWidget> createState() => _ViewerWidgetState();
}

class _ViewerWidgetState extends State<ViewerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.sp),
      padding: EdgeInsets.symmetric(horizontal: 6.sp),
      height: 24.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.sp),
        color: Colors.white.withOpacity(0.25),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.white,
              size: 14.sp,
            ),
            SizedBox(
              width: 6.sp,
            ),
            Text(
              '1826',
              style: TextStyle(fontSize: 11.sp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
