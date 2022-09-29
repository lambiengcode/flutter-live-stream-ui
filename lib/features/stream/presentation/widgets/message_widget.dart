import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/stream/data/models/message_model.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/author_message_card.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({Key? key}) : super(key: key);

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  List<MessageModel> listMessageFake = [
    MessageModel(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGdhbus9QU3FSl_cwnCX6tCcxpYN-Wj5NVLg&usqp=CAU',
        fullName: 'Hà Anh Tuấn',
        message: 'Hát gì đi bạn ei :>'),
    MessageModel(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFjg_69eVjIeli08uXE09Z2ddWue-GINy2qg&usqp=CAU',
        fullName: 'Trung Ly Đeng',
        message: 'Đấm nhau khum'),
    MessageModel(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTywaXYb5-6bjevxgw_cD3bu0vcyW3J45g_w&usqp=CAU',
        fullName: 'Tuấn 5 củ',
        message: 'Liên minh ko em!!! :))'),
    MessageModel(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTywaXYb5-6bjevxgw_cD3bu0vcyW3J45g_w&usqp=CAU',
        fullName: 'Jack 5 củ',
        message: 'Bỏ vợ là nghề của em!!!. mọi người cứ tin em'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 200.sp,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listMessageFake.length,
              itemBuilder: (context, index) {
                return AuthorMessageCard(
                  messageModel: listMessageFake[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
