// Flutter imports:
import 'package:flutter/material.dart';

class BotToastNavigatorObserverProxy {
  void Function(Route<dynamic> route, Route<dynamic>? previousRoute)? didPush;
  void Function(Route<dynamic>? newRoute, Route<dynamic>? oldRoute)? didReplace;
  void Function(Route<dynamic> route, Route<dynamic>? previousRoute)? didRemove;
  void Function(Route<dynamic> route, Route<dynamic>? previousRoute)? didPop;

  BotToastNavigatorObserverProxy(
      {this.didPush, this.didReplace, this.didRemove, this.didPop});

  BotToastNavigatorObserverProxy.all(VoidCallback leavePageCallback) {
    didPush = (_, __) => leavePageCallback();
    didReplace = (_, __) => leavePageCallback();
    didRemove = (_, __) => leavePageCallback();
    didPop = (_, __) => leavePageCallback();
  }
}

class BotToastNavigatorObserver extends NavigatorObserver {
  static final List<BotToastNavigatorObserverProxy> _leavePageCallbacks = [];

  static void register(
      BotToastNavigatorObserverProxy botToastNavigatorObserverProxy) {
    _leavePageCallbacks.add(botToastNavigatorObserverProxy);
  }

  static void unregister(
      BotToastNavigatorObserverProxy botToastNavigatorObserverProxy) {
    _leavePageCallbacks.remove(botToastNavigatorObserverProxy);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final copy = _leavePageCallbacks.toList(growable: false);
    for (BotToastNavigatorObserverProxy observerProxy in copy) {
      observerProxy.didPush?.call(route, previousRoute);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final copy = _leavePageCallbacks.toList(growable: false);
    for (BotToastNavigatorObserverProxy observerProxy in copy) {
      observerProxy.didReplace?.call(newRoute, oldRoute);
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final copy = _leavePageCallbacks.toList(growable: false);
    for (BotToastNavigatorObserverProxy observerProxy in copy) {
      observerProxy.didRemove?.call(route, previousRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final copy = _leavePageCallbacks.toList(growable: false);
    for (BotToastNavigatorObserverProxy observerProxy in copy) {
      observerProxy.didPop?.call(route, previousRoute);
    }
  }
}
