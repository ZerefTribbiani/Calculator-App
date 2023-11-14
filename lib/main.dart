import 'package:calculator/calculator_buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
  static var displayText = '';

  String getDisplayText() {
    return displayText;
  }

  void updateDisplayText(String newText) {
    setState(() {
      displayText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF17181A),
      body: Center(
        child: SizedBox(
          width: size.width * 0.82,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.4,
                alignment: Alignment.centerRight,
                child: Text(
                  displayText,
                  style: TextStyle(
                    color: const Color(0xFFFFFFFF),
                    fontSize: size.height * 0.08,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton.clear(
                            size: size,
                            updateDisplayText: updateDisplayText,
                          ),
                          CalculatorButton.backspace(
                            size: size,
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                          CalculatorButton.operator(
                            size: size,
                            op: '÷',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton.digit(
                            size: size,
                            digit: '7',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                          CalculatorButton.digit(
                            size: size,
                            digit: '8',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                          CalculatorButton.digit(
                            size: size,
                            digit: '9',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton.digit(
                            size: size,
                            digit: '4',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                          CalculatorButton.digit(
                            size: size,
                            digit: '5',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                          CalculatorButton.digit(
                            size: size,
                            digit: '6',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton.digit(
                            size: size,
                            digit: '1',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                          CalculatorButton.digit(
                            size: size,
                            digit: '2',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                          CalculatorButton.digit(
                            size: size,
                            digit: '3',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton.digit(
                            size: size,
                            widthFactor: 0.4,
                            digit: '0',
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                          CalculatorButton.decimalPoint(
                            size: size,
                            getDisplayText: getDisplayText,
                            updateDisplayText: updateDisplayText,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton.operator(
                        size: size,
                        op: '×',
                        getDisplayText: getDisplayText,
                        updateDisplayText: updateDisplayText,
                      ),
                      CalculatorButton.operator(
                        size: size,
                        op: '-',
                        getDisplayText: getDisplayText,
                        updateDisplayText: updateDisplayText,
                      ),
                      CalculatorButton.operator(
                        size: size,
                        heightFactor: 0.15,
                        op: '+',
                        getDisplayText: getDisplayText,
                        updateDisplayText: updateDisplayText,
                      ),
                      CalculatorButton.equalTo(
                        size: size,
                        precision: 2,
                        getDisplayText: getDisplayText,
                        updateDisplayText: updateDisplayText,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
