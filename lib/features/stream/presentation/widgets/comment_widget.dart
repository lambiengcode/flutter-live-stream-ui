import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
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
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Colors.black.withOpacity(0.20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(fontSize: 11.sp, color: Colors.white),
                      hintText: 'Type your comment...',
                      contentPadding: EdgeInsets.all(12.sp),
                      suffixIcon: Icon(
                        PhosphorIcons.paperPlaneTiltFill,
                        size: 16.0.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 14.sp,
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
                      height: 42.sp,
                      width: 42.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.sp),
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
              SizedBox(
                height: 10.sp,
              ),
              TouchableOpacity(
                onTap: () {},
                child: Container(
                  height: 42.sp,
                  width: 42.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                    color: Colors.black.withOpacity(0.20),
                  ),
                  child: Icon(
                    PhosphorIcons.giftThin,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
