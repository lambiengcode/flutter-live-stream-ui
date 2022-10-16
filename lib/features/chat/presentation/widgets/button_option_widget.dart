// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/navigator/app_pages.dart';

class ButtonOptionWidget extends StatelessWidget {
  final String text;
  final Function handlePressed;
  final bool isDanger;
  final bool isCancel;
  const ButtonOptionWidget({
    Key? key,
    required this.text,
    required this.handlePressed,
    this.isDanger = false,
    this.isCancel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        AppNavigator.pop();
        handlePressed();
      },
      child: Container(
        height: 42.sp,
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(
            color: isDanger
                ? Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xffdb5757)
                    : Colors.red.shade700
                : Colors.white, //Theme.of(context).textTheme.bodyText2!.color,
            fontSize: 13.sp,
            fontWeight: isCancel ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
