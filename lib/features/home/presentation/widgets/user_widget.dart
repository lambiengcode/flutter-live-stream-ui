// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
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
          margin: EdgeInsets.only(right: 8.sp),
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
                  height: 42.sp,
                  width: 42.sp,
                  urlToImage: userModel.urlToImage,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: 6.sp),
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
            right: 15,
            child: Container(
              padding: const EdgeInsets.only(
                left: 1,
                bottom: 1,
                right: 1,
              ),
              alignment: Alignment.center,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 9.sp),
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
