import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/utils/size/size_config.dart';

import '../../../../core/ui/utils/paths/colors_utils.dart';
import '../../../../core/ui/utils/routes/routes.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});
  @override
  State<SplashScreenPage> createState() => _SplashScreenPage();
}

class _SplashScreenPage extends State<SplashScreenPage> {
  final _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      routes.onBoarding(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => exit(0)));
        return;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          key: _globalKey,
          body: Center(
            child: FadeIn(
                duration: const Duration(seconds: 3),
                delay: const Duration(milliseconds: 500),
                child: SpinKitCircle(
                  color: colors.primary500,
                  size: 15 * SizeConfig.imageSizeMultiplier,
                )),
          )),
    );
  }
}
