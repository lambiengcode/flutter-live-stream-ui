import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/app_bar_stream.dart';
import 'package:streamskit_mobile/features/stream/presentation/widgets/comment_widget.dart';
import 'package:streamskit_mobile/features/stream/provider/hearts_provider.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({Key? key}) : super(key: key);

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FloatingHeartsProvider()),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.purple.withOpacity(0.2),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/stream_image.jpg',
                fit: BoxFit.fitHeight,
                height: double.infinity,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
                child: const AppBarStream(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp)
                    .add(EdgeInsets.only(bottom: 10.sp)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CommentWidgets(),
                    ],
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
