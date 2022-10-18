// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/stream/data/models/message_model.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/author_message_card.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/floating_hearts.dart';
import 'package:streamskit_mobile/features/stream/provider/hearts_provider.dart';

class CommentWidgets extends StatefulWidget {
  const CommentWidgets({Key? key}) : super(key: key);

  @override
  State<CommentWidgets> createState() => _CommentWidgetsState();
}

class _CommentWidgetsState extends State<CommentWidgets> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.sp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.transparent,
                          Colors.white,
                          Colors.white,
                        ],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.sp),
                      height: 280.sp,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: listMessageFake.length,
                        itemBuilder: (context, index) {
                          return AuthorMessageCard(
                            messageModel: listMessageFake[index],
                            pin: false,
                          );
                        },
                      ),
                    ),
                  ),
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
                          color: Colors.grey.withOpacity(0.28),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(fontSize: 11.sp, color: Colors.grey),
                            hintText: 'Comment...',
                            contentPadding: EdgeInsets.all(12.sp),
                            suffixIcon: Container(
                              // padding: EdgeInsets.all(4.sp),
                              margin: EdgeInsets.all(4.sp),
                              width: 12.sp,
                              height: 12.sp,
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
                    SizedBox(
                      width: 2.sp,
                    ),
                    TouchableOpacity(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: 4.sp),
                        height: 40.sp,
                        width: 40.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.sp),
                          color: Colors.grey.withOpacity(0.28),
                        ),
                        child: Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                          size: 20.0.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 6.sp,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                child: FloatingHeartsWidget(),
              ),
              TouchableOpacity(
                onTap: () {
                  FloatingHeartsProvider floatingHeartsProvider =
                      context.read<FloatingHeartsProvider>();
                  floatingHeartsProvider.addHeart();
                },
                child: Container(
                  height: 40.sp,
                  width: 40.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp),
                    color: Colors.grey.withOpacity(0.28),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 24.0.sp,
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
