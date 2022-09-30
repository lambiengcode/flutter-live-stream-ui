import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/name_live_widget.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/viewer_widget.dart';

class AppBarStream extends StatelessWidget {
  const AppBarStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: FullnameLiveWidget(),
          ),
          SizedBox(
            width: 6.sp,
          ),
          const ViewerWidget(),
        ],
      ),
    );
  }
}
