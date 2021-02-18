import 'package:flutter/material.dart';

class ZeroButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const ZeroButton({Key key, @required this.text, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var yukseklik = MediaQuery.of(context).size.height / 4.7;
    var genislik = MediaQuery.of(context).size.width / 5.5;
    var yaziBoyut = MediaQuery.of(context).size.width / 10;
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tight(Size(yukseklik, genislik)),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0))),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(fontSize: yaziBoyut, color: Colors.white),
          ),
        ),
      ),
      fillColor: Color.fromRGBO(77, 77, 77, 1),
    );
  }
}
