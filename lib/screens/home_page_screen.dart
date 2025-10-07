import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trexv1/screens/settings_screen.dart';
import 'package:trexv1/services/theme/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:trexv1/widgets/gameOptionsWidget.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  void _showGameChoiceModal(BuildContext context){
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext modalContext){
          // The content of the popup window
          return SizedBox(
            height: 250,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensures Column only takes needed space
                  children: <Widget>
                  [
                    Text(
                      l10n.chooseGameTitle,
                      style: Theme.of(modalContext).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   const SizedBox(height: 20),
                    gameOption(modalContext, l10n.gameTrexSingle, Icons.person),
                    const SizedBox(height: 10),

                    // Game Option 2
                    gameOption(modalContext, l10n.gameTrexPartners, Icons.groups),
                  ]
                ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
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
            padding: const EdgeInsets.all(10.0),
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

        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
              _showGameChoiceModal(context);
            },
          label: Text(
            l10n.startGameButton,
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