import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const OrangeButton({Key key, @required this.text, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var yukseklik = MediaQuery.of(context).size.height / 10;
    var genislik = MediaQuery.of(context).size.width / 10;
    var yaziBoyut = MediaQuery.of(context).size.width / 10;
    return Expanded(
      child: RawMaterialButton(
        onPressed: onPressed,
        constraints: BoxConstraints.tight(Size(genislik, yukseklik)),
        shape: const CircleBorder(),
        child: Text(
          text,
          style: TextStyle(fontSize: yaziBoyut),
        ),
        fillColor: Colors.orange,
      ),
    );
  }
}
