import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/features/profile/presentation/screens/setting_screen.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/row_icon_text.dart';

class BottomSheetChooseOption extends StatelessWidget {
  const BottomSheetChooseOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp).add(
        EdgeInsets.only(bottom: 10.sp),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.sp),
        ),
        color: Colors.grey.shade900,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DividerBottomSheet(),
          SizedBox(
            height: 8.sp,
          ),
          const RowIconText(
            title: "Creator tools",
            iconLeading: Icons.manage_accounts_outlined,
            iconSuffix: Icons.circle,
            colorSuffix: Colors.red,
          ),
          Divider(
            thickness: 0.2,
            color: mCU,
          ),
          RowIconText(
            title: "Settings and privacy",
            iconLeading: Icons.settings_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DividerBottomSheet extends StatelessWidget {
  const DividerBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 3.sp,
        width: 60.sp,
        decoration: BoxDecoration(
          color: colorDividerBottomSheetDark,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
