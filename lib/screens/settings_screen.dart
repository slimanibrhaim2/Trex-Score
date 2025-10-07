import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trexv1/services/lang/language.dart';
import 'package:trexv1/services/theme/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final themProvider = context.watch<ThemeProvider>();
    final l10n = AppLocalizations.of(context);
    final langProvider = context.watch<LanguageProvider>();
    final isArabic = langProvider.locale.languageCode == 'ar';
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
              title: Text(l10n.themeTitle),
              subtitle: Text(l10n.themeSubtitle),
              trailing: Switch(
                  value: theme.brightness == Brightness.dark,
                  onChanged: (_)=> context.read<ThemeProvider>().toggleTheme(),
                  activeColor: theme.colorScheme.primary,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.black12,
              ),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Icon(
                Icons.language_rounded,
                color: theme.colorScheme.primary,
              ),
              title: Text(l10n.languageTitle),
              subtitle: Text(l10n.languageSubtitle),
              trailing: Switch(
                  value: isArabic,
                  onChanged: (_)=> context.read<LanguageProvider>().toggleLanguage(),
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
