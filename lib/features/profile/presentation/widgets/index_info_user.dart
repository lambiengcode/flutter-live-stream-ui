// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/util/numeral/numeral.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';

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
          Numeral(numberIndex).format(),
          style: text13w700mCL,
        ),
        SizedBox(height: 2.sp),
        Text(
          titleIndex,
          style: text11mCL,
        ),
      ],
    );
  }
}
