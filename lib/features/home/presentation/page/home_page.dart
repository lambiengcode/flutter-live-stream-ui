import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:streamskit_mobile/core/util/app_bars/appbar_none.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/home/presentation/widget/list_category_home.dart';
import 'package:streamskit_mobile/features/home/presentation/widget/list_user_follow.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarBrighnessDark(
        context: context,
        brightness: Brightness.dark,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(height: 40.sp),
            ListUserFollow(),
            SizedBox(height: 15.sp),
            ListCategoryHome(),
            SizedBox(height: 20.sp),
            Expanded(
              child: MasonryGridView.count(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.sp, vertical: 0.sp),
                crossAxisCount: 2,
                mainAxisSpacing: 15.sp,
                crossAxisSpacing: 15.sp,
                itemBuilder: (context, index) {
                  return index == 1
                      ? Container(
                          height: 80.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/img_start_stream.png',
                              ),
                            ),
                          ),
                        )
                      : Stack(
                          children: [
                            CustomNetworkImage(
                              urlToImage:
                                  'https://blogger.googleusercontent.com/img/a/AVvXsEidz_saG2QkwDXMS7aP6Xx_gxMkk1kUj8B0PXI2nlKhVoBKp5v0Rm6IPRf93H4UjdzZe06W2Hy-yXtiC1yu7-wFYmrA19Zzvv-sQUPYyKxRfgpwtnPJaGcDXW5wK1DRFYvEa70DX2H-WYYntvlwsCiDtv764ZC4whZ96DJ-zFwC6dcfGLcf4oBFgOu6vg=w640-h360',
                              height: 150.sp,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(
                                13.sp,
                              ),
                              fit: BoxFit.cover,
                            ),
                            Container(
                              height: 150.sp,
                              padding: EdgeInsets.all(8.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 7.sp,
                                      vertical: 4.sp,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(
                                        9.sp,
                                      ),
                                    ),
                                    child: Text(
                                      'Game',
                                      style: TextStyle(
                                        color: mCL,
                                        fontSize: 9.sp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
