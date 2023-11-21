import 'dart:math' show pow;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorManager extends ChangeNotifier {
  static var operators = ['+', '-', '×', '÷'];

  final Size size;
  late String _displayText;

  CalculatorManager(this.size) {
    _displayText = '0';
  }

  String get displayText => _displayText;

  void updateDisplayText(String newText) {
    _displayText = newText;
    notifyListeners();
  }

  CalculatorDisplay calculatorDisplay({
    double heightFactor = 0.4,
    double widthFactor = 1,
    Color backgroundColor = const Color(0xFF17181A),
    Color textColor = const Color(0xFFFFFFFF),
    double textSizeFactor = 0.08,
  }) {
    return CalculatorDisplay(
      size: size,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      textSizeFactor: textSizeFactor,
      manager: this,
    );
  }

  /// Use calculatorManager.displayText and calculatorManager.updateDisplayText(newText)
  /// inside onPressed to get and update the value of the text on the calculator display
  CalculatorButton customButton({
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    Color backgroundColor = const Color(0xFF303136),
    Color textColor = const Color(0xFF29A8FF),
    double textSizeFactor = 0.04,
    required String buttonText,
    required void Function() onPressed,
  }) {
    return CalculatorButton(
      size: size,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      buttonText: buttonText,
      onPressed: onPressed,
    );
  }

  CalculatorButton digitButton({
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    Color backgroundColor = const Color(0xFF303136),
    Color textColor = const Color(0xFF29A8FF),
    required String digit,
    double textSizeFactor = 0.04,
  }) {
    return CalculatorButton(
      size: size,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      buttonText: digit,
      onPressed: () {
        String newText = displayText;
        var terms = newText.split(RegExp(r'\+|-|×|÷'));
        String lastTerm = terms[terms.length - 1];
        if (lastTerm == '0') {
          newText = newText.substring(0, newText.length - 1);
        }
        newText += digit;
        updateDisplayText(newText);
      },
    );
  }

  CalculatorButton decimalPointButton({
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    Color backgroundColor = const Color(0xFF303136),
    Color textColor = const Color(0xFF109DFF),
    double textSizeFactor = 0.04,
  }) {
    return CalculatorButton(
      size: size,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      buttonText: '.',
      textSizeFactor: textSizeFactor,
      onPressed: () {
        String newText = displayText;
        if (newText[newText.length - 1] != '.') {
          if (operators.contains(newText[newText.length - 1])) {
            newText += '0';
          }
          newText += '.';
        }
        updateDisplayText(newText);
      },
    );
  }

  CalculatorButton operatorButton({
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    Color backgroundColor = const Color(0xFF005DB2),
    Color textColor = const Color(0xFF339DFF),
    required String op,
    double textSizeFactor = 0.04,
  }) {
    return CalculatorButton(
      size: size,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      buttonText: op,
      textSizeFactor: textSizeFactor,
      onPressed: () {
        String newText = displayText;
        if (operators.contains(newText[newText.length - 1])) {
          newText = newText.substring(0, newText.length - 1);
        }
        newText += op;
        updateDisplayText(newText);
      },
    );
  }

  CalculatorButton equalToButton({
    double heightFactor = 0.15,
    double widthFactor = 0.23,
    Color backgroundColor = const Color(0xFF1991FF),
    Color textColor = const Color(0xFFB2DAFF),
    double textSizeFactor = 0.04,
    int precision = 5,
  }) {
    return CalculatorButton(
      size: size,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      buttonText: '=',
      textSizeFactor: textSizeFactor,
      onPressed: () {
        String newText = displayText;
        var expText = newText.replaceAll('×', '*').replaceAll('÷', '/');
        Parser p = Parser();
        Expression exp = p.parse(expText);
        ContextModel cm = ContextModel();
        num result = exp.evaluate(EvaluationType.REAL, cm);
        num precisionFactor = pow(10, precision);
        result = (result * precisionFactor).round() / precisionFactor;
        newText = result == result.toInt()
            ? result.toInt().toString()
            : result.toString();
        updateDisplayText(newText);
      },
    );
  }

  CalculatorButton clearButton({
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    Color backgroundColor = const Color(0xFF616161),
    Color textColor = const Color(0xFFA5A5A5),
    double textSizeFactor = 0.035,
  }) {
    return CalculatorButton(
      size: size,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      buttonText: 'Ac',
      textSizeFactor: textSizeFactor,
      onPressed: () {
        updateDisplayText('0');
      },
    );
  }

  CalculatorButton backspaceButton({
    double heightFactor = 0.1,
    double widthFactor = 0.23,
    Color backgroundColor = const Color(0xFF616161),
    Color textColor = const Color(0xFFA5A5A5),
    double textSizeFactor = 0.035,
  }) {
    return CalculatorButton(
      size: size,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      backgroundColor: backgroundColor,
      textColor: textColor,
      buttonText: '⌫',
      textSizeFactor: textSizeFactor,
      onPressed: () {
        String newText = displayText;
        if (newText.isNotEmpty) {
          newText = newText.substring(0, newText.length - 1);
        }
        if (newText.isEmpty) {
          newText = '0';
        }
        updateDisplayText(newText);
      },
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  final Size size;
  final double heightFactor;
  final double widthFactor;
  final double padding;
  final Color backgroundColor;
  final Color textColor;
  final double textSizeFactor;
  final CalculatorManager? manager;

  const CalculatorDisplay({
    super.key,
    required this.size,
    this.heightFactor = 0.4,
    this.widthFactor = 1,
    this.padding = 20,
    this.backgroundColor = const Color(0xFF17181A),
    this.textColor = const Color(0xFFFFFFFF),
    this.textSizeFactor = 0.08,
    required this.manager,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: manager,
      child: Builder(builder: (context) {
        var displayText = context.watch<CalculatorManager>().displayText;

        return Container(
          height: size.height * heightFactor,
          width: size.width * widthFactor,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(padding),
          color: backgroundColor,
          child: Text(
            displayText,
            style: TextStyle(
              color: textColor,
              fontSize: size.height * textSizeFactor,
            ),
          ),
        );
      }),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final Size size;
  final double heightFactor;
  final double widthFactor;
  final Color backgroundColor;
  final Color textColor;
  final String buttonText;
  final double textSizeFactor;
  final void Function() onPressed;

  const CalculatorButton({
    super.key,
    required this.size,
    required this.heightFactor,
    required this.widthFactor,
    this.backgroundColor = const Color(0xFF000000),
    this.textColor = const Color(0xFFFFFFFF),
    this.buttonText = '',
    this.textSizeFactor = 0.04,
    required this.onPressed,
  });

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
