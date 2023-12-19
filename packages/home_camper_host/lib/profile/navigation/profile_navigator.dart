import 'package:flutter/material.dart';
import 'package:home_camper_host/profile/screens/profile_screen.dart';

class ProfileNavigator with ProfileScreenNavigationDelegate {
  final GlobalKey<NavigatorState> navigatorKey;

  ProfileNavigator(this.navigatorKey);

  void start() {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => ProfileScreen(
          coordinator: this,
        ),
      ),
    );
  }

  @override
  void onLogout() {
    navigatorKey.currentState?.popUntil(
      (route) => !navigatorKey.currentState!.canPop(),
    );
  }
}
