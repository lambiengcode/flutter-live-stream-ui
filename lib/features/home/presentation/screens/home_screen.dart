import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_icons.dart';
import 'package:streamskit_mobile/features/home/presentation/widgets/button_circle.dart';
import 'package:streamskit_mobile/features/home/presentation/widgets/list_category_home.dart';
import 'package:streamskit_mobile/features/home/presentation/widgets/list_live_stream.dart';
import 'package:streamskit_mobile/features/home/presentation/widgets/list_user_follow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // toolbarHeight: 40.sp,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Container(
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imageDefault,
                  height: 60.sp,
                  width: 60.sp,
                  fit: BoxFit.cover,
                ),
                Row(
                  children: [
                    ButtonCircle(
                      icon: PhosphorIcons.moonLight,
                      onTap: () {},
                    ),
                    SizedBox(width: 8.sp),
                    ButtonCircle(
                      icon: PhosphorIcons.bellLight,
                      onTap: () {},
                    ),
                    SizedBox(width: 8.sp),
                    ButtonCircle(
                      icon: PhosphorIcons.magnifyingGlassLight,
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 15.sp),
            const ListUserFollow(),
            SizedBox(height: 12.sp),
            const ListCategoryHome(),
            SizedBox(height: 20.sp),
            const ListLiveStream(),
          ],
        ),
      ),
    );
  }
}
