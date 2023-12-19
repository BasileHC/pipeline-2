import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_camper_gallery/theme/home_camper_theme.dart';
import 'package:home_camper_traveler/signup/bloc/signup_bloc.dart';
import 'package:home_camper_traveler/signup/navigation/signup_navigator.dart';
import 'package:home_camper_traveler/signup/screens/signup_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _addBlocs(Widget child) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => SignupBloc()),
    ], child: child);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    final navigator = SignUpNavigator(navigatorKey);

    return _addBlocs(MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: homeCamperTheme,
      home: SignupScreen(
        coordinator: navigator,
      ),
    ));
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint(event.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(error.runtimeType.toString());
    super.onError(bloc, error, stackTrace);
  }
}
