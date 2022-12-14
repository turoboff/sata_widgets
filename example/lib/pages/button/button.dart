import 'package:flutter/material.dart';
import 'package:sata_widgets/sata_widgets.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  bool animatedStyleBtn = false;
  bool animatedSizeBtn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SwIconButton(
          Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Button"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwButton(
              title: "Primary Style",
              onTap: () {},
            ),
            const SizedBox(height: 16.0),
            SwButton(
              title: "Animated Style (tap me to show)",
              bgColor: animatedStyleBtn ? Colors.red : Colors.green,
              borderRadius:
                  BorderRadius.circular(animatedStyleBtn ? 12.0 : 40.0),
              onTap: () => setState(() {
                animatedStyleBtn = !animatedStyleBtn;
              }),
            ),
            const SizedBox(height: 16.0),
            SwButton(
              title: "Animated Size (tap me to show)",
              height: animatedSizeBtn ? 68.0 : 46.0,
              width: animatedSizeBtn ? 228.0 : 300.0,
              bgColor: Colors.purple,
              onTap: () => setState(() {
                animatedSizeBtn = !animatedSizeBtn;
              }),
            ),
            const SizedBox(height: 16.0),
            SwButton(
              title: "Bordered Style",
              borderColor: Theme.of(context).primaryColor,
              onTap: () {},
            ),
            const SizedBox(height: 16.0),
            SwButton(
              title: "Icon Button",
              bgColor: Colors.pink,
              icon: Icons.home_rounded,
              onTap: () {},
            ),
            const SizedBox(height: 16.0),
            SwButton(
              title: "Disable Button",
              isDisable: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
