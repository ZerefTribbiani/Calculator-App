import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculator_state.dart';

class CalculatorDisplay extends StatelessWidget {
  final double heightFactor;
  final double widthFactor;
  final double padding;
  final double textSizeFactor;

  const CalculatorDisplay({
    super.key,
    this.heightFactor = 0.4,
    this.widthFactor = 1,
    this.padding = 20,
    this.textSizeFactor = 0.08,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final displayText = context.watch<CalculatorState>().displayText;

    return Container(
      height: size.height * heightFactor,
      width: size.width * widthFactor,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(padding),
      //color: colorScheme.background,
      child: Text(
        displayText,
        style: TextStyle(
          color: colorScheme.onBackground,
          fontSize: size.height * textSizeFactor,
        ),
      ),
    );
  }
}
