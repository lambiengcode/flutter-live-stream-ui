import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/row_icon_text.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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

class LoginSetting extends StatelessWidget {
  const LoginSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LOGIN",
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Switch account",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.user_switch_thin,
          onTap: () {},
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Log out",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.sign_out,
          onTap: () {},
        ),
      ],
    );
  }
}

class ContentSetting extends StatelessWidget {
  const ContentSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CONTENT & ACTIVITY",
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Push notifications",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.bell,
          onTap: () {},
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Language",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.translate_thin,
          onTap: () {},
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Watch history",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.clock_counter_clockwise_thin,
          onTap: () {},
        ),
      ],
    );
  }
}

class AccountSetting extends StatelessWidget {
  const AccountSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ACCOUNT",
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Manage account",
          colorLeading: mCL,
          sizeLeading: 15.sp,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.user_thin,
          onTap: () {},
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Privacy",
          sizeLeading: 15.sp,
          colorLeading: mCL,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.lock_key_thin,
          onTap: () {},
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Balance",
          sizeLeading: 15.sp,
          colorLeading: mCL,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.wallet_thin,
          onTap: () {},
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "QR code",
          sizeLeading: 15.sp,
          colorLeading: mCL,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.qr_code_thin,
          onTap: () {},
        ),
        SizedBox(height: 8.sp),
        RowIconText(
          title: "Share profile",
          sizeLeading: 15.sp,
          colorLeading: mCL,
          textStyle: TextStyle(color: mCL, fontSize: 11.sp),
          iconLeading: PhosphorIcons.share_thin,
          onTap: () {},
        ),
      ],
    );
  }
}
