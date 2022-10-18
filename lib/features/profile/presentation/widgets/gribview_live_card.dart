// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/profile/data/live_card_model.dart';
import 'package:streamskit_mobile/features/profile/presentation/widgets/live_card_profile.dart';

class GridviewLiveCard extends StatelessWidget {
  final List<LiveCardModel> liveModel;
  final int type;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  const GridviewLiveCard({
    Key? key,
    required this.liveModel,
    required this.type,
    this.physics,
    this.shrinkWrap = true,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.sp),
      child: GridView.count(
        shrinkWrap: shrinkWrap,
        padding: EdgeInsets.only(top: 8.sp, bottom: 72.sp),
        crossAxisCount: 2,
        crossAxisSpacing: 15.sp,
        childAspectRatio: 0.7,
        physics: physics ?? const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 20.sp,
        children: List.generate(
          liveModel.length,
          (index) => LiveCardProflie(liveModel: liveModel[index]),
        ),
      ),
    );
  }
}
