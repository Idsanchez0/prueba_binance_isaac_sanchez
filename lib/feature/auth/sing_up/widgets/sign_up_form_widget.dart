import 'package:flutter/material.dart';
import 'package:prueba_binance_isaac_sanchez/core/global/texts_global.dart';

import '../../../../core/ui/design/atoms/text_fields/custom_password_form_field.dart';
import '../../../../core/ui/design/atoms/text_fields/custom_text_form_field.dart';
import '../../../../core/ui/design/atoms/texts/body/sm_p.dart';
import '../../../../core/ui/design/atoms/texts/buttons/captions.dart';
import '../../../../core/ui/utils/paths/colors_utils.dart';
import '../../../../core/ui/utils/size/size_config.dart';

class SignUpFormWidget extends StatefulWidget {
  final bool errorName;
  final bool errorLastName;
  final bool errorEmail;
  final bool showError;
  final bool noMatch;
  final String nameError;
  final String lastNameError;
  final String termsError;
  final String emailError;
  final String messageError;
  final String messageNotMatch;
  final TextEditingController name;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final Function onEditingEmails;
  final Function validateDynamicPassword;
  final Function validatePassword;
  final Function onChangeName;
  final Function onChangeLastName;
  const SignUpFormWidget({
    super.key,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.errorName,
    required this.nameError,
    required this.errorLastName,
    required this.lastNameError,
    required this.errorEmail,
    required this.emailError,
    required this.onEditingEmails,
    required this.validateDynamicPassword,
    required this.showError,
    required this.messageError,
    required this.validatePassword,
    required this.noMatch,
    required this.messageNotMatch,
    required this.termsError,
    required this.onChangeName,
    required this.onChangeLastName,
  });
  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidget();
}

class _SignUpFormWidget extends State<SignUpFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 3 * SizeConfig.heightMultiplier,
        ),
        SmP(
            title: textsGlobal.name,
            color: Colors.black,
            align: TextAlign.start,
            fontWeight: FontWeight.normal),
        CustomTextFormField(
            controller: widget.name,
            inputType: TextInputType.name,
            error: widget.errorName,
            enable: true,
            hintText: textsGlobal.name,
            onChangeData: (x) => widget.onChangeName(widget.name.text),
            messageError: widget.nameError,
            isFocused: false),
        SizedBox(
          height: 2 * SizeConfig.heightMultiplier,
        ),
        SmP(
            title: textsGlobal.lastName,
            color: Colors.black,
            align: TextAlign.start,
            fontWeight: FontWeight.normal),
        CustomTextFormField(
            controller: widget.lastName,
            inputType: TextInputType.name,
            enable: true,
            error: widget.errorLastName,
            onChangeData: (x) => widget.onChangeLastName(widget.lastName.text),
            messageError: widget.lastNameError,
            hintText: textsGlobal.lastName,
            isFocused: false),
        SizedBox(
          height: 2 * SizeConfig.heightMultiplier,
        ),
        SmP(
            title: textsGlobal.email,
            color: Colors.black,
            align: TextAlign.start,
            fontWeight: FontWeight.normal),
        CustomTextFormField(
            controller: widget.email,
            inputType: TextInputType.emailAddress,
            enable: true,
            error: widget.errorEmail,
            messageError: widget.emailError,
            hintText: textsGlobal.email,
            onChangeData: (x) => widget.onEditingEmails(widget.email.text),
            isFocused: false),
        SizedBox(
          height: 2 * SizeConfig.heightMultiplier,
        ),
        SmP(
            title: textsGlobal.password,
            color: Colors.black,
            align: TextAlign.start,
            fontWeight: FontWeight.normal),
        CustomPasswordFormField(
          controller: widget.password,
          text: textsGlobal.passwordHint,
          colorBorder: widget.showError == true ? colors.error600 : null,
          colorUnderlineBorder:
              widget.showError == true ? colors.error600 : null,
          onChangeData2: (x) => widget.validateDynamicPassword(
              widget.password.text, widget.confirmPassword.text),
        ),
        if (widget.showError == true) ...[
          SizedBox(
            height: 1 * SizeConfig.heightMultiplier,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Captions(
                title: widget.messageError,
                color: colors.error600,
                align: TextAlign.left),
          )
        ],
        SizedBox(
          height: 2 * SizeConfig.heightMultiplier,
        ),
        SmP(
            title: textsGlobal.passwordConfirm,
            color: Colors.black,
            align: TextAlign.start,
            fontWeight: FontWeight.normal),
        CustomPasswordFormField(
          controller: widget.confirmPassword,
          colorBorder: widget.noMatch == true ? colors.error600 : null,
          colorUnderlineBorder: widget.noMatch == true ? colors.error600 : null,
          text: textsGlobal.passwordHint,
          onChangeData: () => widget.validatePassword(
              widget.password.text, widget.confirmPassword.text),
        ),
        if (widget.noMatch == true) ...[
          Container(
              alignment: Alignment.centerLeft,
              child: Captions(
                  title: widget.messageNotMatch,
                  color: colors.error600,
                  align: TextAlign.left)),
        ],
        SizedBox(
          height: 3 * SizeConfig.heightMultiplier,
        ),
        if (widget.termsError != '') ...[
          Container(
              alignment: Alignment.centerLeft,
              child: Captions(
                  title: widget.termsError,
                  color: colors.error600,
                  align: TextAlign.left)),
        ],
      ],
    );
  }
}
