import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScrren extends StatefulWidget {
  HomeScrren({Key? key}) : super(key: key);

  @override
  State<HomeScrren> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScrren> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircularButoon(
                          title: 'AC',
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: "(",
                          onPress: () {
                            userInput += "(";
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: ")",
                          onPress: () {
                            userInput += ")";
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '-',
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                          defalutColor: Colors.red,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircularButoon(
                          title: '7',
                          onPress: () {
                            userInput += '7'; //or we can user userInput+'7'
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: 'x',
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                          defalutColor: Colors.red,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircularButoon(
                          title: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '/',
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                          defalutColor: Colors.red,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircularButoon(
                          title: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '+',
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                          defalutColor: Colors.red,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircularButoon(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: 'DEL',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        CircularButoon(
                          title: '=',
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                          defalutColor: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = evaluate.toString();
  }
}
