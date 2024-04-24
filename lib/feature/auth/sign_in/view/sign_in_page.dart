import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:prueba_binance_isaac_sanchez/core/global/texts_global.dart';
import 'package:prueba_binance_isaac_sanchez/feature/auth/sign_in/controller/sign_in_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/ui/design/atoms/texts/body/md_p.dart';
import '../../../../core/ui/design/atoms/texts/buttons/captions.dart';
import '../../../../core/ui/design/templates/headers/text_icon_header.dart';
import '../../../../core/ui/utils/paths/colors_utils.dart';
import '../../../../core/ui/utils/routes/routes.dart';
import '../../../../core/ui/utils/size/size_config.dart';
import '../widgets/buttons_widget.dart';
import '../widgets/form_sign_in_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final _globalKey = GlobalKey<ScaffoldState>();
  final LocalAuthentication auth = LocalAuthentication();
  String email = '', pass = '', authorized = 'Not Authorized';
  bool errorLogin = false,
      access = false,
      checkAuth = false,
      isAuthenticating = false;
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  LocalAuthentication authBio = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    getData(context);
  }

  getData(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log(prefs.getString('name').toString());
    setState(() {
      email = prefs.getString('email').toString();
      pass = prefs.getString('password').toString();
    });
  }

  login({required context, required email, required password}) async {
    bool access =
        await SignInController(context).login(email: email, password: password);
    if (access == true) {
      setState(() {
        errorLogin = false;
      });
      routes.mainExplore(context: context);
    } else {
      setState(() {
        errorLogin = true;
      });
    }
  }

  ///Autentificar mediante el biométrico
  Future<void> _authenticateWithBiometrics(context) async {
    bool? authenticated;
    if (email.toString() != 'null' || pass.toString() != 'null') {
      setState(() {
        isAuthenticating = true;
        authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        isAuthenticating = false;
        authorized = 'Authenticating';
        errorLogin = false;
      });

      login(context: context, email: email, password: pass);
    } else {
      setState(() {
        errorLogin = true;
      });
    }
    if (!mounted) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        () => routes.onBoarding(context: context);
        return;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          key: _globalKey,
          appBar: TextIconHeader(
            title: textsGlobal.titleSignIn,
            onTap: () => routes.onBoarding(context: context),
          ),
          body: SafeArea(
              top: true,
              bottom: true,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 5 * SizeConfig.widthMultiplier),
                  child: SingleChildScrollView(
                    child: GestureDetector(
                        onTap: () => FocusScope.of(context).unfocus(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 2 * SizeConfig.heightMultiplier,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: MdP(
                                  title: textsGlobal.textSignIn,
                                  color: colors.primary500,
                                  align: TextAlign.start,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3 * SizeConfig.heightMultiplier,
                            ),
                            FormSignInWidget(user: user, password: password),
                            if (errorLogin == true) ...[
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Captions(
                                      title: textsGlobal.errorLogin,
                                      color: colors.error600,
                                      align: TextAlign.left)),
                            ],
                            SizedBox(
                              height: 6 * SizeConfig.heightMultiplier,
                            ),
                            ButtonsWidget(
                              login: () => login(
                                  context: context,
                                  email: user.text,
                                  password: password.text),
                              biometricLogin: () =>
                                  _authenticateWithBiometrics(context),
                            ),
                          ],
                        )),
                  ),
                ),
              ))),
    );
  }
}
