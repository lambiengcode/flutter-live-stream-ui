import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class FullnameLiveWidget extends StatelessWidget {
  const FullnameLiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 48.sp,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 40.sp,
                  height: 40.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.sp),
                      color: Colors.pink.shade300),
                  child: Center(
                    child: CustomNetworkImage(
                      height: 37.sp,
                      width: 37.sp,
                      urlToImage:
                          'https://my-test-11.slatic.net/p/96b9cce35f664d67479547587686742a.jpg',
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(3.sp),
                  padding: EdgeInsets.symmetric(horizontal: 3.sp),
                  height: 14.sp,
                  width: 31.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp),
                    color: Colors.red.shade400,
                  ),
                  child: Center(
                    child: Text(
                      'Live',
                      style: TextStyle(fontSize: 9.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 8.sp,
        ),
        Text(
          'Lord Busuz',
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
        SizedBox(
          width: 6.sp,
        ),
        Icon(
          PhosphorIcons.circle_wavy_check_fill,
          size: 14.0.sp,
          color: const Color(0xff3689e2),
        ),
      ],
    );
  }
}
