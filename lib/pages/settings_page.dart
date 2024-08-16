import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/component/my_settings_tile.dart';
import 'package:twitter_clone/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      //
      appBar: AppBar(
        title: const Text("SETTINGS"),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),

      //

      body: Column(
        children: [
          MySettingsTile(
            title: "Dark Mode",
            action: CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme()),
          )
        ],
      ),
    );
  }
}
