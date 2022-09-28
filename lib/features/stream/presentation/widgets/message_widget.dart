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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
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
