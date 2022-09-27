import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:streamskit_mobile/features/profile/widgets/circle_icon.dart';

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
      backgroundColor: Colors.black12,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24).add(
          EdgeInsets.only(top: 50),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                child: Row(
                  children: [
                    CircleIcon(
                      onTap: () {
                        print("back");
                      },
                      icon: PhosphorIcons.arrow_left,
                    ),
                    Spacer(),
                    CircleIcon(
                      onTap: () {
                        print("show");
                      },
                      icon: PhosphorIcons.dots_three,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Color(0xff3e455b),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://donoithatdanang.com/wp-content/uploads/2021/11/mang-hinh-khoa-cute-08.jpg",
                        ),
                      ),
                    ),
                  ),
                  IndexInfoUser(
                    titleIndex: "Posts",
                    numberIndex: 18,
                  ),
                  IndexInfoUser(
                    titleIndex: "Following",
                    numberIndex: 9,
                  ),
                  IndexInfoUser(
                    titleIndex: "Followers",
                    numberIndex: 2000,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: Text(
                        "Tony Tony Chopper",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      PhosphorIcons.circle_wavy_check_fill,
                      size: 18.0,
                      color: Color(0xff3689e2),
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
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.4,
                ),
                linkStyle: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: List.generate(
                  listFieldLive.length,
                  (index) => Chip(
                    backgroundColor: Colors.black.withOpacity(0.85),
                    label: Text(
                      listFieldLive[index],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 0.7,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 30,
                children: List.generate(
                  6,
                  (index) => Container(
                    height: 200,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://i.pinimg.com/564x/d3/d5/d8/d3d5d82fecda156b3d58beabc407f766.jpg",
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          top: 0,
                          child: Chip(
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "Game",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            backgroundColor: Colors.red.shade400,
                          ),
                        ),
                        Positioned(
                          right: 5,
                          top: 45,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            height: 30,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white.withOpacity(0.4),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  PhosphorIcons.eye,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                Text(
                                  "120",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5),
        Text(
          titleIndex,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

String formatNumberIndex(int number) {
  if (number <= 0) return "0";
  if (number < 10000) {
    return number.toString();
  } else if (number >= 10000 && number < 1000000) {
    return '${(number / 1000).toStringAsFixed(1)}K';
  } else if (number >= 10000000 && number < 1000000000) {
    return '${(number / 1000000).toStringAsFixed(1)}M';
  } else {
    return '${(number / 1000000000).toStringAsFixed(1)}B';
  }
}
