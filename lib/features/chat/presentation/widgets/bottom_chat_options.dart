// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/app/themes/box_shadow.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/chat_style.dart';
import 'package:streamskit_mobile/features/chat/presentation/widgets/button_option_widget.dart';

class BottomChatOptions extends StatefulWidget {
  const BottomChatOptions({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BottomChatOptionsState();
}

class _BottomChatOptionsState extends State<BottomChatOptions> {
  late final List<String> chatOptions;

  @override
  void initState() {
    super.initState();
    chatOptions = [
      'Tắt thông báo',
      'Xóa cuộc trò chuyện',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12.sp,
        horizontal: 10.sp,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color:
                    Theme.of(context).brightness == Brightness.dark ? mGD : mC,
                borderRadius: BorderRadius.circular(8.sp),
                boxShadow: BoxShadowStatic.boxShadow(context)),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: chatOptions.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    index > 0 ? dividerChat(context) : const SizedBox(),
                    ButtonOptionWidget(
                      text: chatOptions[index],
                      isDanger: index == chatOptions.length - 1,
                      handlePressed: () {},
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 4.sp),
          Container(
            height: 40.sp,
            decoration: BoxDecoration(
                color:
                    Theme.of(context).brightness == Brightness.dark ? mGD : mC,
                borderRadius: BorderRadius.circular(8.sp),
                boxShadow: BoxShadowStatic.boxShadow(context)),
            child: ButtonOptionWidget(
              text: 'Hủy',
              isCancel: true,
              handlePressed: () {},
            ),
          ),
          SizedBox(height: 4.sp),
        ],
      ),
    );
  }
}
