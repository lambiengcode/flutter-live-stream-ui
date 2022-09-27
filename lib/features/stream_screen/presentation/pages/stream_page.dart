import 'package:flutter/material.dart';
import 'package:streamskit_mobile/features/stream_screen/presentation/widgets/app_bar_stream.dart';
import 'package:streamskit_mobile/features/stream_screen/presentation/widgets/comment_widget.dart';

class StreamScreen extends StatefulWidget {
  StreamScreen({Key? key}) : super(key: key);

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.purple.withOpacity(0.2),
          child: Stack(
            children: [
              Image.asset('public/assets/images/stream_image.jpg'),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: AppBarStream()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
