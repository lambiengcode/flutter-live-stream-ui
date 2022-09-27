import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';

class UserWidget extends StatelessWidget {
  final UserModel userModel;
  const UserWidget({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18.sp),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3.5.sp),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.2.sp,
                color: colorPurple2,
              ),
            ),
            // child: Container(
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: NetworkImage(
            //         userModel.urlToImage,
            //       ),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            child: CustomNetworkImage(
              height: 48.sp,
              width: 48.sp,
              urlToImage: userModel.urlToImage,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 12.sp),
          Text(
            userModel.fullName,
            style: TextStyle(
              color: mCL,
              fontSize: 10.sp,
            ),
          )
        ],
      ),
    );
  }
}
