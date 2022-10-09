import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/bottom_sheet_gender.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/edit_profile_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserModel user = UserModel(
      id: "",
      urlToImage:
          "https://donoithatdanang.com/wp-content/uploads/2021/11/mang-hinh-khoa-cute-08.jpg",
      fullName: "Tony Tony Chopper",
      description:
          "Hành trình leo thách đấu mùa 12 cùng top lane!\nhttps://www.facebook.com/chopper189 \n11PM-12PM",
      posts: 1000,
      followers: 9400,
      followings: 8543337121,
      listFields: null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 64.sp,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Edit profile",
          style: text13w700mCL,
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: TouchableOpacity(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              PhosphorIcons.arrow_left,
              color: mCL,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TouchableOpacity(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.sp),
                    child: Text(
                      "Ảnh đại diện",
                      style: text11mGB,
                    ),
                  ),
                  const Spacer(),
                  CustomNetworkImage(
                    urlToImage: user.urlToImage,
                    height: 36.sp,
                    width: 36.sp,
                  ),
                  SizedBox(
                    width: 1.sp,
                  ),
                  Icon(
                    Icons.navigate_next,
                    size: 18.sp,
                    color: mGB,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 12.sp),
          ProfileEditWidget(
            onTap: () {},
            title: "Nickname/Tên hiển thị",
            value: "Tony Tony Chopper",
          ),
          SizedBox(height: 4.sp),
          ProfileEditWidget(
            onTap: () {},
            title: "ID",
            value: "58965874",
            style: text11mGB,
          ),
          SizedBox(height: 12.sp),
          ProfileEditWidget(
            onTap: () {},
            title: "Giới thiệu cá nhân",
            value:
                "Hành trình leo thách đấu mùa 12 cùng top lane!\nhttps://www.facebook.com/chopper189 \n11PM-12PM",
          ),
          SizedBox(height: 12.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
            child: Text(
              "Personal Information",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 9.sp,
              ),
            ),
          ),
          SizedBox(height: 12.sp),
          ProfileEditWidget(
            onTap: () {},
            title: "Số điện thoại",
            value: user.phoneNumber ?? "Số điện thoại",
            style: user.phoneNumber == null ? text11mGM : null,
          ),
          SizedBox(height: 2.sp),
          ProfileEditWidget(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => BottomSheetGender(
                  handleSelectGender: (value) {
                    if (value != null) {
                      setState(() {
                        user.gender = value == "Nam" ? true : false;
                      });
                    }
                  },
                ),
              );
            },
            title: "Giới tính",
            value: user.gender ? "Nam" : "Nữ",
          ),
          SizedBox(height: 2.sp),
          ProfileEditWidget(
            onTap: () {},
            title: "Ngày sinh",
            value: (user.birthday ?? "").toString(),
          ),
        ],
      ),
    );
  }
}
