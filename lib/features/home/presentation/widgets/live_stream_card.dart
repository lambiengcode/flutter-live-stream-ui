import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_icons.dart';
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';

class LiveStreamCard extends StatelessWidget {
  final LiveStreamModel liveStreamModel;
  const LiveStreamCard({Key? key, required this.liveStreamModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomNetworkImage(
          urlToImage: liveStreamModel.urlToImage,
          height: 150.sp,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            13.sp,
          ),
          // fit: BoxFit.cover,
        ),
        Positioned(
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.sp,
                    vertical: 4.sp,
                  ),
                  decoration: BoxDecoration(
                    color: liveStreamModel.getColorType,
                    borderRadius: BorderRadius.circular(
                      9.sp,
                    ),
                  ),
                  child: Text(
                    liveStreamModel.getTitleType,
                    style: TextStyle(
                      color: mCL,
                      fontSize: 9.sp,
                    ),
                  ),
                ),
                SizedBox(height: 2.sp),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 10,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.sp,
                        vertical: 4.sp,
                      ),
                      decoration: BoxDecoration(
                        color: mCH.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            iconEye,
                            height: 13.sp,
                            width: 13.sp,
                            fit: BoxFit.cover,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.sp),
                          Text(
                            '${liveStreamModel.peopleParticipant}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
