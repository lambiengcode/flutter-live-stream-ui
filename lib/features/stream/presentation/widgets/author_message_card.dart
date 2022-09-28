import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/stream/data/models/message_model.dart';

class AuthorMessageCard extends StatefulWidget {
  final MessageModel messageModel;
  const AuthorMessageCard({Key? key, required this.messageModel})
      : super(key: key);

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
          CustomNetworkImage(
            height: 37.sp,
            width: 37.sp,
            urlToImage: widget.messageModel.imageUrl,
            shape: BoxShape.circle,
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
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 2.sp,
                ),
                Text(
                  widget.messageModel.message,
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10.sp,
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
