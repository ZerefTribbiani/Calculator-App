import 'package:flutter/material.dart';

import 'buttons.dart';
import 'display.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CalculatorDisplay(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton.clearButton(),
                        CalculatorButton.backspaceButton(),
                        CalculatorButton.operatorButton(op: '÷'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton.digitButton(digit: '7'),
                        CalculatorButton.digitButton(digit: '8'),
                        CalculatorButton.digitButton(digit: '9'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton.digitButton(digit: '4'),
                        CalculatorButton.digitButton(digit: '5'),
                        CalculatorButton.digitButton(digit: '6'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton.digitButton(digit: '1'),
                        CalculatorButton.digitButton(digit: '2'),
                        CalculatorButton.digitButton(digit: '3'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton.digitButton(digit: '0', widthFactor: 0.46),
                        CalculatorButton.decimalPointButton(),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton.operatorButton(op: '×'),
                    CalculatorButton.operatorButton(op: '-'),
                    CalculatorButton.operatorButton(op: '+', heightFactor: 0.15),
                    CalculatorButton.equalToButton(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
