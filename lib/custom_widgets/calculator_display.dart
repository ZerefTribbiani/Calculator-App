import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../calculator_state.dart';
import '../settings/settings_controller.dart';

class CalculatorDisplay extends StatelessWidget {
  final double heightFactor;
  final double widthFactor;
  final double padding;

  const CalculatorDisplay({
    super.key,
    this.heightFactor = 0.4,
    this.widthFactor = 1,
    this.padding = 20,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final displayText = context.watch<CalculatorState>().displayText;

    return ValueListenableBuilder(
      valueListenable: context.watch<SettingsController>().displayTextSizeNotifier,
        builder: (context, textSizeFactor, child) {
          return Container(
            height: size.height * heightFactor,
            width: size.width * widthFactor,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(padding),
            child: Text(
              displayText,
              style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: size.height * textSizeFactor / 100,
              ),
            ),
          );
        }
    );
  }
}
