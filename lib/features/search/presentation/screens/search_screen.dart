import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';
import 'package:streamskit_mobile/core/util/styles/search_style.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';
import 'package:streamskit_mobile/features/profile/data/list_live_card_model.dart';
import 'package:streamskit_mobile/features/profile/data/live_card_model.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/gribview_live_card.dart';
import 'package:streamskit_mobile/features/search/data/top_search_model.dart';
import 'package:streamskit_mobile/features/search/presentation/widgets/search_more_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _keySearch = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String keyword = "";

  List<String> listHistory = ["Ba rọi", "Mixi", "DCT", "Anime"];

  List<TopSearch> listMoreSearch = [
    TopSearch(stt: 1, nameStreamer: "Chopper"),
    TopSearch(stt: 2, nameStreamer: "Thầy giáo ba"),
    TopSearch(stt: 3, nameStreamer: "Mixi gaming"),
    TopSearch(stt: 4, nameStreamer: "Trực tiếp game"),
    TopSearch(stt: 5, nameStreamer: "MiGame"),
    TopSearch(stt: 6, nameStreamer: "Man united"),
    TopSearch(stt: 7, nameStreamer: "Tokyo revenger"),
    TopSearch(stt: 8, nameStreamer: "Naruto"),
    TopSearch(stt: 9, nameStreamer: "One Piece"),
    TopSearch(stt: 10, nameStreamer: "Kimetsu no yaiba"),
  ];

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

  @override
  void initState() {
    _keySearch.text = "";
    keyword = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(
              height: 5.sp,
            ),
            SizedBox(
              height: 30.sp,
              child: TextFormField(
                controller: _keySearch,
                cursorColor: colorPink,
                style: text9mCL,
                onChanged: (val) {
                  setState(() {
                    keyword = val;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: mGE,
                  prefixIcon: TouchableOpacity(
                    child: Icon(
                      Icons.search,
                      size: 15.sp,
                      color: mGB,
                    ),
                  ),
                  suffixIcon: keyword.isNotEmpty
                      ? TouchableOpacity(
                          onTap: () {
                            setState(() {
                              _keySearch.clear();
                              keyword = "";
                            });
                          },
                          child: Icon(
                            Icons.cancel,
                            size: 15.sp,
                            color: mGB,
                          ),
                        )
                      : const SizedBox(),
                  hintText: "Search streamer | Game",
                  hintStyle: text9mGB,
                  contentPadding: EdgeInsets.only(top: 5.sp),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(16.sp),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(16.sp),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(16.sp),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            Divider(color: mGE, thickness: 1),
          ],
        ),
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.sp, vertical: 5.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "History Search",
                          style: text11w700mGB,
                        ),
                        const Spacer(),
                        TouchableOpacity(
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: mCL,
                            size: 15,
                          ),
                          onTap: () {
                            setState(() {
                              listHistory.clear();
                            });
                          },
                        ),
                      ],
                    ),
                    listHistory.isNotEmpty
                        ? Wrap(
                            spacing: 5.sp,
                            runSpacing: -5.sp,
                            children: List.generate(
                              listHistory.length,
                              (index) => TouchableOpacity(
                                onTap: () {
                                  setState(() {
                                    _keySearch.text = listHistory[index];
                                    keyword = listHistory[index];
                                  });
                                },
                                child: Chip(
                                  backgroundColor: mGD,
                                  label: Text(
                                    listHistory[index],
                                    style: text9mCL,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.sp, vertical: 5.sp),
                    child: Text(
                      'Top Search',
                      style: text11w700mGB,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.sp,
                    ),
                    height: 160.sp,
                    width: double.infinity,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 4.5,
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.sp,
                        mainAxisSpacing: 1.sp,
                      ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) =>
                          SearchMoreWidget(
                        sttColor: listMoreSearch[index].stt == 1
                            ? Colors.redAccent
                            : listMoreSearch[index].stt == 2
                                ? Colors.orangeAccent
                                : listMoreSearch[index].stt == 3
                                    ? colorPink
                                    : Colors.transparent,
                        stt: listMoreSearch[index].stt.toString(),
                        nameStreamer: listMoreSearch[index].nameStreamer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Text(
                  'Living',
                  style: text11w700mGB,
                ),
              ),
              SizedBox(
                height: 8.sp,
              ),
              GridviewLiveCard(
                physics: const BouncingScrollPhysics(),
                liveModel: listLiveStream.listLiveCardModel,
                type: listLiveStream.type,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
