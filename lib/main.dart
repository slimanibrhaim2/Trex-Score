import 'package:flutter/material.dart';
import 'package:trexv1/services/theme/theme_provider.dart';
import 'package:trexv1/services/theme/themes_settings.dart';
import 'screens/home_page_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode,
      home: const HomeScreen(),
    );
  }
}



