import 'package:calculator/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final settings = context.watch<SettingsController>();

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const SettingsHeader(),
            const SizedBox(height: 16.0),
            const ThemeModeSetting(),
            CounterSetting(
              text: 'Precison',
              updateSetting: settings.setPrecision,
              initialVal: settings.precisionNotifier.value,
            ),
            CounterSetting(
              text: 'Display Text Size',
              updateSetting: settings.setDisplayTextSize,
              initialVal: settings.displayTextSizeNotifier.value,
              min: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Text(
            'Settings',
            style: TextStyle(
              color: colorScheme.onPrimaryContainer,
              fontSize: size.height * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconSize: size.height * 0.04,
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ],
    );
  }
}

class ThemeModeSetting extends StatelessWidget {
  const ThemeModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final settingsController = context.watch<SettingsController>();

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 15.0,
        ),
        child: Row(
          children: [
            const Text('Theme Mode'),
            const Spacer(),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: size.height * 0.05),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: DropdownMenu(
                  trailingIcon: Icon(
                    Icons.arrow_drop_down,
                    size: size.width * 0.1,
                  ),
                  width: size.width * 0.45,
                  inputDecorationTheme: const InputDecorationTheme(
                    border: InputBorder.none,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                  ),
                  initialSelection: settingsController.themeModeNotifier.value,
                  onSelected: (value) {
                    settingsController.setThemeMode(value!);
                  },
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: ThemeMode.system, label: 'System'),
                    DropdownMenuEntry(value: ThemeMode.dark, label: 'Dark'),
                    DropdownMenuEntry(value: ThemeMode.light, label: 'Light'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterSetting extends StatefulWidget {
  final int initialVal;
  final int min;
  final int max;
  final String text;
  final void Function(int) updateSetting;

  const CounterSetting({
    super.key,
    required this.text,
    required this.updateSetting,
    required this.initialVal,
    this.min = 0,
    this.max = 10,
  });

  @override
  State<CounterSetting> createState() => _CounterSettingState();
}

class _CounterSettingState extends State<CounterSetting> {
  late int counter;

  @override
  void initState() {
    super.initState();
    counter = widget.initialVal;
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        child: Row(
          children: [
            Text(widget.text),
            const Spacer(),
            TextButton(
              onPressed: () {
                if (counter > widget.min) {
                  setState(() {
                    counter--;
                  });
                  widget.updateSetting(counter);
                }
              },
              child: const Text('-'),
            ),
            Text(counter.toString()),
            TextButton(
              onPressed: () {
                if (counter < widget.max) {
                  setState(() {
                    counter++;
                  });
                  widget.updateSetting(counter);
                }
              },
              child: const Text('+'),
            ),
          ],
        ),
      ),
    );
  }
}
