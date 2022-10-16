// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/navigator/app_pages.dart';
import 'package:streamskit_mobile/core/navigator/app_routes.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/row_icon_text.dart';

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
          onTap: () {
            AppNavigator.push(
              Routes.editProfileRoute,
            );
          },
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
