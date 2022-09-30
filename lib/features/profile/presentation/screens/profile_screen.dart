import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';
import 'package:streamskit_mobile/features/profile/data/list_live_card_model.dart';
import 'package:streamskit_mobile/features/profile/data/live_card_model.dart';
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
  ListLiveCardModel listLiveStream = ListLiveCardModel(
    type: 1,
    listLiveCardModel: [
      LiveCardModel(
          id: "",
          idAccount: "",
          image:
              "https://cyberxanh.vn/wp-content/uploads/2021/11/top-20-mau-thiet-ke-phong-livestream-game-cuc-dinh-33-1038x800.jpg",
          numberViewer: 10000,
          statusLive: true),
      LiveCardModel(
          id: "",
          idAccount: "",
          image:
              "https://st.nhipcaudautu.vn/staticFile/Subject/2019/01/03/livestream-game_31517638.jpg",
          numberViewer: 78421,
          statusLive: true),
      LiveCardModel(
          id: "",
          idAccount: "",
          image:
              "https://photo-cms-tinnhanhchungkhoan.zadn.vn/w660/Uploaded/2022/gtnwae/2022_03_14/z-a-5520.jpg",
          numberViewer: 78421,
          statusLive: false),
      LiveCardModel(
          id: "",
          idAccount: "",
          image:
              "https://ecdn.game4v.com/g4v-content/uploads/2021/05/stream-1.jpg",
          numberViewer: 78421,
          statusLive: false)
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
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 80.sp,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: CircleIcon(
              onTap: () {},
              icon: PhosphorIcons.arrow_left,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: CircleIcon(
                onTap: () {},
                icon: PhosphorIcons.dots_three,
              ),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: DetailInfoLiveUserWidget(user: user),
                ),
              ),
              SliverToBoxAdapter(
                child: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: TabBar(
                      onTap: (_) {},
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
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
                            width: 20.w,
                            child: const Text("Live Stream"),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 16.w,
                            child: const Text("Last Live"),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 10.w,
                            child: const Text("Star"),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 10.w,
                            child: const Text("Posts"),
                          ),
                        ),
                      ],
                    ),
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
                liveModel: listLiveStream.listLiveCardModel[0],
              ),
              GridviewLiveCard(
                liveModel: listLiveStream.listLiveCardModel[1],
              ),
              GridviewLiveCard(
                liveModel: listLiveStream.listLiveCardModel[2],
              ),
              GridviewLiveCard(
                liveModel: listLiveStream.listLiveCardModel[3],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatNumberViewer(int number) {
  if (number <= 0) return "0";
  if (number < 950) {
    return number.toString();
  } else if (number >= 950 && number < 950000) {
    return '${(number / 1000).toStringAsFixed(1)}K';
  } else if (number >= 950000 && number < 950000000) {
    return '${(number / 1000000).toStringAsFixed(1)}M';
  } else {
    return '${(number / 1000000000).toStringAsFixed(1)}B';
  }
}

String formatNumberIndex(int number) {
  if (number <= 0) return "0";
  if (number < 9500) {
    return number.toString();
  } else if (number >= 9500 && number < 950000) {
    return '${(number / 1000).toStringAsFixed(1)}K';
  } else if (number >= 950000 && number < 950000000) {
    return '${(number / 1000000).toStringAsFixed(1)}M';
  } else {
    return '${(number / 1000000000).toStringAsFixed(1)}B';
  }
}
