import 'package:flutter/material.dart';
import 'package:home_camper_core/extensions/list_extensions.dart';
import 'package:home_camper_gallery/theme/home_camper_colors.dart';
import 'package:home_camper_gallery/theme/sizes.dart';
import 'package:home_camper_gallery/utils.dart';

class ColorsDemo extends StatelessWidget {
  const ColorsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primary Button Demo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(Sizes.listPadding),
        children: [
          TitledWidget(
            title: "primary: ",
            widget: _buildColorBlock(HomeCamperColors.primary),
          ),
          TitledWidget(
            title: "secondary: ",
            widget: _buildColorBlock(HomeCamperColors.secondary),
          ),
        ].intersperse(SizedBox(
          height: Sizes.widgetSpacing,
        )),
      ),
    );
  }

  Widget _buildColorBlock(Color color) {
    return Container(
      width: 96,
      height: 32,
      color: color,
    );
  }
}
