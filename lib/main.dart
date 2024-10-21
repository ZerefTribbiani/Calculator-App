import 'package:calculator/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;

import 'package:provider/provider.dart';

import 'calculator_state.dart';
import 'main_screen.dart';
import 'themes.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        Provider(create: (context) => SettingsController()),
        ChangeNotifierProvider(create: (context) => CalculatorState()),
      ],
      child: Builder(
        builder: (context) {
          return ValueListenableBuilder(
            valueListenable:
                context.watch<SettingsController>().themeModeNotifier,
            builder: (context, themeMode, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Calculator',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                home: const MainScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
