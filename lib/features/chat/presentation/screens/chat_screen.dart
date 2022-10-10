import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';

import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/chat_style.dart';
import 'package:streamskit_mobile/features/chat/data/conversation_model.dart';
import 'package:streamskit_mobile/features/chat/presentation/widgets/bottom_chat_options.dart';
import 'package:streamskit_mobile/features/chat/presentation/widgets/chat_card.dart';
import 'package:streamskit_mobile/features/chat/presentation/widgets/search_box.dart';
import 'package:streamskit_mobile/features/chat/presentation/widgets/user_connect_widget.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _showBottomSheetOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      isScrollControlled: true,
      barrierColor: Colors.black38,
      builder: (context) {
        return const BottomChatOptions();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 36.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBox(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
            child: Text(
              "Recent",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp),
            ),
          ),
          SizedBox(
            height: 88.sp,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              itemCount: listUserFake.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                if (index == 0) {
                  return UserConnectWidget(
                    userModel: listUserFake[index],
                    isAuthor: true,
                  );
                }
                return UserConnectWidget(
                  userModel: listUserFake[index],
                  isAuthor: false,
                );
              }),
            ),
          ),
          dividerChatWithPadding(context),
          SizedBox(
            height: 20.sp,
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.sp)
                    .add(EdgeInsets.only(bottom: 78.sp)),
                itemBuilder: (context, index) {
                  return TouchableOpacity(
                      onLongPress: () {
                        _showBottomSheetOptions();
                      },
                      child:
                          ChatCard(conversationModel: conversationFake[index]));
                },
                itemCount: conversationFake.length),
          ),
        ],
      ),
    );
  }
}
