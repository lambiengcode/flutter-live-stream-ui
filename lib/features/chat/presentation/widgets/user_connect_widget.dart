// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';

class UserConnectWidget extends StatelessWidget {
  final UserModel userModel;
  final bool isAuthor;
  const UserConnectWidget(
      {Key? key, required this.userModel, required this.isAuthor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18.sp),
      child: Column(
        children: [
          Stack(
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
              Visibility(
                visible: isAuthor,
                child: Positioned(
                  bottom: 2.sp,
                  right: 5.sp,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    height: 16.sp,
                    width: 16.sp,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
    );
  }
}
