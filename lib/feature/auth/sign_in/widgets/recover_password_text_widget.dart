import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/utils/paths/colors_utils.dart';
import '../../../../core/ui/utils/routes/routes.dart';

class RecoverPasswordTextWidget extends StatefulWidget {
  const RecoverPasswordTextWidget({super.key});
  @override
  State<RecoverPasswordTextWidget> createState() =>
      _RecoverPasswordTextWidget();
}

class _RecoverPasswordTextWidget extends State<RecoverPasswordTextWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          const TextSpan(
            text: '¿Olvidaste tu contraseña? ',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat',
                fontSize: 17,
                height: 1.5),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => routes.recoverPassword(context: context),
            text: 'Recupérala',
            style: TextStyle(
                color: colors.primary500,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 17,
                height: 1.5),
          )
        ]),
      ),
    );
  }
}
