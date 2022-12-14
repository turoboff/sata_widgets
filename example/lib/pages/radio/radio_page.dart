import 'package:flutter/material.dart';
import 'package:sata_widgets/sata_widgets.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({Key? key}) : super(key: key);

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SwIconButton(
          Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Radio"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  children: [
                    SwRadio(
                      size: 28,
                      isActive: activeIndex == i,
                      onChanged: (value) => setState(() {
                        activeIndex = i;
                      }),
                    ),
                    const SizedBox(width: 6.0),
                    Text("Radio Button $i"),
                  ],
                ),
              ),
            const Divider(),
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  children: [
                    SwRadio(
                      size: 24,
                      isActive: activeIndex == i,
                      activeColor: Colors.red,
                      unSelectedColor: Colors.black,
                      onChanged: (value) => setState(() {
                        activeIndex = i;
                      }),
                    ),
                    const SizedBox(width: 6.0),
                    Text("Radio Button $i"),
                  ],
                ),
              ),
            const Divider(),
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  children: [
                    SwRadio(
                      isActive: activeIndex == i,
                      activeColor: Colors.orange,
                      unSelectedColor: Colors.yellow,
                      onChanged: (value) => setState(() {
                        activeIndex = i;
                      }),
                    ),
                    const SizedBox(width: 6.0),
                    Text("Radio Button $i"),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
