import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';

class UserWidget extends StatelessWidget {
  final UserModel userModel;

  const UserWidget({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 18.sp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(3.5.sp),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.2.sp,
                    color: userModel.isLiveStream ? colorPink : colorBlack2,
                  ),
                ),
                child: CustomNetworkImage(
                  height: 45.sp,
                  width: 45.sp,
                  urlToImage: userModel.urlToImage,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: 9.sp),
              Text(
                userModel.fullName,
                style: TextStyle(
                  color: userModel.isLiveStream ? mCL : fCL,
                  fontSize: 10.sp,
                  fontWeight: userModel.isLiveStream ? FontWeight.w500 : null,
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: userModel.isLiveStream,
          child: Positioned(
            right: 12,
            top: -2.6,
            child: Container(
              decoration: BoxDecoration(
                color: colorBlack1,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1.sp, horizontal: 9.sp),
                margin: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Text(
                  'Live',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
