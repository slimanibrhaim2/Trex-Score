import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trexv1/services/theme/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final themProvider = context.watch<ThemeProvider>();
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n!.settingsTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(
                Icons.palette_outlined,
                color: theme.colorScheme.primary,
              ),
              title: Text('App Theme'),
              subtitle: Text('Toggle here to switch the application theme.'),
              trailing: Switch(
                  value: theme.brightness == Brightness.dark,
                  onChanged: (_)=> context.read<ThemeProvider>().toggleTheme(),
                  activeColor: theme.colorScheme.primary,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.black12,
              ),
            ),
          )


        ],
      ),
    );
  }
}
