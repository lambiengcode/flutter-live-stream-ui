import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/text_form_field_profile.dart';

class EditPhoneNumberScreen extends StatefulWidget {
  final String? phoneNumber;
  const EditPhoneNumberScreen({Key? key, this.phoneNumber}) : super(key: key);

  @override
  State<EditPhoneNumberScreen> createState() => _EditPhoneNumberScreenState();
}

class _EditPhoneNumberScreenState extends State<EditPhoneNumberScreen>
    with CodeAutoFill {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController verifyController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  bool isVisibility = false;
  String _code = "";
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.phoneNumber != null) {
      phoneNumberController.text = widget.phoneNumber!;
    } else {
      phoneNumberController.text = "";
    }
    verifyController.text = "";
    newPasswordController.text = "";
    listenOtp();
  }

  @override
  void codeUpdated() {
    if (code == null) return;

    setState(() {
      verifyController.text = code!;
      _code = code!;
      focusNode.unfocus();
    });
  }

  void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    SmsAutoFill().listenForCode;
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
          "Link to phone number",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
              child: Text(
                "Nhập số điện thoại di động để nhận mã xác nhận miễn phí",
                style: TextStyle(
                  color: mCL,
                  fontSize: 9.5.sp,
                  overflow: TextOverflow.ellipsis,
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: 8.sp),
            TextFormFieldProfile(
              validator: (val) {
                if (val != "") {
                  if (val!.length < 9) {
                    return "Số điện thoại không đúng";
                  } else {
                    return null;
                  }
                } else {
                  return "Vui lòng nhập số điện thoại";
                }
              },
              icon: Icons.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly,
              ],
              hintText: "Nhập số điện thoại di động",
              controller: phoneNumberController,
            ),
            SizedBox(height: 5.sp),
            TextFormFieldProfile(
              validator: (val) {
                if (val != "") {
                  if (val!.length != 6) {
                    return "Mã xác nhận phải có đủ 6 kí tự";
                  } else {
                    return null;
                  }
                } else {
                  if (phoneNumberController.text != "" &&
                      phoneNumberController.text.length >= 9 &&
                      newPasswordController.text != "" &&
                      newPasswordController.text.length >= 6) {
                    return "Vui lòng nhập mã xác nhận";
                  } else {
                    return null;
                  }
                }
              },
              onChanged: (val) {
                setState(() {
                  _code = val;
                });
              },
              focusNode: focusNode,
              icon: Icons.verified_user_outlined,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
                FilteringTextInputFormatter.digitsOnly,
              ],
              hintText: "Nhập mã xác nhận",
              controller: verifyController,
              suffixIcon: TouchableOpacity(
                onTap: () async {
                  if (phoneNumberController.text.isNotEmpty) {
                    // var appSignalId = await SmsAutoFill().getAppSignature;
                    // Map sendOTP = {
                    //   "mobile_phone": phoneNumberController.text.toString(),
                    //   "app_signal_id": appSignalId
                    // };
                    // DEV: 0rF7BmP/yzk . PD:
                    // print(sendOTP.toString());
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20.sp),
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.sp, vertical: 5.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: colorPink,
                  ),
                  child: Text(
                    'Gửi mã xác nhận',
                    style: text7mCL,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.sp),
            TextFormFieldProfile(
              validator: (val) {
                if (val != "") {
                  if (val!.length < 6) {
                    return "Mật khẩu phải có ít nhất 6 kí tự";
                  } else {
                    return null;
                  }
                } else {
                  return "Vui lòng nhập mật khẩu";
                }
              },
              isVisibility: isVisibility,
              icon: Icons.lock_outline,
              hintText: "Nhập mật khẩu",
              suffixIcon: TouchableOpacity(
                child: Icon(
                  isVisibility ? Icons.visibility : Icons.visibility_off,
                  size: 16.sp,
                  color: mCU,
                ),
                onTap: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(32),
              ],
              controller: newPasswordController,
            ),
            SizedBox(height: 30.sp),
            TouchableOpacity(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // ignore: avoid_print
                  print(_code);
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
