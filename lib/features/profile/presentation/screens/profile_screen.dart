// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';
import 'package:streamskit_mobile/features/profile/data/list_live_card_model.dart';
import 'package:streamskit_mobile/features/profile/data/live_card_model.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/bottom_sheet_choose_option.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/circle_icon.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/details_info_live_user.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/gribview_live_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late AnimationController _colorAnimationController;
  late Animation colorTween, iconColorTween;
  late Animation<double> colorTitleTween;
  bool isMe = true;

  @override
  void initState() {
    // Initial controller
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    // Initial animation
    _colorAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    colorTween =
        ColorTween(begin: Colors.transparent, end: const Color(0xff0d0d0d))
            .animate(_colorAnimationController);
    iconColorTween =
        ColorTween(begin: const Color(0xff5a5959), end: const Color(0xff0d0d0d))
            .animate(_colorAnimationController);
    colorTitleTween =
        Tween<double>(begin: 0, end: 1).animate(_colorAnimationController);
    // Controller listen
    _scrollController.addListener(
      () {
        _colorAnimationController
            .animateTo(_scrollController.position.pixels / 160.sp);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _colorAnimationController.dispose();
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: AnimatedBuilder(
            animation: _colorAnimationController,
            builder: (context, child) => AppBar(
              elevation: 0,
              centerTitle: true,
              title: Opacity(
                opacity: colorTitleTween.value,
                child: Row(
                  children: [
                    CustomNetworkImage(
                      urlToImage: user.urlToImage,
                      height: 25.sp,
                      width: 25.sp,
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      "Tony Tony Chopper",
                      style: text13mCL,
                    ),
                  ],
                ),
              ),
              leading: !isMe
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: CircleIcon(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        icon: PhosphorIcons.arrow_left,
                        backgroundIcon: iconColorTween.value,
                      ),
                    )
                  : null,
              leadingWidth: 64.sp,
              backgroundColor: colorTween.value,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: CircleIcon(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) =>
                              const BottomSheetChooseOption());
                    },
                    icon: PhosphorIcons.dots_three,
                    backgroundIcon: iconColorTween.value,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 12.sp),
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: DetailInfoLiveUserWidget(user: user),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 0.5,
                        color: Colors.white24,
                      ),
                      TabBar(
                        onTap: (_) {},
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        indicatorSize: TabBarIndicatorSize.label,
                        automaticIndicatorColorAdjustment: false,
                        indicatorColor: mGB,
                        unselectedLabelStyle: TextStyle(
                          color: mGB,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        labelStyle: TextStyle(
                          color: mGB,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        isScrollable: true,
                        controller: _tabController,
                        tabs: [
                          Tab(
                            child: SizedBox(
                              width: 64.sp,
                              child: const Text("Live Stream"),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              width: 48.sp,
                              child: const Text("Last Live"),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              width: 30.sp,
                              child: const Text("Star"),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              width: 30.sp,
                              child: const Text("Posts"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: _tabController,
            children: [
              GridviewLiveCard(
                liveModel: listLiveStream.listLiveCardModel,
                type: listLiveStream.type,
              ),
              GridviewLiveCard(
                liveModel: [listLiveStream.listLiveCardModel[1]],
                type: listLiveStream.type,
              ),
              GridviewLiveCard(
                liveModel: [listLiveStream.listLiveCardModel[2]],
                type: listLiveStream.type,
              ),
              GridviewLiveCard(
                liveModel: [listLiveStream.listLiveCardModel[3]],
                type: listLiveStream.type,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListLiveCardModel listLiveStream = ListLiveCardModel(
    type: 1,
    listLiveCardModel: [
      LiveCardModel(
          id: "",
          idAccount: "",
          categoryLive: 4,
          image:
              "https://cyberxanh.vn/wp-content/uploads/2021/11/top-20-mau-thiet-ke-phong-livestream-game-cuc-dinh-33-1038x800.jpg",
          numberViewer: 950000001,
          statusLive: true),
      LiveCardModel(
          id: "",
          idAccount: "",
          categoryLive: 4,
          image:
              "https://cyberxanh.vn/wp-content/uploads/2021/11/top-20-mau-thiet-ke-phong-livestream-game-cuc-dinh-33-1038x800.jpg",
          numberViewer: 950000001,
          statusLive: true),
      LiveCardModel(
          id: "",
          idAccount: "",
          categoryLive: 4,
          image:
              "https://cyberxanh.vn/wp-content/uploads/2021/11/top-20-mau-thiet-ke-phong-livestream-game-cuc-dinh-33-1038x800.jpg",
          numberViewer: 950000001,
          statusLive: true),
      LiveCardModel(
          id: "",
          idAccount: "",
          categoryLive: 4,
          image:
              "https://cyberxanh.vn/wp-content/uploads/2021/11/top-20-mau-thiet-ke-phong-livestream-game-cuc-dinh-33-1038x800.jpg",
          numberViewer: 950000001,
          statusLive: true),
      LiveCardModel(
          id: "",
          idAccount: "",
          categoryLive: 3,
          image:
              "https://st.nhipcaudautu.vn/staticFile/Subject/2019/01/03/livestream-game_31517638.jpg",
          numberViewer: 78421,
          statusLive: true),
      LiveCardModel(
          id: "",
          idAccount: "",
          categoryLive: 2,
          image:
              "https://photo-cms-tinnhanhchungkhoan.zadn.vn/w660/Uploaded/2022/gtnwae/2022_03_14/z-a-5520.jpg",
          numberViewer: 78421,
          statusLive: true),
      LiveCardModel(
          id: "",
          idAccount: "",
          categoryLive: 1,
          image:
              "https://ecdn.game4v.com/g4v-content/uploads/2021/05/stream-1.jpg",
          numberViewer: 950000001,
          statusLive: true)
    ],
  );
  static const listFieldLive = [
    "Dota 2",
    "Mobile Legend",
    "LOL",
    "PUBG",
    "Rise of Kingdom",
    "Genshin Impact"
  ];
  final UserModel user = UserModel(
      id: "",
      urlToImage:
          "https://donoithatdanang.com/wp-content/uploads/2021/11/mang-hinh-khoa-cute-08.jpg",
      fullName: "Tony Tony Chopper",
      description:
          "Hành trình leo thách đấu mùa 12 cùng top lane!\nhttps://www.facebook.com/chopper189 \n11PM-12PM",
      posts: 1000,
      followers: 9400,
      followings: 8543337121,
      listFields: listFieldLive);
}
