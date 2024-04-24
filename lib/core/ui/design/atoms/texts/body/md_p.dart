import 'package:flutter/cupertino.dart';

class MdP extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;
  const MdP(
      {Key? key,
      required this.title,
      required this.color,
      required this.align,
      required this.fontWeight})
      : super(key: key);
  @override
  State<MdP> createState() => _MdP();
}

class _MdP extends State<MdP> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: widget.fontWeight,
          fontFamily: 'Montserrat',
          fontSize: 17,
          height: 1.5),
    );
  }
}
