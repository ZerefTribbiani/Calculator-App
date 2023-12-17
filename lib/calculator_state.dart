import 'dart:math' show pow;

import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

class CalculatorState extends ChangeNotifier {
  static final operators = ['+', '-', '×', '÷'];

  int precision = 5;
  String _displayText = '0';

  String get displayText => _displayText;

  void addInput(String input) {
    switch (input) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        String newText = displayText;
        var terms = newText.split(RegExp(r'\+|-|×|÷'));
        String lastTerm = terms[terms.length - 1];
        if (lastTerm == '0') {
          newText = newText.substring(0, newText.length - 1);
        }
        newText += input;
        _displayText = newText;
      case '.':
        String newText = displayText;
        if (newText[newText.length - 1] != '.') {
          if (operators.contains(newText[newText.length - 1])) {
            newText += '0';
          }
          newText += '.';
        }
        _displayText = newText;
      case '+':
      case '-':
      case '×':
      case '÷':
        String newText = displayText;
        if (operators.contains(newText[newText.length - 1])) {
          newText = newText.substring(0, newText.length - 1);
        }
        newText += input;
        _displayText = newText;
      case '=':
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
        _displayText = newText;
      case 'Ac':
        _displayText = '0';
      case '⌫':
        String newText = displayText;
        if (newText.isNotEmpty) {
          newText = newText.substring(0, newText.length - 1);
        }
        if (newText.isEmpty) {
          newText = '0';
        }
        _displayText = newText;
    }
    notifyListeners();
  }
}
