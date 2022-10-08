import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/app_bars/appbar_none.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/core/util/themes/app_icons.dart';
import 'package:streamskit_mobile/features/login/presentation/widgets/button_social.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBrighnessDark(context: context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          children: [
            SizedBox(height: 30.sp),
            Image.asset(
              'assets/images/img_login.png',
              width: 70.w,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 20.sp),
            Text(
              'Chào mừng đến với StreamKit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 15.sp),
            Text(
              'Ứng dụng sáng tạo, giải trí dành riêng cho bạn. Đến với StreamKit ngay hôm nay.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const ButtonSocial(
                    image: iconGoogle,
                    title: 'Google',
                  ),
                  SizedBox(height: 12.sp),
                  const ButtonSocial(
                    image: iconFacebook,
                    title: 'Facebook',
                    colorBackground: Colors.blueAccent,
                    colorTitle: Colors.white,
                  ),
                  SizedBox(height: 12.sp),
                  const ButtonSocial(
                    image: iconApple,
                    title: 'Apple',
                    colorBackground: Colors.black,
                    colorTitle: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.sp),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 13.sp,
                  color: colorGreyWhite,
                  height: 1.25.sp,
                ),
                children: [
                  const TextSpan(
                    text:
                        'Bạn cho chúng tôi biết rằng bạn đủ 13 tuổi trở lên và đồng ý với StreamKit ',
                  ),
                  TextSpan(
                    text: 'Các điều khoản',
                    style: TextStyle(
                      color: colorPink,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const TextSpan(
                    text: ' & ',
                  ),
                  TextSpan(
                    text: 'Chính sách riêng tư',
                    style: TextStyle(
                      color: colorPink,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.sp),
          ],
        ),
      ),
    );
  }
}
