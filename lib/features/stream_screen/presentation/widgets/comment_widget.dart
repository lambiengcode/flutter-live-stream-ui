import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:streamskit_mobile/features/stream_screen/presentation/widgets/message_widget.dart';

class CommentWidgets extends StatefulWidget {
  CommentWidgets({Key? key}) : super(key: key);

  @override
  State<CommentWidgets> createState() => _CommentWidgetsState();
}

class _CommentWidgetsState extends State<CommentWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: MessageWidget(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                      hintText: 'Type your comment...',
                      contentPadding: EdgeInsets.all(12),
                      suffixIcon: Icon(
                        PhosphorIcons.paperPlaneTiltFill,
                        size: 26.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withOpacity(0.20),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 26.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () {
                  print('Halo');
                },
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black.withOpacity(0.20),
                  ),
                  child: Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                    size: 26.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
