// Dart imports:
// ignore_for_file: depend_on_referenced_packages

// Dart imports:
import 'dart:math' as math;
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/stream/provider/hearts_provider.dart';

class HeartAnimation extends StatefulWidget {
  const HeartAnimation({Key? key}) : super(key: key);

  @override
  HeartStateAnimation createState() => HeartStateAnimation();
}

class HeartStateAnimation extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final Color _color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());
  final double right = math.Random().nextInt(20).toDouble();
  final int randomSize = math.Random().nextInt(18);
  double opacity = 0.7;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _startAnimation(controller);
    super.initState();
  }

  void _startAnimation(AnimationController controller) {
    controller.forward().whenComplete(() {
      FloatingHeartsProvider floatingHeartsProvider =
          context.read<FloatingHeartsProvider>();
      floatingHeartsProvider.removeHeart(widget.key);
      // controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(30.sp, 150.sp);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, snapshot) {
        final value = controller.value;
        double? bottom = lerpDouble(10.sp, 30.sp + size.height * 0.25, value);
        opacity = lerpDouble(0.7, 0, value)!;

        return Positioned(
          bottom: bottom,
          right: right,
          child: Icon(Icons.favorite,
              color: _color.withOpacity(opacity),
              size: 20.sp //(size.width * 0.05 + randomSize).toDouble(),
              ),
        );
      },
    );
  }
}
