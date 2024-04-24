import 'package:flutter/cupertino.dart';

class H1 extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const H1(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<H1> createState() => _H1();
}

class _H1 extends State<H1> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          fontSize: 30,
          height: 1.5),
    );
  }
}
