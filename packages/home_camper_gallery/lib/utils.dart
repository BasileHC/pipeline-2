import 'package:flutter/material.dart';
import 'package:home_camper_gallery/theme/sizes.dart';

class TitledWidget extends StatelessWidget {
  const TitledWidget({
    required this.title,
    required this.widget,
    super.key,
  });

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: Sizes.widgetSpacing,
        ),
        widget,
      ],
    );
  }
}
