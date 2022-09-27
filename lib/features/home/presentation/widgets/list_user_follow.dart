import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';
import 'package:streamskit_mobile/features/home/presentation/widgets/user_widget.dart';

class ListUserFollow extends StatelessWidget {
  const ListUserFollow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88.sp,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        itemCount: listUserFake.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return UserWidget(
            userModel: listUserFake[index],
          );
        }),
      ),
    );
  }
}
