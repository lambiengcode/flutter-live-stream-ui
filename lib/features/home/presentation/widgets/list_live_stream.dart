import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';
import 'package:streamskit_mobile/features/home/presentation/widgets/live_stream_card.dart';
import 'package:streamskit_mobile/features/stream/presentation/screens/stream_screen.dart';

class ListLiveStream extends StatelessWidget {
  const ListLiveStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MasonryGridView.count(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
        ),
        crossAxisCount: 2,
        mainAxisSpacing: 15.sp,
        crossAxisSpacing: 15.sp,
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
