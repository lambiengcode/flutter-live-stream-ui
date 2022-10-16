// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/chat/data/conversation_model.dart';

class ChatCard extends StatefulWidget {
  final ConversationModel conversationModel;
  const ChatCard({
    Key? key,
    required this.conversationModel,
  }) : super(key: key);

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 6.sp),
      height: 50.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.2.sp,
                color: colorBlack2,
              ),
            ),
            child: CustomNetworkImage(
              height: 45.sp,
              width: 45.sp,
              urlToImage: widget.conversationModel.urlUserImage,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 8.sp,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.conversationModel.fullName,
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "04:01",
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.conversationModel.lastMessage,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: widget.conversationModel.isSeen
                                ? Colors.grey
                                : Colors.white),
                      ),
                    ),
                    widget.conversationModel.isSeen == true
                        ? const SizedBox()
                        : Container(
                            padding: EdgeInsets.all(4.sp),
                            width: 14.sp,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorPink,
                            ),
                            child: Center(
                              child: Text(
                                widget.conversationModel.countUnreadMessage
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 8.sp, color: Colors.white),
                              ),
                            ),
                          )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
