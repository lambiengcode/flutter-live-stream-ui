// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/navigator/app_navigator_observer.dart';
import 'package:streamskit_mobile/core/navigator/app_routes.dart';
import 'package:streamskit_mobile/core/navigator/scaffold_wrapper.dart';
import 'package:streamskit_mobile/core/navigator/transition_route.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:streamskit_mobile/features/home.dart';
import 'package:streamskit_mobile/features/home/presentation/splash_screen.dart';
import 'package:streamskit_mobile/features/profile/presentation/screens/edit_description_screen.dart';
import 'package:streamskit_mobile/features/profile/presentation/screens/edit_phone_number_screen.dart';
import 'package:streamskit_mobile/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:streamskit_mobile/features/profile/presentation/screens/edit_username_screen.dart';
import 'package:streamskit_mobile/features/profile/presentation/screens/setting_screen.dart';

class AppNavigator extends RouteObserver<PageRoute<dynamic>> {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static GlobalKey<NavigatorState> navigatorAccountKey = GlobalKey();

  Route<dynamic> getRoute(RouteSettings settings) {
    Map<String, dynamic>? arguments = _getArguments(settings);
    switch (settings.name) {
      case Routes.rootRoute:
        return _buildRoute(
          settings,
          const Home(),
        );

      case Routes.splashRoute:
        return _buildRoute(
          settings,
          const SplashScreen(),
        );

      case Routes.authenticationRoute:
        return _buildRoute(
          settings,
          const SignInScreen(),
        );

      case Routes.editDescriptionRoute:
        return _buildRoute(
          settings,
          EditDescriptionScreen(
            description: arguments?['description'],
          ),
        );

      case Routes.editPhoneNumberRoute:
        return _buildRoute(
          settings,
          EditPhoneNumberScreen(
            phoneNumber: arguments?['phoneNumber'],
          ),
        );

      case Routes.editUsernameRoute:
        return _buildRoute(
          settings,
          EditUserNameScreen(
            username: arguments?['username'],
          ),
        );

      case Routes.editProfileRoute:
        return _buildRoute(
          settings,
          const EditProfileScreen(),
        );

      case Routes.settingRoute:
        return _buildRoute(
          settings,
          const SettingScreen(),
        );

      default:
        return _buildRoute(
          settings.copyWith(name: Routes.rootRoute),
          const Home(),
        );
    }
  }

  _buildRoute(
    RouteSettings routeSettings,
    Widget builder,
  ) {
    return AppMaterialPageRoute(
      builder: (context) => ScaffoldWrapper(
        child: builder,
      ),
      settings: routeSettings,
    );
  }

  static Future? push<T>(
    String route, {
    Object? arguments,
  }) {
    late NavigatorState stateByContext;

    stateByContext = state;

    return stateByContext.pushNamed(route, arguments: arguments);
  }

  static Future pushNamedAndRemoveUntil<T>(
    String route, {
    Object? arguments,
  }) {
    if (route == Routes.rootRoute) {
      AppNavigatorObserver.resetRoutes();
    }

    return state.pushNamedAndRemoveUntil(
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future? replaceWith<T>(
    String route, {
    Map<String, dynamic>? arguments,
  }) {
    return state.pushReplacementNamed(route, arguments: arguments);
  }

  static void popUntil<T>(String routeName) {
    state.popUntil((route) {
      if (route.isFirst) return true;

      return route.settings.name == routeName;
    });
  }

  static void pop({BuildContext? context}) {
    if (SizerUtil.isTablet) {
      if (context != null &&
          getRouteTablet(ModalRoute.of(context)?.settings.name ?? '')) {
        if (!canAccountPop) return;

        accountState?.pop();

        return;
      }
    }

    if (!canPop) return;

    state.pop();
  }

  static void navigatorAccountPop() {
    if (!canAccountPop) return;

    accountState?.pop();
  }

  _getArguments(RouteSettings settings) {
    return settings.arguments;
  }

  static void navigatorAccountPopToRoot() {
    accountState?.popUntil((route) => route.isFirst);
  }

  static bool get canPop => state.canPop();

  static bool get canAccountPop => accountState?.canPop() ?? true;

  static String? currentRoute() => AppNavigatorObserver.currentRouteName;

  static BuildContext? get context => navigatorKey.currentContext;

  static BuildContext? get accountContext => navigatorAccountKey.currentContext;

  static NavigatorState get state => navigatorKey.currentState!;

  static NavigatorState? get accountState => navigatorAccountKey.currentState;

  static bool getRouteTablet(String route) => [].contains(route);

  static bool shouldBeShowPopupInstrealOfScreen({required String route}) {
    if (!SizerUtil.isTablet) return false;

    return popupInstrealOfScreen.contains(route);
  }

  static List<String> popupInstrealOfScreen = [];
}
