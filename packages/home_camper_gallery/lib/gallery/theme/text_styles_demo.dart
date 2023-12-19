import 'package:flutter/material.dart';
import 'package:home_camper_core/extensions/list_extensions.dart';
import 'package:home_camper_gallery/theme/sizes.dart';
import 'package:home_camper_gallery/theme/text_styles.dart';

class TextStylesDemo extends StatelessWidget {
  const TextStylesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Styles Demo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(Sizes.listPadding),
        children: [
          Text('header', style: TextStyles.header),
          Text('subtitle', style: TextStyles.subtitle),
          Text('label', style: TextStyles.label),
        ].intersperse(SizedBox(
          height: Sizes.widgetSpacing,
        )),
      ),
    );
  }
}
