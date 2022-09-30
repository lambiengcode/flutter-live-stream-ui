import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class FullnameLiveWidget extends StatelessWidget {
  const FullnameLiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomNetworkImage(
          height: 32.sp,
          width: 32.sp,
          urlToImage:
              'https://my-test-11.slatic.net/p/96b9cce35f664d67479547587686742a.jpg',
          shape: BoxShape.circle,
        ),
        SizedBox(
          width: 4.sp,
        ),
        Expanded(
          child: SizedBox(
            height: 48.sp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lord Busuz',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  '159K Followers',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        TouchableOpacity(
          child: Container(
            margin: EdgeInsets.only(right: 8.sp),
            padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.8.sp),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: Text(
              'Follow',
              style: TextStyle(fontSize: 10.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
