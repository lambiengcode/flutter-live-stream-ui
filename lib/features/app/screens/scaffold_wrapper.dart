import 'package:flutter/cupertino.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class ScaffoldWrapper extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const ScaffoldWrapper({
    super.key,
    this.isLoading = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: isLoading,
          child: child,
        ),
        Visibility(
          visible: isLoading,
          child: Container(
            alignment: Alignment.center,
            color: const Color(0x80000000),
            child: CupertinoActivityIndicator(
              radius: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
