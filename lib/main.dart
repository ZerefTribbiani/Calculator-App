import 'package:calculator/calculator_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var calcManager = CalculatorManager(size);

    return Scaffold(
      backgroundColor: const Color(0xFF17181A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            calcManager.calculatorDisplay(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calcManager.clearButton(),
                        calcManager.backspaceButton(),
                        calcManager.operatorButton(op: '÷'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calcManager.digitButton(digit: '7'),
                        calcManager.digitButton(digit: '8'),
                        calcManager.digitButton(digit: '9'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calcManager.digitButton(digit: '4'),
                        calcManager.digitButton(digit: '5'),
                        calcManager.digitButton(digit: '6'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calcManager.digitButton(digit: '1'),
                        calcManager.digitButton(digit: '2'),
                        calcManager.digitButton(digit: '3'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calcManager.digitButton(digit: '0', widthFactor: 0.46),
                        calcManager.decimalPointButton(),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcManager.operatorButton(op: '×'),
                    calcManager.operatorButton(op: '-'),
                    calcManager.operatorButton(op: '+', heightFactor: 0.15),
                    calcManager.equalToButton(),
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
