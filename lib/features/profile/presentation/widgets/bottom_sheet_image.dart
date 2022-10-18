// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/bottom_sheet_choose_option.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/row_icon_text.dart';

class BottomSheetImage extends StatefulWidget {
  final Function(String)? handleFinish;
  const BottomSheetImage({Key? key, this.handleFinish}) : super(key: key);

  @override
  State<BottomSheetImage> createState() => _BottomSheetImageState();
}

class _BottomSheetImageState extends State<BottomSheetImage> {
  final _picker = ImagePicker();

  Future<XFile?> getImage({context, source = ImageSource.gallery}) async {
    return await _picker.pickImage(source: source, imageQuality: 100);
  }

  Future<void> handleImagePicker(
    BuildContext context, {
    ImageSource source = ImageSource.gallery,
    Function? handleFinish,
  }) async {
    try {
      Navigator.pop(context);
      XFile? image = await getImage(
        context: context,
        source: source,
      );
      if (image != null && handleFinish != null) {
        handleFinish(image.path);
      }
    } catch (exception) {
      // ignore: avoid_print
      print(exception);
    }
  }

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
          Text(
            'New Avatar',
            style: text13w700mCL,
          ),
          SizedBox(
            height: 8.sp,
          ),
          RowIconText(
            iconLeading: Icons.image_outlined,
            title: "Gallery",
            onTap: () async {
              await handleImagePicker(context,
                  source: ImageSource.gallery,
                  handleFinish: widget.handleFinish);
            },
          ),
          Divider(
            thickness: 0.2,
            color: mCU,
          ),
          RowIconText(
            iconLeading: Icons.camera,
            title: "Camera",
            onTap: () async {
              await handleImagePicker(context,
                  source: ImageSource.camera,
                  handleFinish: widget.handleFinish);
            },
          ),
        ],
      ),
    );
  }
}
