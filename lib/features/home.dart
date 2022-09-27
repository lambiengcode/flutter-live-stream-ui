import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/chat/presentation/page/chat_page.dart';
import 'package:streamskit_mobile/features/home/presentation/page/home_page.dart';
import 'package:streamskit_mobile/features/profile/presentation/page/profile_page.dart';
import 'package:streamskit_mobile/features/search/presentation/page/search_page.dart';
import 'package:streamskit_mobile/features/stream_screen/presentation/pages/stream_page.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _tabs = [
    HomePage(),
    SearchPage(),
    StreamScreen(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _tabs[_currentIndex],
          SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GlassmorphicContainer(
                  width: double.infinity,
                  height: 70.sp,
                  borderRadius: 0,
                  blur: 7,
                  alignment: Alignment.bottomCenter,
                  border: 0,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF000000).withAlpha(55),
                        Color(0xFF000000).withAlpha(45),
                      ],
                      stops: [
                        0.3,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color(0xFF000000).withAlpha(100),
                      Color(0xFFFFFFF).withAlpha(55),
                      Color(0xFF000000).withAlpha(10),
                    ],
                    stops: [0.06, 0.95, 1],
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    height: 70.sp,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildItemBottomBar(
                          inActiveIcon: PhosphorIcons.houseLight,
                          activeIcon: PhosphorIcons.houseFill,
                          index: 0,
                        ),
                        _buildItemBottomBar(
                          inActiveIcon: PhosphorIcons.magnifyingGlassLight,
                          activeIcon: PhosphorIcons.magnifyingGlassFill,
                          index: 1,
                        ),
                        _buildItemBottomBar(
                          inActiveIcon: PhosphorIcons.videoCameraLight,
                          activeIcon: PhosphorIcons.videoCameraFill,
                          index: 2,
                        ),
                        _buildItemBottomBar(
                          inActiveIcon: PhosphorIcons.chatTeardropDotsLight,
                          activeIcon: PhosphorIcons.chatTeardropDotsFill,
                          index: 3,
                        ),
                        _buildItemBottomBar(
                          inActiveIcon: PhosphorIcons.userCircleLight,
                          activeIcon: PhosphorIcons.userCircleFill,
                          index: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemBottomBar({
    required IconData inActiveIcon,
    required IconData activeIcon,
    required int index,
  }) {
    return TouchableOpacity(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: index == _currentIndex ? colorPurple : Colors.transparent,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Icon(
          index == _currentIndex ? activeIcon : inActiveIcon,
          size: 21.sp,
          color: index == _currentIndex ? mCL : fCL,
        ),
      ),
    );
  }
}
