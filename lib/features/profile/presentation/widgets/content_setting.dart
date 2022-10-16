// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/row_icon_text.dart';

class ContentSetting extends StatelessWidget {
  const ContentSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CONTENT & ACTIVITY",
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Push notifications",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.bell,
          onTap: () {},
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Language",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.translate_thin,
          onTap: () {},
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Watch history",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.clock_counter_clockwise_thin,
          onTap: () {},
        ),
      ],
    );
  }
}
