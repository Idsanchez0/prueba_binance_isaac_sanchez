import 'package:flutter/cupertino.dart';

class H2 extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const H2(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<H2> createState() => _H2();
}

class _H2 extends State<H2> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          fontSize: 25,
          height: 1.5),
    );
  }
}
