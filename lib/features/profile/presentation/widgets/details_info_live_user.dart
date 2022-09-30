import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/index_info_user.dart';

class DetailInfoLiveUserWidget extends StatelessWidget {
  final UserModel user;
  const DetailInfoLiveUserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 25.sp),
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNetworkImage(
                  urlToImage:
                      "https://i.pinimg.com/originals/ca/33/57/ca335747b1f2b5b8611be00eb1307105.jpg",
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.sp),
                  width: 150.w,
                  height: 150.sp,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80.sp,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.sp,
                            bottom: 2.sp,
                          ),
                          child: Row(
                            children: [
                              Container(
                                constraints: BoxConstraints(maxWidth: 80.w),
                                child: Text(
                                  user.fullName,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 13.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(width: 2.sp),
                              Icon(
                                PhosphorIcons.circle_wavy_check_fill,
                                size: 13.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "@tonytonychopper",
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 9.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.sp,
                          vertical: 4.sp,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade700,
                          borderRadius: BorderRadius.circular(
                            15.sp,
                          ),
                        ),
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.sp),
              ],
            ),
            Positioned(
              left: 5.sp,
              bottom: 0.sp,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 8,
                    color: Colors.black,
                  ),
                ),
                child: CustomNetworkImage(
                  urlToImage: user.urlToImage,
                  height: 60.sp,
                  width: 60.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
          child: Linkify(
            onOpen: (link) async {},
            text: user.description!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontSize: 9.sp,
              height: 1.4,
            ),
            linkStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        SizedBox(height: 5.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IndexInfoUser(
              titleIndex: "Posts",
              numberIndex: user.posts!,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sp),
              width: 1.sp,
              height: 80.sp,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black26, Colors.white, Colors.black26],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
            IndexInfoUser(
              titleIndex: "Following",
              numberIndex: user.followings!,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sp),
              width: 0.8.sp,
              height: 80.sp,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black26, Colors.white, Colors.black26],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
            IndexInfoUser(
              titleIndex: "Followers",
              numberIndex: user.followers!,
            ),
          ],
        ),
        SizedBox(height: 5.sp),
        // Wrap(
        //   spacing: 5.sp,
        //   runSpacing: -5.sp,
        //   children: List.generate(
        //     user.listFields!.length,
        //     (index) => Chip(
        //       backgroundColor: Colors.black12,
        //       label: Text(
        //         user.listFields![index],
        //         style: TextStyle(
        //           color: Theme.of(context).primaryColorLight,
        //           fontSize: 13,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
