import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../calculator_state.dart';

enum ButtonColorType { primary, secondary, altSecondary, tertiary }

class CalculatorButton extends StatelessWidget {
  final double heightFactor;
  final double widthFactor;
  final String buttonText;
  final double textSizeFactor;
  final ButtonColorType type;

  const CalculatorButton({
    super.key,
    required this.heightFactor,
    required this.widthFactor,
    this.buttonText = '',
    this.textSizeFactor = 0.04,
    this.type = ButtonColorType.primary,
  });

  const CalculatorButton.digitButton({
    Key? key,
    required String digit,
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    double textSizeFactor = 0.04,
    ButtonColorType type = ButtonColorType.primary,
  }) : this(
          key: key,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          buttonText: digit,
          type: type,
        );

  const CalculatorButton.decimalPointButton({
    Key? key,
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    double textSizeFactor = 0.04,
    ButtonColorType type = ButtonColorType.primary,
  }) : this(
          key: key,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          buttonText: '.',
          textSizeFactor: textSizeFactor,
          type: type,
        );

  const CalculatorButton.operatorButton({
    Key? key,
    required String op,
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    double textSizeFactor = 0.04,
    ButtonColorType type = ButtonColorType.secondary,
  }) : this(
          key: key,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          buttonText: op,
          textSizeFactor: textSizeFactor,
          type: type,
        );

  const CalculatorButton.equalToButton({
    Key? key,
    double heightFactor = 0.15,
    double widthFactor = 0.23,
    double textSizeFactor = 0.04,
    int precision = 5,
    ButtonColorType type = ButtonColorType.altSecondary,
  }) : this(
          key: key,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          buttonText: '=',
          textSizeFactor: textSizeFactor,
          type: type,
        );

  const CalculatorButton.clearButton({
    Key? key,
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    double textSizeFactor = 0.035,
    ButtonColorType type = ButtonColorType.tertiary,
  }) : this(
          key: key,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          buttonText: 'Ac',
          textSizeFactor: textSizeFactor,
          type: type,
        );

  const CalculatorButton.backspaceButton({
    Key? key,
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    double textSizeFactor = 0.035,
    ButtonColorType type = ButtonColorType.tertiary,
  }) : this(
          key: key,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          buttonText: '⌫',
          textSizeFactor: textSizeFactor,
          type: type,
        );

  @override
  Widget build(BuildContext context) {
    final calculatorState = context.watch<CalculatorState>();
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final Color backgroundColor;
    final Color textColor;
    switch (type) {
      case ButtonColorType.primary:
        backgroundColor = colorScheme.primaryContainer;
        textColor = colorScheme.onPrimaryContainer;
      case ButtonColorType.secondary:
        backgroundColor = colorScheme.secondaryContainer;
        textColor = colorScheme.onSecondaryContainer;
      case ButtonColorType.altSecondary:
        backgroundColor = colorScheme.secondary;
        textColor = colorScheme.onSecondary;
      case ButtonColorType.tertiary:
        backgroundColor = colorScheme.tertiaryContainer;
        textColor = colorScheme.onTertiaryContainer;
    }

    return Container(
      height: size.height * heightFactor,
      width: size.width * widthFactor,
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
        horizontal: size.width * 0.015,
      ),
      child: Card(
        color: backgroundColor,
        child: TextButton(
          onPressed: () {
            calculatorState.addInput(context, buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: size.height * textSizeFactor,
            ),
          ),
        ),
      ),
    );
  }
}
