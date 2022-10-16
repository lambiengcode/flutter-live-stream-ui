// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/bottom_sheet_choose_option.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/row_icon_text.dart';

class BottomSheetGender extends StatelessWidget {
  final Function handleSelectGender;
  const BottomSheetGender({super.key, required this.handleSelectGender});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DividerBottomSheet(),
          SizedBox(
            height: 8.sp,
          ),
          RowIconText(
            title: "Nam",
            onTap: () {
              Navigator.pop(context);
              handleSelectGender("Nam");
            },
          ),
          Divider(
            thickness: 0.2,
            color: mCU,
          ),
          RowIconText(
            title: "Nữ",
            onTap: () {
              Navigator.pop(context);
              handleSelectGender("Nữ");
            },
          ),
        ],
      ),
    );
  }
}
