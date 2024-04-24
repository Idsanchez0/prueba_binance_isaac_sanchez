import 'package:flutter/cupertino.dart';

class H6 extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const H6(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<H6> createState() => _H6();
}

class _H6 extends State<H6> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          fontSize: 16,
          height: 1.5),
    );
  }
}
