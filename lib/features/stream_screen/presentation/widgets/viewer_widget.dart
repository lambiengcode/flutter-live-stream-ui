import 'package:flutter/material.dart';

class ViewerWidget extends StatefulWidget {
  ViewerWidget({Key? key}) : super(key: key);

  @override
  State<ViewerWidget> createState() => _ViewerWidgetState();
}

class _ViewerWidgetState extends State<ViewerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white.withOpacity(0.25),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.white,
              size: 16,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              '1826',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
