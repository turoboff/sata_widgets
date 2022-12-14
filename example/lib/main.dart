import 'package:flutter/material.dart';
import 'package:sata_widgets/sata_widgets.dart';
import 'package:sata_widgets_example/pages/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SwLocalization().initalize(supportedLocales: ['en', 'ru']);

  runApp(
    SwLocalization.localizedApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SwLocalization.provider(
      context,
      materialAppBuilder: (localizationsDelegates, delegate) => MaterialApp(
        title: 'SATA Widgets',
        localizationsDelegates: localizationsDelegates,
        supportedLocales: delegate.supportedLocales,
        locale: delegate.currentLocale,
        home: const HomePage(),
      ),
    );
  }
}
