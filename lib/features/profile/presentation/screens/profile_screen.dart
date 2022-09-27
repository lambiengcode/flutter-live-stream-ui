import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/circle_icon.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/index_info_user.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/live_card_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 62.sp,
          backgroundColor: Theme.of(context).backgroundColor,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: CircleIcon(
              onTap: () {},
              icon: PhosphorIcons.arrow_left,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: CircleIcon(
                onTap: () {},
                icon: PhosphorIcons.dots_three,
              ),
            ),
          ],
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DetailInfoLiveUserWidget(user: user),
                SizedBox(height: 12.sp),
                Container(
                  height: 55.sp,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: true,
                      indicator: BoxDecoration(
                        color: colorPurple,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      tabs: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Tab(
                            child: Text(
                              "Live Stream",
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Tab(
                              child: Text(
                            "Stream Likes",
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.sp),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.sp,
                  childAspectRatio: 0.7,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 20.sp,
                  children: List.generate(
                    6,
                    (index) => LiveCardProflie(
                        imageLive:
                            "https://i.pinimg.com/564x/d3/d5/d8/d3d5d82fecda156b3d58beabc407f766.jpg",
                        viewerLive: 85546,
                        categoryLive: "Game",
                        onTap: () {}),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailInfoLiveUserWidget extends StatelessWidget {
  final UserModel user;
  const DetailInfoLiveUserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: colorBorderAvatar,
                ),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(3.sp),
                child: CircleAvatar(
                  radius: 25.sp,
                  backgroundImage: NetworkImage(
                    user.urlToImage,
                  ),
                ),
              ),
            ),
            IndexInfoUser(
              titleIndex: "Posts",
              numberIndex: user.posts!,
            ),
            IndexInfoUser(
              titleIndex: "Following",
              numberIndex: user.followings!,
            ),
            IndexInfoUser(
              titleIndex: "Followers",
              numberIndex: user.followers!,
            ),
          ],
        ),
        SizedBox(height: 5.sp),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.sp),
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 80.w),
                child: Text(
                  user.fullName,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 14.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(width: 2.sp),
              Icon(
                PhosphorIcons.circle_wavy_check_fill,
                size: 15.sp,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
        Linkify(
          onOpen: (link) async {},
          text: user.description!,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: 12.sp,
            height: 1.4,
          ),
          linkStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 12.sp),
        Wrap(
          spacing: 5.sp,
          runSpacing: -5.sp,
          children: List.generate(
            user.listFields!.length,
            (index) => Chip(
              backgroundColor: Colors.black12,
              label: Text(
                user.listFields![index],
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ],
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
