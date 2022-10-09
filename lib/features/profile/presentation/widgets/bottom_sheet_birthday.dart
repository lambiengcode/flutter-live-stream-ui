import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/bottom_sheet_choose_option.dart';

class BottomSheetBirthday extends StatefulWidget {
  final Function(DateTime?) onDateChanged;
  final DateTime? dateInit;

  const BottomSheetBirthday({
    Key? key,
    required this.onDateChanged,
    required this.dateInit,
  }) : super(key: key);

  @override
  State<BottomSheetBirthday> createState() => _BottomSheetBirthdayState();
}

class _BottomSheetBirthdayState extends State<BottomSheetBirthday> {
  DateTime dateSelect = DateTime.now();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.sp),
        ),
        color: Colors.grey.shade900,
      ),
      child: Column(
        children: [
          const DividerBottomSheet(), 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.sp, vertical: 12.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 18.sp,
                ),
                Text(
                  DateFormat("dd-MM-yyyy").format(dateSelect),
                  style: text11mCL,
                ),
                TouchableOpacity(
                  onTap: () {
                    if (dateSelect != widget.dateInit) {
                      widget.onDateChanged(dateSelect);
                    }
                  },
                  child: Icon(
                    Icons.check_outlined,
                    color: mCU,
                    size: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: text11mCL,
                ),
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: widget.dateInit ??
                    DateTime(
                      DateTime.now().year - 1,
                    ),
                maximumDate: DateTime.now().toLocal(),
                minimumDate: DateTime(DateTime.now().year - 100),
                onDateTimeChanged: (date) {
                  setState(() {
                    dateSelect = date;
                  });
                },
                dateOrder: DatePickerDateOrder.dmy,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
