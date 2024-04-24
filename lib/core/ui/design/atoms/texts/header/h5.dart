import 'package:flutter/cupertino.dart';

class H5 extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  const H5(
      {Key? key, required this.title, required this.color, required this.align})
      : super(key: key);
  @override
  State<H5> createState() => _H5();
}

class _H5 extends State<H5> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          fontSize: 18,
          height: 1.5),
    );
  }
}
