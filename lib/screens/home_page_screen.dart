import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trexv1/screens/settings_screen.dart';
import 'package:trexv1/services/theme/theme_provider.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Trex Score',
            style: TextStyle(
              // color: Colors.white,
            ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: (){
                themeProvider.toggleTheme();
              },
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              // color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const SettingsScreen())
                );
              },
              icon: Icon(Icons.settings),
              // color: Colors.white,
            ),
          )
        ],
      ),

        floatingActionButton: FloatingActionButton.extended(onPressed: (){
    },
          label: Text(
            'start a new game',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: const Icon(
              Icons.add,
          ),
        )
    );
  }
}