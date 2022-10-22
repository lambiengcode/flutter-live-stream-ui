// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/navigator/app_pages.dart';

class ScaffoldWrapper extends StatefulWidget {
  final Widget child;

  const ScaffoldWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScaffoldWrapperState();
}

class _ScaffoldWrapperState extends State<ScaffoldWrapper>
    with WidgetsBindingObserver {
  final List<String> _ignoreRotateEvent = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (_ignoreRotateEvent.contains(AppNavigator.currentRoute())) return;
  }

  _hideKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return SafeArea(
        top: false,
        bottom: false,
        child: Platform.isIOS
            ? _child
            : WillPopScope(
                onWillPop: _goBackward,
                child: _child,
              ),
      );
    });
  }

  Widget get _child {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: _getBody,
    );
  }

  Widget get _getBody {
    return GestureDetector(
      onHorizontalDragUpdate: Platform.isAndroid ||
              [].contains(AppNavigator.currentRoute())
          ? null
          : (details) async {
              // Cannot back when at ROOT, EDIT_PHOTO and Connecting Call
              if (Platform.isIOS && ![].contains(AppNavigator.currentRoute())) {
                //set the sensitivity for your ios gesture anywhere between 10-50 is good

                int sensitivity = 15;

                if (details.delta.dx > sensitivity) {
                  //SWIPE FROM RIGHT DETECTION
                  bool canBackward = await _goBackward();
                  if (canBackward) {
                    AppNavigator.pop();
                  }
                }
              }
            },
      onTap: () => _hideKeyboard(),
      child: widget.child,
    );
  }

  Future<bool> _goBackward() async {
    return true;
  }
}
