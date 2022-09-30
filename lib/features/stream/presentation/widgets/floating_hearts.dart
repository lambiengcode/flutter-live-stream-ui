import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/stream/provider/hearts_provider.dart';

class FloatingHeartsWidget extends StatelessWidget {
  const FloatingHeartsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    FloatingHeartsProvider floatingHeartsProvider =
        context.watch<FloatingHeartsProvider>();

    return Padding(
      padding: EdgeInsets.only(bottom: 8.sp),
      child: Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          width: 40.sp,
          child: Stack(children: floatingHeartsProvider.hearts),
        ),
      ),
    );
  }
}
