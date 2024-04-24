import 'package:flutter/cupertino.dart';

class XsmP extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;
  const XsmP(
      {Key? key,
      required this.title,
      required this.color,
      required this.align,
      required this.fontWeight})
      : super(key: key);
  @override
  State<XsmP> createState() => _XsmP();
}

class _XsmP extends State<XsmP> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: widget.fontWeight,
          fontFamily: 'Montserrat',
          fontSize: 10,
          height: 1.5),
    );
  }
}
