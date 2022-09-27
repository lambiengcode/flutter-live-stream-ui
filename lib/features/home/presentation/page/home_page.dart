import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:streamskit_mobile/core/util/app_bars/appbar_none.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
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
                      : Container(
                          height: 100.sp,
                          color: Colors.red,
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
