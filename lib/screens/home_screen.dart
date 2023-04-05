import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/models/button_model.dart';
import 'package:calculator/widgets/box_border_widget.dart';
import 'package:calculator/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:math_expressions/math_expressions.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String lastOperation = '';
  String newOperation = '0';

  //Adiciona um número
  addNumber(int number) {
    setState(() {
      if (newOperation == '0') {
        newOperation = '';
      }
      newOperation = newOperation + number.toString();
    });
  }

  //Adiciona um sinal matemático
  addSignal(String signal) {
    String lastSignal = newOperation[newOperation.length - 1];
    if (lastSignal == '-' ||
        lastSignal == '+' ||
        lastSignal == '*' ||
        lastSignal == '/') {
      newOperation = newOperation.substring(0, newOperation.length - 1);
    }

    setState(() {
      newOperation = newOperation + signal;
    });
  }

  //Calcula a operação matemática
  result() {
    //Verifica se  o último dígito é um sinal
    String lastSignal = newOperation[newOperation.length - 1];
    if (lastSignal == '-' ||
        lastSignal == '+' ||
        lastSignal == '*' ||
        lastSignal == '/') {
      return;
    }

    //Realiza o cálculo
    Parser p = Parser();
    Expression exp = p.parse(newOperation);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    String result = eval.toString();
    if (result.endsWith('.0')) {
      result = int.parse(double.parse(result).toStringAsFixed(0)).toString();
    }
    setState(() {
      lastOperation = newOperation;
      newOperation = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ButtonModel> buttonsModels = [
      ButtonModel(
        '1',
        () => addNumber(1),
      ),
      ButtonModel(
        '2',
        () => addNumber(2),
      ),
      ButtonModel(
        '3',
        () => addNumber(3),
      ),
      ButtonModel(
        '+',
        () => addSignal('+'),
      ),
      ButtonModel(
        '4',
        () => addNumber(4),
      ),
      ButtonModel(
        '5',
        () => addNumber(5),
      ),
      ButtonModel(
        '6',
        () => addNumber(6),
      ),
      ButtonModel(
        '-',
        () => addSignal('-'),
      ),
      ButtonModel(
        '7',
        () => addNumber(7),
      ),
      ButtonModel(
        '8',
        () => addNumber(8),
      ),
      ButtonModel(
        '9',
        () => addNumber(9),
      ),
      ButtonModel(
        '0',
        () => addNumber(0),
        isDoubleWidth: true,
      ),
      ButtonModel(
        '*',
        () => addSignal('*'),
      ),
      ButtonModel(
        '/',
        () => addSignal('/'),
      ),
      ButtonModel(
        '=',
        () => result(),
      ),
    ];
    List<ButtonWidget> buttonsWidgets = buttonsModels
        .map(
          (buttonModel) => ButtonWidget(
            action: buttonModel.action,
            actionFunction: buttonModel.actionFunction,
            isDoubleWidth: buttonModel.isDoubleWidth,
          ),
        )
        .toList();
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                child: Stack(
                  children: [
                    const Positioned(
                      left: -5,
                      child: Text(
                        'CASIO',
                        style: TextStyle(
                          color: kBlack,
                          fontFamily: 'Bungee',
                          fontSize: 36,
                          letterSpacing: 5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 45,
                      child: Text(
                        'CALCULADORA',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 15,
                      child: Row(
                        children: const [
                          BoxBorderWidget(),
                          BoxBorderWidget(),
                          BoxBorderWidget(),
                          BoxBorderWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kWhite,
                  border: Border.all(
                    color: kBlack,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: kBlack,
                      blurRadius: 0, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        5, // Move to right 5  horizontally
                        5, // Move to bottom 5 Vertically
                      ),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    lastOperation != null
                        ? Positioned(
                            top: 30,
                            right: 20,
                            child: Text(
                              lastOperation,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 24,
                                fontFamily: 'Bungee',
                              ),
                            ),
                          )
                        : Container(),
                    Positioned(
                      bottom: 0,
                      right: 20,
                      left: 20,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 125,
                        child: AutoSizeText(
                          newOperation,
                          style: TextStyle(
                            color: kBlack,
                            fontSize: 72,
                            fontFamily: 'Bungee',
                          ),
                          minFontSize: 18,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      child: Container(
                        height: 15,
                        width: MediaQuery.of(context).size.width,
                        color: kTealAccent,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 15,
                        width: MediaQuery.of(context).size.width,
                        color: kOrangeAccent,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StaggeredGrid.count(
                  axisDirection: AxisDirection.down,
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 4,
                  children: buttonsWidgets,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
