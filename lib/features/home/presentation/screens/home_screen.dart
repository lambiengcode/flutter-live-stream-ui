import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/app_bars/appbar_none.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
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
      appBar: appBarBrighnessDark(
        context: context,
        brightness: Brightness.dark,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 8.sp),
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
