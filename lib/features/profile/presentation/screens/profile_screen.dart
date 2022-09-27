import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/circle_icon.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> listFieldLive = [
    "Dota 2",
    "Mobile Legend",
    "LOL",
    "PUBG",
    "Rise of Kingdom",
    "Genshin Impact"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp).add(
            EdgeInsets.only(top: 5.sp),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleIcon(
                      onTap: () {
                        // print("back");
                      },
                      icon: PhosphorIcons.arrow_left,
                    ),
                    const Spacer(),
                    CircleIcon(
                      onTap: () {
                        // print("show");
                      },
                      icon: PhosphorIcons.dots_three,
                    ),
                  ],
                ),
                SizedBox(height: 12.sp),
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
                          backgroundImage: const NetworkImage(
                            "https://donoithatdanang.com/wp-content/uploads/2021/11/mang-hinh-khoa-cute-08.jpg",
                          ),
                        ),
                      ),
                    ),
                    const IndexInfoUser(
                      titleIndex: "Posts",
                      numberIndex: 18,
                    ),
                    const IndexInfoUser(
                      titleIndex: "Following",
                      numberIndex: 9,
                    ),
                    const IndexInfoUser(
                      titleIndex: "Followers",
                      numberIndex: 2000,
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
                          "Tony Tony Chopper",
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(width: 2.sp),
                      Icon(
                        PhosphorIcons.circle_wavy_check_fill,
                        size: 16.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Linkify(
                  onOpen: (link) async {},
                  text:
                      "Hành trình leo thách đấu mùa 12 cùng top lane!\nhttps://www.facebook.com/chopper189 \n11PM-12PM",
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
                  children: List.generate(
                    listFieldLive.length,
                    (index) => Chip(
                      backgroundColor: Colors.black12,
                      label: Text(
                        listFieldLive[index],
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.sp),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.sp,
                  childAspectRatio: 0.7,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 20.sp,
                  children: List.generate(
                    6,
                    (index) => Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(16.sp),
                            image: const DecorationImage(
                                image: NetworkImage(
                                  "https://i.pinimg.com/564x/d3/d5/d8/d3d5d82fecda156b3d58beabc407f766.jpg",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          right: 5.sp,
                          top: 0,
                          child: Chip(
                            label: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.sp),
                              child: Text(
                                "Game",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorLight,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ),
                            backgroundColor: colorReds400,
                          ),
                        ),
                        Positioned(
                          right: 5.sp,
                          top: 35.sp,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.sp),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 2,
                                sigmaY: 2,
                              ),
                              child: Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.sp),
                                height: 25.sp,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(16.sp),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      PhosphorIcons.eye,
                                      size: 15.sp,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                    SizedBox(width: 2.sp),
                                    Text(
                                      formatNumberViewer(999999),
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

class IndexInfoUser extends StatelessWidget {
  final String titleIndex;
  final int numberIndex;
  const IndexInfoUser({
    Key? key,
    required this.titleIndex,
    required this.numberIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          formatNumberIndex(numberIndex),
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 2.sp),
        Text(
          titleIndex,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: 11.sp,
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
  if (number < 95000) {
    return number.toString();
  } else if (number >= 9500 && number < 950000) {
    return '${(number / 1000).toStringAsFixed(1)}K';
  } else if (number >= 9500000 && number < 950000000) {
    return '${(number / 1000000).toStringAsFixed(1)}M';
  } else {
    return '${(number / 1000000000).toStringAsFixed(1)}B';
  }
}
