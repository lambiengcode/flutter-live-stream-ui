import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/chat/data/conversation_model.dart';

class ConversationCard extends StatefulWidget {
  final ConversationModel conversationModel;
  const ConversationCard({Key? key, required this.conversationModel})
      : super(key: key);

  @override
  State<ConversationCard> createState() => _ConversationCardState();
}

class _ConversationCardState extends State<ConversationCard> {
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
            // padding: EdgeInsets.all(3.5.sp),
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
                        style: TextStyle(fontSize: 10.sp, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.sp),
                      width: 14.sp,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          widget.conversationModel.countUnreadMessage
                              .toString(),
                          style: TextStyle(fontSize: 8.sp, color: Colors.white),
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
