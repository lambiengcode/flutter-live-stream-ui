import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class ButtonHeaderConversation extends StatefulWidget {
  final String iconAsset;
  final Function handlePressed;
  final double size;
  final Color? color;
  const ButtonHeaderConversation({
    Key? key,
    required this.iconAsset,
    required this.handlePressed,
    required this.size,
    this.color,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ButtonHeaderConversationState();
}

class _ButtonHeaderConversationState extends State<ButtonHeaderConversation> {
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        widget.handlePressed();
      },
      child: Container(
        height: 32.sp,
        width: 32.sp,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Image.asset(
          widget.iconAsset,
          width: widget.size,
          color: widget.color ??
              (Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : null),
        ),
      ),
    );
  }
}
