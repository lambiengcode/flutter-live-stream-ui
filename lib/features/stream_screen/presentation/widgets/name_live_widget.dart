import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class FullnameLiveWidget extends StatelessWidget {
  const FullnameLiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
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
                    child: Container(
                      width: 37.sp,
                      height: 37.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.8.sp, color: Colors.white),
                        borderRadius: BorderRadius.circular(100.sp),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://my-test-11.slatic.net/p/96b9cce35f664d67479547587686742a.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
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
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        SizedBox(
          width: 6.sp,
        ),
        Icon(
          Icons.check_circle_outline,
          color: Colors.blue.shade600,
          size: 14.sp,
        )
      ],
    );
  }
}
