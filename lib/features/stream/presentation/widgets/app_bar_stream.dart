import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/name_live_widget.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/viewer_widget.dart';

class AppBarStream extends StatelessWidget {
  const AppBarStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0.sp),
          child: Container(
            width: 32.sp,
            height: 32.sp,
            color: Colors.white.withOpacity(0.25),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 10.sp,
        ),
        const FullnameLiveWidget(),
        SizedBox(
          width: 18.sp,
        ),
        const ViewerWidget(),
      ],
    );
  }
}