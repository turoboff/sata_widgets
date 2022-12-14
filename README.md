# sata_widgets

This plugin created by company SATA_SOFTWARE

# The README is not yet complete. Only notes are written here!!!
## Getting Started

there are
SwLocalization
SwLocalstore
SwButton
SwRadio

Usage Localization
1: create assets folder next to lib folder init create i18n folder
2: add it to pubspec.yaml 
     assets:
       - assets/i18n/
3: make main function as Future and initalize localization
     Future<void> main() async {
       WidgetsFlutterBinding.ensureInitialized();
       await SwLocalization().initalize(supportedLocales: ['en', 'ru']);

       runApp(const MyApp());
     }
4: Provide it
   SwLocalization.provider(
      context,
      materialAppBuilder: (localizationsDelegates, delegate) => MaterialApp(
        title: 'SATA Widgets',
        localizationsDelegates: localizationsDelegates,
        supportedLocales: delegate.supportedLocales,
        locale: delegate.currentLocale,
        home: const HomePage(),
      ),
    )
5: finally you can use it esealy
   Text(tr("curent_lang"))
6: how to change lang
    await SwLocalization.delegate
           .changeLocale(const Locale("en"));

Usage local store
...

 
