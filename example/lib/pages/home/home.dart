import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sata_widgets/sata_widgets.dart';
import 'package:sata_widgets_example/pages/cached_image/cached_image_page.dart';
import 'package:sata_widgets_example/pages/localization/localization_page.dart';

import '../button/button.dart';
import '../radio/radio_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateTo(Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SATA Widgets"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwButton(
                title: "SW Localization",
                onTap: () => navigateTo(const LocalizationPage())),
            const SizedBox(height: 16.0),
            SwButton(
                title: "SW Cached Network Image",
                onTap: () => navigateTo(const CachedNImagePage())),
            const SizedBox(height: 16.0),
            SwButton(
                title: "SW Radio", onTap: () => navigateTo(const RadioPage())),
            const SizedBox(height: 16.0),
            SwButton(
                title: "SW Buttom",
                onTap: () => navigateTo(const ButtonPage())),
          ],
        ),
      ),
    );
  }
}
