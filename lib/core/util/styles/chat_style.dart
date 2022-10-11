import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

Divider dividerChat(BuildContext context) {
  return Divider(
    color: colorDividerTimeline,
    thickness: 0.2,
    height: 0.2,
  );
}

Divider dividerChatWithPadding(context) {
  return Divider(
    color: colorDividerTimeline,
    thickness: 0.2,
    height: 0.2,
    indent: 12.sp,
    endIndent: 12.sp,
  );
}
