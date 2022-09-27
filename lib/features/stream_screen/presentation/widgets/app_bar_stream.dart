import 'package:flutter/material.dart';
import 'package:streamskit_mobile/features/stream_screen/presentation/widgets/name_live_widget.dart';
import 'package:streamskit_mobile/features/stream_screen/presentation/widgets/viewer_widget.dart';

class AppBarStream extends StatelessWidget {
  const AppBarStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Container(
              width: 38,
              height: 38,
              color: Colors.white.withOpacity(0.25),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          FullnameLiveWidget(),
          SizedBox(
            width: 28,
          ),
          ViewerWidget(),
        ],
      ),
    );
  }
}
