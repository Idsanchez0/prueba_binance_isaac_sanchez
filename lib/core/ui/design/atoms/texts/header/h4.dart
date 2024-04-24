import 'package:flutter/cupertino.dart';

class H4 extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const H4(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<H4> createState() => _H4();
}

class _H4 extends State<H4> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          fontSize: 20,
          height: 1.5),
    );
  }
}
