import 'package:calculator/widgets/grey_buttons.dart';
import 'package:calculator/widgets/number_buttons.dart';
import 'package:calculator/widgets/orange_buttons.dart';
import 'package:calculator/widgets/zero_button.dart';
import 'package:flutter/material.dart';

class RowButtons extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String tur;
  final Function text1Func;
  final Function text2Func;
  final Function text3Func;
  final Function text4Func;

  const RowButtons(
      {Key key,
      @required this.tur,
      this.text1,
      this.text2,
      this.text3,
      this.text4,
      this.text1Func,
      this.text2Func,
      this.text3Func,
      this.text4Func})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var zeroPadding = MediaQuery.of(context).size.width / 34;
    return tur == "GreyAndOrange"
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GreyButton(text: text1, onPressed: text1Func),
              GreyButton(text: text2, onPressed: text2Func),
              GreyButton(text: text3, onPressed: text3Func),
              OrangeButton(text: text4, onPressed: text4Func),
            ],
          )
        : tur == "BlackAndOrange"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NumberButton(text: text1, onPressed: text1Func),
                  NumberButton(text: text2, onPressed: text2Func),
                  NumberButton(text: text3, onPressed: text3Func),
                  OrangeButton(text: text4, onPressed: text4Func),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: zeroPadding),
                    child: ZeroButton(text: text1, onPressed: text1Func),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  NumberButton(text: text2, onPressed: text2Func),
                  OrangeButton(text: text3, onPressed: text3Func),
                ],
              );
  }
}
