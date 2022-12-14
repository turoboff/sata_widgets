import 'package:flutter/material.dart';
import 'package:sata_widgets/sata_widgets.dart';

class LocalizationPage extends StatefulWidget {
  const LocalizationPage({Key? key}) : super(key: key);

  @override
  State<LocalizationPage> createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SwIconButton(
          Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.pop(context),
        ),
        title: const Text("Localization"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 1.0,
                    offset: const Offset(0.0, 1.0),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr("localization_title"),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Divider(),
                  Text(
                    tr("localization_sub"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: SwButton(
                      title: "Русский",
                      onTap: () async {
                        await SwLocalization.delegate
                            .changeLocale(const Locale("ru"));
                        setState(() {});
                      }),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: SwButton(
                      title: "English",
                      onTap: () async {
                        await SwLocalization.delegate
                            .changeLocale(const Locale("en"));
                        setState(() {});
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
