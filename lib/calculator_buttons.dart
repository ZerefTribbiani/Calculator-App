import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorButton extends StatelessWidget {
  static var operators = ['+', '-', '×', '÷', '.'];

  final Size size;
  final double heightFactor;
  final double widthFactor;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double textSizeFactor;
  final void Function() onPressed;

  const CalculatorButton({
    super.key,
    required this.size,
    required this.heightFactor,
    required this.widthFactor,
    this.backgroundColor = const Color(0xFF000000),
    this.textColor = const Color(0xFFFFFFFF),
    this.text = '',
    this.textSizeFactor = 0.04,
    required this.onPressed,
  });

  CalculatorButton.digit({
    Key? key,
    required Size size,
    double heightFactor = 0.1,
    double widthFactor = 0.2,
    Color backgroundColor = const Color(0xFF303136),
    Color textColor = const Color(0xFF29A8FF),
    required String digit,
    double textSizeFactor = 0.04,
    required String Function() getDisplayText,
    required void Function(String) updateDisplayText,
  }) : this(
          key: key,
          size: size,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          backgroundColor: backgroundColor,
          textColor: textColor,
          text: digit,
          textSizeFactor: textSizeFactor,
          onPressed: () {
            var displayText = getDisplayText();
            // TODO: Take care of 0 after decimal point
            // var textLen = displayText.length;
            // if (textLen != 0 &&
            //     displayText[textLen - 1] == '0' &&
            //     (textLen == 1 ||
            //         CalculatorButton.operators
            //             .contains(displayText[textLen - 2]))) {
            //   displayText = '${displayText.substring(0, textLen - 1)}$digit';
            // } else {
            //   displayText += digit;
            // }
            displayText += digit;
            updateDisplayText(displayText);
          },
        );

  CalculatorButton.decimalPoint({
    Key? key,
    required Size size,
    double heightFactor = 0.1,
    double widthFactor = 0.2,
    Color backgroundColor = const Color(0xFF303136),
    Color textColor = const Color(0xFF109DFF),
    double textSizeFactor = 0.04,
    required String Function() getDisplayText,
    required void Function(String) updateDisplayText,
  }) : this(
          key: key,
          size: size,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          backgroundColor: backgroundColor,
          textColor: textColor,
          text: '.',
          textSizeFactor: textSizeFactor,
          onPressed: () {
            var displayText = getDisplayText();
            if (!CalculatorButton.operators
                .contains(displayText[displayText.length - 1])) {
              displayText += '.';
            }
            updateDisplayText(displayText);
          },
        );

  CalculatorButton.operator({
    Key? key,
    required Size size,
    double heightFactor = 0.1,
    double widthFactor = 0.2,
    Color backgroundColor = const Color(0xFF005DB2),
    Color textColor = const Color(0xFF339DFF),
    required String op,
    double textSizeFactor = 0.04,
    required String Function() getDisplayText,
    required void Function(String) updateDisplayText,
  }) : this(
          key: key,
          size: size,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          backgroundColor: backgroundColor,
          textColor: textColor,
          text: op,
          textSizeFactor: textSizeFactor,
          onPressed: () {
            var displayText = getDisplayText();
            if (!CalculatorButton.operators
                .contains(displayText[displayText.length - 1])) {
              displayText += op;
            }
            updateDisplayText(displayText);
          },
        );

  CalculatorButton.equalTo({
    Key? key,
    required Size size,
    double heightFactor = 0.15,
    double widthFactor = 0.2,
    Color backgroundColor = const Color(0xFF1991FF),
    Color textColor = const Color(0xFFB2DAFF),
    double textSizeFactor = 0.04,
    int precision = 2,
    required String Function() getDisplayText,
    required void Function(String) updateDisplayText,
  }) : this(
          key: key,
          size: size,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          backgroundColor: backgroundColor,
          textColor: textColor,
          text: '=',
          textSizeFactor: textSizeFactor,
          onPressed: () {
            var displayText = getDisplayText();
            var expText = displayText.replaceAll('×', '*').replaceAll('÷', '/');
            Parser p = Parser();
            Expression exp = p.parse(expText);
            ContextModel cm = ContextModel();
            num result = exp.evaluate(EvaluationType.REAL, cm);
            if (result == result.toInt()) {
              result = result.toInt();
            }
            updateDisplayText(result.toStringAsFixed(precision));
          },
        );

  CalculatorButton.clear({
    Key? key,
    required Size size,
    double heightFactor = 0.1,
    double widthFactor = 0.2,
    Color backgroundColor = const Color(0xFF616161),
    Color textColor = const Color(0xFFA5A5A5),
    double textSizeFactor = 0.03,
    required void Function(String) updateDisplayText,
  }) : this(
          key: key,
          size: size,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          backgroundColor: backgroundColor,
          textColor: textColor,
          text: 'Ac',
          textSizeFactor: textSizeFactor,
          onPressed: () {
            updateDisplayText('');
          },
        );

  CalculatorButton.backspace({
    Key? key,
    required Size size,
    double heightFactor = 0.1,
    double widthFactor = 0.2,
    Color backgroundColor = const Color(0xFF616161),
    Color textColor = const Color(0xFFA5A5A5),
    double textSizeFactor = 0.03,
    required String Function() getDisplayText,
    required void Function(String) updateDisplayText,
  }) : this(
          key: key,
          size: size,
          heightFactor: heightFactor,
          widthFactor: widthFactor,
          backgroundColor: backgroundColor,
          textColor: textColor,
          text: '⌫',
          textSizeFactor: textSizeFactor,
          onPressed: () {
            var displayText = getDisplayText();
            if (displayText.isNotEmpty) {
              displayText = displayText.substring(0, displayText.length - 1);
            }
            updateDisplayText(displayText);
          },
        );

  @override
  Widget build(BuildContext context) {
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
          onPressed: onPressed,
          child: Text(
            text,
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
