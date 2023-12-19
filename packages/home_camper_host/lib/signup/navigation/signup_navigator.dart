import 'package:flutter/material.dart';
import 'package:home_camper_host/profile/navigation/profile_navigator.dart';
import 'package:home_camper_host/signup/screens/pin_screen.dart';
import 'package:home_camper_host/signup/screens/signup_screen.dart';

class SignUpNavigator
    with SignupScreenNavigationDelegate, PinScreenNavigationDelegate {
  final GlobalKey<NavigatorState> navigatorKey;

  SignUpNavigator(this.navigatorKey);

  @override
  void onPinCreated() {
    ProfileNavigator(navigatorKey).start();
  }

  @override
  void onDetailsEntered() {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => PinScreen(
          coordinator: this,
        ),
      ),
    );
  }
}
