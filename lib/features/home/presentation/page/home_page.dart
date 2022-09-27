import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:streamskit_mobile/core/util/app_bars/appbar_none.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/core/util/themes/app_icons.dart';
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';
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
                itemCount: listLiveStreamFake.length,
                itemBuilder: (context, index) {
                  return index == 1
                      ? Container(
                          height: 80.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                imageStartStream,
                              ),
                            ),
                          ),
                        )
                      : Stack(
                          children: [
                            CustomNetworkImage(
                              urlToImage: listLiveStreamFake[index].urlToImage,
                              height: 150.sp,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(
                                13.sp,
                              ),
                              // fit: BoxFit.cover,
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(8.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.sp,
                                        vertical: 4.sp,
                                      ),
                                      decoration: BoxDecoration(
                                        color: listLiveStreamFake[index]
                                            .getColorType,
                                        borderRadius: BorderRadius.circular(
                                          9.sp,
                                        ),
                                      ),
                                      child: Text(
                                        listLiveStreamFake[index].getTitleType,
                                        style: TextStyle(
                                          color: mCL,
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 2.sp),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6.sp,
                                        vertical: 4.sp,
                                      ),
                                      decoration: BoxDecoration(
                                        color: mCH.withOpacity(0.45),
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            iconEye,
                                            height: 13.sp,
                                            width: 13.sp,
                                            fit: BoxFit.cover,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 5.sp),
                                          Text(
                                            '${listLiveStreamFake[index].peopleParticipant}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
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
