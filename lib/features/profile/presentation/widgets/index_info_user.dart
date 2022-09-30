import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/profile/presentation/screens/profile_screen.dart';

class IndexInfoUser extends StatelessWidget {
  final String titleIndex;
  final int numberIndex;
  const IndexInfoUser({
    Key? key,
    required this.titleIndex,
    required this.numberIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          formatNumberIndex(numberIndex),
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 2.sp),
        Text(
          titleIndex,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: 11.sp,
          ),
        ),
      ],
    );
  }
}
