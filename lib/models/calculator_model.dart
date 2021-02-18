import 'package:flutter/material.dart';

class CalculatorModel with ChangeNotifier {
  String _number = "0";

  String get number => _number;

  set number(String value) {
    _number = value;
    notifyListeners();
  }

  double _result = 0.0;

  double get result => _result;

  set result(double value) {
    _result = value;
    notifyListeners();
  }

  String _operands = "";
  String _show = "0";
  bool _canCalculate = false;

  bool get canCalculate => _canCalculate;

  set canCalculate(bool value) {
    _canCalculate = value;
    notifyListeners();
  }

  String get operands => _operands;

  set operands(String value) {
    _operands = value;
    notifyListeners();
  }

  String get show => _show;

  set show(String value) {
    _show = value;
    notifyListeners();
  }

  void calculateValue() {
    switch (_operands) {
      case '+':
        _result += double.parse(_number) ?? 0;
        break;
      case '-':
        _result -= double.parse(_number) ?? 0;
        break;
      case '*':
        _result *= double.parse(_number) ?? 0;
        break;
      case '/':
        _result /= double.parse(_number) ?? 0;
        break;
      default:
        break;
    }

    _number = _result.toString();
    _show = _number;
    notifyListeners();
  }
}
