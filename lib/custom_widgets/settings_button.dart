import 'package:flutter/material.dart';

import '../settings/settings_screen.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SettingsScreen(),
          ),
        );
      },
      iconSize: size.width * 0.1,
      icon: const Icon(Icons.settings),
    );
  }
}
