import 'package:flutter/material.dart';

extension ListExtension<T extends Widget> on List<T> {
  List<Widget> intersperse(Widget widget) {
    return expand((element) => [element, widget]).toList();
  }
}
