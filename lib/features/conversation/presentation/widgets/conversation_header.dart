import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/chat_style.dart';
import 'package:streamskit_mobile/core/util/themes/app_icons.dart';
import 'package:streamskit_mobile/features/chat/data/conversation_model.dart';
import 'package:streamskit_mobile/features/conversation/presentation/widgets/button_header_conversation.dart';

class ConversationHeader extends StatefulWidget {
  final ConversationModel conversationModel;
  const ConversationHeader({Key? key, required this.conversationModel})
      : super(key: key);

  @override
  State<ConversationHeader> createState() => _ConversationHeaderState();
}

class _ConversationHeaderState extends State<ConversationHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4.sp, right: 12.sp),
      child: Row(
        children: [
          TouchableOpacity(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              iconBack,
              width: 35.sp,
              color:
                  Theme.of(context).brightness == Brightness.dark ? mCU : null,
            ),
          ),
          SizedBox(
            width: 4.8.sp,
          ),
          Expanded(
            child: TouchableOpacity(
              onTap: () {},
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    CustomNetworkImage(
                        urlToImage: widget.conversationModel.urlUserImage,
                        height: 28.sp,
                        childInAvatar: const SizedBox()),
                    SizedBox(width: 10.sp),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.conversationModel.fullName,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? colorTextChatCardDark
                                  : colorTextChatCard,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Online',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 9.sp,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonHeaderConversation(
                iconAsset: iconPhoneRound,
                size: 16.sp,
                handlePressed: () {},
              ),
              ButtonHeaderConversation(
                iconAsset: iconVideoCall,
                size: 18.sp,
                handlePressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
