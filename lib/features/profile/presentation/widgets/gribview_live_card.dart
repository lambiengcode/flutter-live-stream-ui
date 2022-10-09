import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/profile/data/live_card_model.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/live_card_profile.dart';

class GridviewLiveCard extends StatelessWidget {
  final List<LiveCardModel> liveModel;
  final int type;
  const GridviewLiveCard({
    Key? key,
    required this.liveModel,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: GridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 8.sp, bottom: 72.sp),
        crossAxisCount: 2,
        crossAxisSpacing: 15.sp,
        childAspectRatio: 0.7,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 20.sp,
        children: List.generate(
          liveModel.length,
          (index) => LiveCardProflie(liveModel: liveModel[index]),
        ),
      ),
    );
  }
}
