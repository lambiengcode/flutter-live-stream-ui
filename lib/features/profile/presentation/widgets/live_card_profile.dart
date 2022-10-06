import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/core/util/themes/app_icons.dart';
import 'package:streamskit_mobile/features/profile/data/live_card_model.dart';
import 'package:streamskit_mobile/features/profile/presentation/screens/profile_screen.dart';

class LiveCardProflie extends StatelessWidget {
  final LiveCardModel liveModel;
  final Function()? onTap;
  const LiveCardProflie({
    Key? key,
    required this.liveModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Stack(
        children: [
          CustomNetworkImage(
            urlToImage: liveModel.image,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.sp),
            height: 175.sp,
          ),
          liveModel.statusLive
              ? Positioned(
                  right: 5.sp,
                  top: 8.sp,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.sp,
                      vertical: 4.sp,
                    ),
                    decoration: BoxDecoration(
                      color: liveModel.getColorType,
                      borderRadius: BorderRadius.circular(
                        9.sp,
                      ),
                    ),
                    child: Text(
                      liveModel.getTitleType,
                      style: text9mCL,
                    ),
                  ),
                )
              : const SizedBox(),
          liveModel.statusLive
              ? Positioned(
                  left: 5.sp,
                  top: 8.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.sp),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 4,
                        sigmaY: 4,
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
                              color: Theme.of(context).primaryColorLight,
                            ),
                            SizedBox(width: 5.sp),
                            Text(
                              formatNumberViewer(liveModel.numberViewer),
                              style: text9mCL,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Container(
            alignment: Alignment.bottomLeft,
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 16.sp, left: 8.sp),
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
            child: Text('You update Ep Ep', style: text11mCL),
          )
        ],
      ),
    );
  }
}
