// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/text_form_filed_request.dart';

class EditDescriptionScreen extends StatefulWidget {
  final String? description;
  const EditDescriptionScreen({Key? key, this.description}) : super(key: key);

  @override
  State<EditDescriptionScreen> createState() => _EditDescriptionScreenState();
}

class _EditDescriptionScreenState extends State<EditDescriptionScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  String description = "";

  @override
  void initState() {
    if (widget.description != null) {
      _descriptionController.text = widget.description!;
    } else {
      _descriptionController.text = "";
    }
    description = _descriptionController.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 64.sp,
        backgroundColor: Colors.transparent,
        titleSpacing: 0.sp,
        title: Text(
          "Update bio",
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              color: mGD,
            ),
            child: Column(
              children: [
                SizedBox(height: 4.sp),
                TextFieldFormRequest(
                  textStyle: text9mCL,
                  textStyleHint: text9mGM,
                  controller: _descriptionController,
                  maxLines: 7,
                  onChanged: (val) {
                    setState(() {
                      description = val;
                    });
                  },
                  maxLength: 300,
                  hintText:
                      "Chỉnh sửa tiểu sử của bạn, để nhiều người biết đến",
                  validatorForm: null,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(300),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 12.sp,
                    bottom: 8.sp,
                  ),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '${description.length.toString()}/300',
                    style: text11mGM,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.sp),
          TouchableOpacity(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.sp),
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.sp),
                color: colorPink,
              ),
              child: Text(
                "Xác nhận",
                style: text9mCL,
              ),
            ),
          )
        ],
      ),
    );
  }
}
