import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../utils/paths/colors_utils.dart';

class CustomTextTermsConditions extends StatefulWidget {
  final Function onTap;
  const CustomTextTermsConditions({super.key, required this.onTap});
  @override
  State<CustomTextTermsConditions> createState() =>
      _CustomTextTermsConditions();
}

class _CustomTextTermsConditions extends State<CustomTextTermsConditions> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      const TextSpan(
          text: 'Al inscribirse, acepta nuestras ',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'Poppins')),
      TextSpan(
          text: 'Condiciones de Servicio y Política de Privacidad',
          recognizer: TapGestureRecognizer()..onTap = () => widget.onTap(),
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: colors.primary500,
              fontFamily: 'Poppins'))
    ]));
  }
}
