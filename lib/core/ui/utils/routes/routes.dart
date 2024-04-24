import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:prueba_binance_isaac_sanchez/feature/auth/sign_in/view/sign_in_page.dart';
import 'package:prueba_binance_isaac_sanchez/feature/information/view/information_page.dart';
import 'package:prueba_binance_isaac_sanchez/feature/main_explore/view/main_explore_page.dart';

import '../../../../feature/auth/sing_up/view/sign_up_page.dart';
import '../../../../feature/charts/view/charts_page.dart';
import '../../../../feature/init/onboarding/view/onboarding_page.dart';
import '../../design/templates/modals/full_screen_modal_empty_template.dart';

class Routes {
  ///Splash Screen
  void onBoarding({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const OnboardingPage(),
            duration: const Duration(milliseconds: 200)));
  }

  ///Sign In
  void signIn({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const SignInPage(),
            duration: const Duration(milliseconds: 200)));
  }

  ///Recover Password
  void recoverPassword({required context}) {}

  ///Sign Up
  void signUp({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const SignUpPage(),
            duration: const Duration(milliseconds: 200)));
  }

  ///Main Explore
  void mainExplore({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const MainExplorePage(),
            duration: const Duration(milliseconds: 200)));
  }

  ///Charts
  void chartsPage({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const ChartsPage(),
            duration: const Duration(milliseconds: 200)));
  }

  ///Information Page
  void informationPage({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const InformationPage(),
            duration: const Duration(milliseconds: 200)));
  }

  ///Modal pantalla completa
  void modalFullScreen({required context, required child}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: FullScreenModalEmptyTemplate(child: child),
            duration: const Duration(milliseconds: 200)));
  }
}

Routes routes = Routes();
