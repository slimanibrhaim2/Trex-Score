import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trexv1/services/lang/language.dart';
import 'package:trexv1/services/theme/theme_provider.dart';
import 'package:trexv1/services/theme/themes_settings.dart';
import 'screens/home_page_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){
  runApp(
    MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider())
        ],
        child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final langProvider = context.watch<LanguageProvider>();
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode,

      locale: langProvider.locale,

      // 1. Define supported languages
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],

      // 2. Add localizations delegates
      localizationsDelegates: const [
        AppLocalizations.delegate, // 👈 Your custom strings
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],


      home: const HomeScreen(),
    );
  }
}



