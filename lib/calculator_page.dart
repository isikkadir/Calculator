import 'package:calculator/models/calculator_model.dart';
import 'package:calculator/widgets/row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  void pressButton(String islem) {
    final _calculatorModel =
        Provider.of<CalculatorModel>(context, listen: false);
    String number = _calculatorModel.number;
    bool canCalculate = _calculatorModel.canCalculate;
    if (islem == "+" || islem == "-" || islem == "*" || islem == "/") {
      if (canCalculate) {
        _calculatorModel.calculateValue();
      } else {
        _calculatorModel.result = double.parse(number) ?? 0;
        _calculatorModel.canCalculate = true;
      }

      _calculatorModel.number = '';
      _calculatorModel.operands = islem;
    } else if (islem == '=') {
      _calculatorModel.calculateValue();
      _calculatorModel.canCalculate = false;
    } else if (islem == 'CE') {
      _calculatorModel.number = '';
      _calculatorModel.show = '0';
      _calculatorModel.canCalculate = false;
    } else {
      if (number == '0' || number == '0.0') {
        _calculatorModel.number = '';
      }
      _calculatorModel.number += islem;
      _calculatorModel.show = number;
      print("show : " + _calculatorModel.show);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _calculatorModel =
        Provider.of<CalculatorModel>(context, listen: true);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Text(
                  _calculatorModel.show,
                  style: TextStyle(color: Colors.white, fontSize: 80.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Container(
                padding: EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RowButtons(
                      tur: "GreyAndOrange",
                      text1: "AC",
                      text2: "+/-",
                      text3: "%",
                      text4: "/",
                      text1Func: () => pressButton("CE"),
                      text2Func: () => pressButton("CE"),
                      text3Func: () => pressButton("/"),
                      text4Func: () => pressButton("/"),
                    ),
                    RowButtons(
                      tur: "BlackAndOrange",
                      text1: "1",
                      text2: "2",
                      text3: "3",
                      text4: "X",
                      text1Func: () => pressButton("1"),
                      text2Func: () => pressButton("2"),
                      text3Func: () => pressButton("3"),
                      text4Func: () => pressButton("*"),
                    ),
                    RowButtons(
                      tur: "BlackAndOrange",
                      text1: "4",
                      text2: "5",
                      text3: "6",
                      text4: "-",
                      text1Func: () => pressButton("4"),
                      text2Func: () => pressButton("5"),
                      text3Func: () => pressButton("6"),
                      text4Func: () => pressButton("-"),
                    ),
                    RowButtons(
                      tur: "BlackAndOrange",
                      text1: "7",
                      text2: "8",
                      text3: "9",
                      text4: "+",
                      text1Func: () => pressButton("7"),
                      text2Func: () => pressButton("8"),
                      text3Func: () => pressButton("9"),
                      text4Func: () => pressButton("+"),
                    ),
                    RowButtons(
                      tur: "ZeroAndOrange",
                      text1: "0",
                      text2: ",",
                      text3: "=",
                      text1Func: () => pressButton("0"),
                      text2Func: () => pressButton(","),
                      text3Func: () => pressButton("="),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
