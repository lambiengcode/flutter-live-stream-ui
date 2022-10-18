import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class MessageCard extends StatefulWidget {
  final bool isMe;
  final String message;
  const MessageCard({Key? key, required this.isMe, required this.message})
      : super(key: key);

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            widget.isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Flexible(
            child: Text(widget.message),
          ),
        ],
      ),
    );
  }
}
