import 'package:flutter/material.dart';
import 'package:prueba_binance_isaac_sanchez/core/global/texts_global.dart';

import '../../../../core/ui/design/molecules/buttons/custom_button.dart';
import '../../../../core/ui/design/templates/cards/full_screen_modal_card.dart';
import '../../../../core/ui/design/templates/headers/text_icon_header.dart';
import '../../../../core/ui/utils/paths/colors_utils.dart';
import '../../../../core/ui/utils/paths/icons_utils.dart';
import '../../../../core/ui/utils/routes/routes.dart';
import '../../../../core/ui/utils/size/size_config.dart';
import '../controller/sign_up_controller.dart';
import '../widgets/sign_up_form_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final _globalKey = GlobalKey<ScaffoldState>();
  bool errorEmail = false,
      noMatch = false,
      showError = false,
      errorLastName = false,
      errorName = false;
  String emailError = '',
      messageNotMatch = '',
      messageError = '',
      nameError = '',
      termsError = '',
      lastNameError = '';
  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  onEditingEmails(String value) {
    final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0\d9]{1,3}\.[0\d9]{1,3}\.[0\d9]{1,3}\.[0\d9]{1,3}\])|(([a-zA-Z\-0\d9]+\.)+[a-zA-Z]{2,}))$',
    );
    if (!emailRegExp.hasMatch(value.trim())) {
      setState(() {
        errorEmail = true;
        emailError = textsGlobal.errorEmail;
      });
    } else {
      setState(() {
        errorEmail = false;
        emailError = '';
      });
    }
  }

  /// Validar contraseña.
  /// Parámetro a recibir [text].
  /// Parámetro a recibir [matchValue].
  validatePassword(String? text, String? matchValue) {
    if (text != matchValue) {
      setState(() {
        noMatch = true;
        messageNotMatch = textsGlobal.messageNotMatch;
      });
    } else if (text!.isEmpty && matchValue!.isEmpty) {
      setState(() {
        noMatch = false;
        messageNotMatch = '';
      });
    } else {
      setState(() {
        noMatch = false;
        messageNotMatch = '';
      });
    }
  }

  /// Validar contraseña dinámica.
  /// Parámetro a recibir [value].
  validateDynamicPassword(String value, String validator) {
    if (value.length < 6 ||
        !value.contains(RegExp(r'[A-Z]')) ||
        !value.contains(RegExp(r'[0-9]')) ||
        !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      setState(() {
        showError = true;
        messageError = textsGlobal.passwordDynamic;
      });
    } else {
      setState(() {
        showError = false;
        messageError = '';
      });
    }
    if (validator != '') {
      validatePassword(validator, value);
    }
  }

  onChangeName(String value) {
    if (value.isNotEmpty) {
      setState(() {
        errorName = false;
      });
    }
  }

  onChangeLastName(String value) {
    if (value.isNotEmpty) {
      setState(() {
        errorLastName = false;
      });
    }
  }

  validateForm() {
    if (name.text.isEmpty) {
      setState(() {
        errorName = true;
        nameError = textsGlobal.nameError;
      });
    }
    if (lastName.text.isEmpty) {
      setState(() {
        errorLastName = true;
        lastNameError = textsGlobal.lastNameError;
      });
    }
    if (password.text.isEmpty) {
      setState(() {
        showError = true;
        messageError = textsGlobal.passwordDynamic;
      });
    }
    if (email.text.isEmpty) {
      setState(() {
        errorEmail = true;
        emailError = textsGlobal.emailRequired;
      });
    }
    if (confirmPassword.text.isEmpty) {
      setState(() {
        noMatch = true;
        messageNotMatch = textsGlobal.messageNotMatch;
      });
    }
    if (errorName == false &&
        errorLastName == false &&
        errorEmail == false &&
        showError == false &&
        noMatch == false) {
      SignUpController(context).saveData(
          name: name.text,
          lastName: lastName.text,
          email: email.text,
          password: password.text);
      routes.modalFullScreen(
          context: context,
          child: FullScreenModalCard(
              image: iconsUtils.check,
              title: textsGlobal.titleSuccess,
              onTap: () => routes.signIn(context: context),
              text: textsGlobal.textSuccess));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        () => Navigator.pop(context);
        return;
      },
      child: Scaffold(
          appBar: TextIconHeader(
              title: textsGlobal.titleSignUp,
              onTap: () => Navigator.pop(context)),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(
              left: 5 * SizeConfig.widthMultiplier,
              right: 5 * SizeConfig.widthMultiplier,
              bottom: 5 * SizeConfig.heightMultiplier,
              top: 1 * SizeConfig.heightMultiplier,
            ),
            child: GestureDetector(
                onTap: () => validateForm(),
                child: CustomButton(
                    color: colors.primary500,
                    border: colors.primary500,
                    colorText: Colors.white,
                    text: textsGlobal.register,
                    radius: 50)),
          ),
          backgroundColor: Colors.white,
          key: _globalKey,
          body: SafeArea(
              top: true,
              bottom: true,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: 5 * SizeConfig.widthMultiplier),
                  child: SingleChildScrollView(
                    child: GestureDetector(
                        onTap: () => FocusScope.of(context).unfocus(),
                        child: SignUpFormWidget(
                            name: name,
                            lastName: lastName,
                            email: email,
                            password: password,
                            messageError: messageError,
                            errorEmail: errorEmail,
                            emailError: emailError,
                            errorLastName: errorLastName,
                            errorName: errorName,
                            lastNameError: lastNameError,
                            messageNotMatch: messageNotMatch,
                            nameError: nameError,
                            noMatch: noMatch,
                            showError: showError,
                            termsError: termsError,
                            onChangeLastName: (x) => onChangeLastName(x),
                            onChangeName: (x) => onChangeName(x),
                            onEditingEmails: (x) => onEditingEmails(x),
                            validateDynamicPassword: (x, y) =>
                                validateDynamicPassword(x, y),
                            validatePassword: (x, y) => validatePassword(x, y),
                            confirmPassword: confirmPassword)),
                  ),
                ),
              ))),
    );
  }
}
