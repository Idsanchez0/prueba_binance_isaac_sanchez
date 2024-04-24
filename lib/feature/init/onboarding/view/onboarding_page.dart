import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prueba_binance_isaac_sanchez/core/global/texts_global.dart';

import '../../../../core/ui/design/molecules/buttons/custom_button.dart';
import '../../../../core/ui/utils/paths/colors_utils.dart';
import '../../../../core/ui/utils/paths/images_utils.dart';
import '../../../../core/ui/utils/routes/routes.dart';
import '../../../../core/ui/utils/size/size_config.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/item_carousel_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPage();
}

class _OnboardingPage extends State<OnboardingPage> {
  final _globalKey = GlobalKey<ScaffoldState>();

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
          body: SafeArea(
              bottom: true,
              top: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 45 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                  10 * SizeConfig.widthMultiplier),
                              bottomRight: Radius.circular(
                                  10 * SizeConfig.widthMultiplier),
                            ),
                            image: DecorationImage(
                                image: AssetImage(imagesUtils.onBoardingImage),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(height: 4 * SizeConfig.heightMultiplier),
                      Container(
                          alignment: Alignment.center,
                          width: 85 * SizeConfig.widthMultiplier,
                          child: CarouselWidget(
                            item1: ItemCarouselWidget(
                              title: textsGlobal.titleLoremIpsum,
                              text: textsGlobal.textLoremIpsum,
                            ),
                            item2: ItemCarouselWidget(
                              title: textsGlobal.titleLoremIpsum,
                              text: textsGlobal.textLoremIpsum,
                            ),
                            item3: ItemCarouselWidget(
                              title: textsGlobal.titleLoremIpsum,
                              text: textsGlobal.textLoremIpsum,
                            ),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () => routes.signIn(context: context),
                          child: SizedBox(
                              width: 85 * SizeConfig.widthMultiplier,
                              child: CustomButton(
                                  color: colors.primary500,
                                  border: colors.primary500,
                                  colorText: Colors.white,
                                  radius: 50,
                                  text: 'Iniciar Sesión'))),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      SizedBox(
                          width: 85 * SizeConfig.widthMultiplier,
                          child: GestureDetector(
                              onTap: () => routes.signUp(context: context),
                              child: CustomButton(
                                  color: Colors.white,
                                  border: colors.primary500,
                                  colorText: colors.primary500,
                                  radius: 50,
                                  text: 'Registrarme'))),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    ],
                  )
                ],
              ))),
    );
  }
}
