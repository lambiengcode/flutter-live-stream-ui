import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
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
          height: 180.sp,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            13.sp,
          ),
          // fit: BoxFit.cover,
        ),
        Column(
          children: [
            Container(
              height: 180.sp,
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.89)],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(
                  13.sp,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.sp),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 10,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.sp,
                              vertical: 2.sp,
                            ),
                            decoration: BoxDecoration(
                              color: mCH.withOpacity(0.45),
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
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.sp,
                          vertical: 2.sp,
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
                    ],
                  ),
                  Text(
                    'You update Ep Ep',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.sp),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomNetworkImage(
                  urlToImage:
                      'https://cdn.dribbble.com/users/3245638/screenshots/15628559/media/21f20574f74b6d6f8e74f92bde7de2fd.png?compress=1&resize=400x300&vertical=top',
                  height: 30.sp,
                ),
                SizedBox(width: 5.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Randy Rangers',
                      style: TextStyle(
                        color: mCL,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '159K Followers',
                      style: TextStyle(
                        color: fCL,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                TouchableOpacity(
                  onTap: () {},
                  child: Container(
                    color: Colors.transparent,
                    child: Icon(
                      PhosphorIcons.dotsThreeVerticalFill,
                      size: 20.sp,
                      color: fCL,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
