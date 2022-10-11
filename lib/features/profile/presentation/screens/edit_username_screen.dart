import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/text_form_filed_request.dart';

class EditUserNameScreen extends StatefulWidget {
  final String? username;
  const EditUserNameScreen({super.key, this.username});

  @override
  State<EditUserNameScreen> createState() => _EditUserNameScreenState();
}

class _EditUserNameScreenState extends State<EditUserNameScreen> {
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.username != null) {
      usernameController.text = widget.username!;
    } else {
      usernameController.text = "";
    }
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
          "Update user name",
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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
              child: TextFieldFormRequest(
                underLine: mGM,
                suffixIcon: TouchableOpacity(
                  child: Icon(
                    Icons.cancel,
                    size: 16.sp,
                    color: mGB,
                  ),
                  onTap: () {
                    setState(() {
                      usernameController.clear();
                    });
                  },
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(
                      "[ aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴzZ]")),
                ],
                validatorForm: (val) {
                  if (val != "") {
                    if (val!.length < 3) {
                      return "Tên hiển thị phải lớn hơn bằng 3";
                    } else {
                      return null;
                    }
                  } else {
                    return "Vui lòng nhập tên hiển thị";
                  }
                },
                hintText: "Tên hiển thị",
                controller: usernameController,
              ),
            ),
            SizedBox(height: 30.sp),
            TouchableOpacity(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20.sp),
                padding:
                    EdgeInsets.symmetric(horizontal: 4.sp, vertical: 12.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.sp),
                  color: colorPink,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Xong',
                    style: text11mCL,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
