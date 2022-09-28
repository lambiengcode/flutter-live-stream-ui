import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/stream/data/models/message_model.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/author_message_card.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/message_widget.dart';

class CommentWidgets extends StatefulWidget {
  const CommentWidgets({Key? key}) : super(key: key);

  @override
  State<CommentWidgets> createState() => _CommentWidgetsState();
}

class _CommentWidgetsState extends State<CommentWidgets> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.sp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                const Expanded(
                  child: MessageWidget(),
                ),
                AuthorMessageCard(
                  messageModel: pinMessageFake,
                  pin: true,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 4.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          color: Colors.black.withOpacity(0.20),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(fontSize: 11.sp, color: Colors.white),
                            hintText: 'Comment...',
                            contentPadding: EdgeInsets.all(12.sp),
                            suffixIcon: Container(
                              // padding: EdgeInsets.all(4.sp),
                              margin: EdgeInsets.all(4.sp),
                              width: 10.sp,
                              height: 10.sp,
                              decoration: BoxDecoration(
                                  color: Colors.purple.shade400,
                                  borderRadius: BorderRadius.circular(100.sp)),
                              child: Icon(
                                PhosphorIcons.paperPlaneTiltBold,
                                size: 16.0.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TouchableOpacity(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: 4.sp),
                        height: 40.sp,
                        width: 40.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          color: Colors.black.withOpacity(0.20),
                        ),
                        child: Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                          size: 16.0.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 4.sp,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TouchableOpacity(
                    onTap: () {},
                    child: Container(
                      height: 40.sp,
                      width: 40.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        color: Colors.black.withOpacity(0.20),
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 16.0.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
