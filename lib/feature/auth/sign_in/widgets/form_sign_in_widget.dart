import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/ui/design/atoms/text_fields/custom_password_form_field.dart';
import '../../../../core/ui/design/atoms/text_fields/custom_text_form_field.dart';
import '../../../../core/ui/design/atoms/texts/body/sm_p.dart';
import '../../../../core/ui/utils/size/size_config.dart';

class FormSignInWidget extends StatefulWidget {
  final TextEditingController user;
  final TextEditingController password;
  const FormSignInWidget(
      {super.key, required this.user, required this.password});
  @override
  State<FormSignInWidget> createState() => _FormSignInWidget();
}

class _FormSignInWidget extends State<FormSignInWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SmP(
            title: 'Correo electrónico',
            color: Colors.black,
            align: TextAlign.start,
            fontWeight: FontWeight.normal),
        CustomTextFormField(
            controller: widget.user,
            inputType: TextInputType.emailAddress,
            enable: true,
            onChangeData: (x) => log(widget.user.text),
            hintText: 'Correo electrónico',
            isFocused: true),
        SizedBox(
          height: 2 * SizeConfig.heightMultiplier,
        ),
        const SmP(
            title: 'Contraseña',
            color: Colors.black,
            align: TextAlign.start,
            fontWeight: FontWeight.normal),
        CustomPasswordFormField(
          controller: widget.password,
          text: '*********',
          onChangeData: () => log('*'),
        ),
      ],
    );
  }
}
