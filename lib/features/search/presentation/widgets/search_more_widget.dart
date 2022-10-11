import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';

class SearchMoreWidget extends StatelessWidget {
  final String nameStreamer;
  final String stt;
  final Color sttColor;
  const SearchMoreWidget({
    Key? key,
    required this.nameStreamer,
    required this.stt,
    required this.sttColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15.sp,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [sttColor.withOpacity(0.6), sttColor],
              stops: const [0.0, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            shape: BoxShape.circle,
            border: Border.all(
              width: 0.5,
              color: mCL,
            ),
          ),
          child: Align(
              alignment: Alignment.center, child: Text(stt, style: text9mCL)),
        ),
        SizedBox(
          width: 8.sp,
        ),
        Text(
          nameStreamer,
          style: text11mCL,
        ),
      ],
    );
  }
}
