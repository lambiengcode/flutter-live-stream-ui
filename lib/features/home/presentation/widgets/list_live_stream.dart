// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';
import 'package:streamskit_mobile/features/home/presentation/widgets/live_stream_card.dart';
import 'package:streamskit_mobile/features/stream/presentation/screens/stream_screen.dart';

class ListLiveStream extends StatelessWidget {
  const ListLiveStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
        ).add(
          EdgeInsets.only(
            bottom: 80.sp,
          ),
        ),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 0.itemCountGridViewCalendar,
          mainAxisSpacing: 18.sp,
          crossAxisSpacing: 10.sp,
          childAspectRatio: 0.58,
        ),
        itemCount: listLiveStreamFake.length,
        itemBuilder: (context, index) {
          return LiveStreamCard(
            liveStreamModel: listLiveStreamFake[index],
            onTap: (() {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StreamScreen()));
            }),
          );
        },
      ),
    );
  }
}
