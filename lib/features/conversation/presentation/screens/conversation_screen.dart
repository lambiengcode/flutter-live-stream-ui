import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/app_bars/appbar_none.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/chat/data/conversation_model.dart';
import 'package:streamskit_mobile/features/conversation/presentation/widgets/conversation_header.dart';

class ConversationScreen extends StatefulWidget {
  final ConversationModel conversationModel;
  const ConversationScreen({Key? key, required this.conversationModel})
      : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: appBarBrighnessDark(
        context: context,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
        child: Column(
          children: [
            ConversationHeader(
              conversationModel: widget.conversationModel,
            ),
          ],
        ),
      ),
    );
  }
}
