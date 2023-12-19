import 'package:flutter/material.dart';
import 'package:home_camper_gallery/gallery/gallery.dart';
import 'package:home_camper_gallery/theme/home_camper_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: homeCamperTheme,
      title: 'Home Camper Gallery',
      home: const Gallery(),
    );
  }
}
