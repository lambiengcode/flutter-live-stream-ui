import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/stream_screen/data/models/message_model.dart';

class AuthorMessageCard extends StatefulWidget {
  final MessageModel messageModel;
  AuthorMessageCard({Key? key, required this.messageModel}) : super(key: key);

  @override
  State<AuthorMessageCard> createState() => _AuthorMessageCardState();
}

class _AuthorMessageCardState extends State<AuthorMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 38.sp,
            height: 38.sp,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 1.4, color: Colors.white),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  widget.messageModel.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10.sp,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.messageModel.fullName,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  widget.messageModel.message,
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
