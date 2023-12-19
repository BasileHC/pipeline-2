import 'package:flutter/material.dart';
import 'package:home_camper_gallery/gallery/buttons/primary_button_demo.dart';
import 'package:home_camper_gallery/gallery/buttons/secondary_button_demo.dart';
import 'package:home_camper_gallery/gallery/theme/colors_demo.dart';
import 'package:home_camper_gallery/gallery/theme/text_styles_demo.dart';
import 'package:home_camper_gallery/theme/text_styles.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Camper Gallery")),
      body: ListView(
        children: [
          _buildGroup(
            'Theme',
            [
              _buildTile("Text Styles", const TextStylesDemo()),
              _buildTile("Colors", const ColorsDemo()),
            ],
          ),
          _buildGroup(
            'Buttons',
            [
              _buildTile("Primary Button", const PrimaryButtonDemo()),
              _buildTile("Secondary Button", const SecondaryButtonDemo()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGroup(String title, List<Widget> children) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyles.label,
      ),
      children: children,
    );
  }

  Widget _buildTile(String title, Widget page) {
    return ListTile(
      title: Text(
        title,
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => page)),
    );
  }
}
