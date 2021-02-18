import 'package:calculator/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/calculator_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<CalculatorModel>(
        create: (context) => CalculatorModel(),
        child: CalculatorPage(),
      ),
    );
  }
}
