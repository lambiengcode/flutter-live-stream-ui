// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/account_setting.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/content_setting.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/login_setting.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String version = "1.0.0";
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
          "Settings and privacy",
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
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.sp),
              const AccountSetting(),
              SizedBox(height: 8.sp),
              Divider(
                thickness: 0.2.sp,
                color: mCH,
              ),
              SizedBox(height: 12.sp),
              const ContentSetting(),
              SizedBox(height: 8.sp),
              Divider(
                thickness: 0.2.sp,
                color: mCH,
              ),
              SizedBox(height: 12.sp),
              const LoginSetting(),
              SizedBox(height: 50.sp),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Version app $version",
                  style: TextStyle(
                    color: fCD,
                    fontSize: 9.sp,
                  ),
                ),
              ),
              SizedBox(height: 12.sp),
            ],
          ),
        ),
      ),
    );
  }
}
