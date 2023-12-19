import 'package:flutter/material.dart';
import 'package:home_camper_core/extensions/list_extensions.dart';
import 'package:home_camper_gallery/theme/sizes.dart';
import 'package:home_camper_gallery/utils.dart';
import 'package:home_camper_gallery/widgets/buttons/secondary_button.dart';

class SecondaryButtonDemo extends StatelessWidget {
  const SecondaryButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secondary Button Demo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(Sizes.listPadding),
        children: [
          TitledWidget(
            title: "active: ",
            widget: SecondaryButton(
              onPressed: () {},
              text: 'active',
            ),
          ),
          const TitledWidget(
            title: "disabled: ",
            widget: SecondaryButton(
              onPressed: null,
              text: 'disabled',
            ),
          ),
        ].intersperse(SizedBox(
          height: Sizes.widgetSpacing,
        )),
      ),
    );
  }
}
