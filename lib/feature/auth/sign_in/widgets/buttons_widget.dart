import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/design/molecules/buttons/custom_icon_text_button.dart';

import '../../../../core/ui/design/atoms/texts/body/md_p.dart';
import '../../../../core/ui/design/molecules/buttons/custom_button.dart';
import '../../../../core/ui/utils/paths/colors_utils.dart';
import '../../../../core/ui/utils/size/size_config.dart';

class ButtonsWidget extends StatefulWidget {
  final Function login;
  final Function biometricLogin;
  const ButtonsWidget(
      {super.key, required this.login, required this.biometricLogin});
  @override
  State<ButtonsWidget> createState() => _ButtonsWidget();
}

class _ButtonsWidget extends State<ButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        GestureDetector(
            onTap: () => widget.login(),
            child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                    color: colors.primary500,
                    border: colors.primary500,
                    colorText: Colors.white,
                    radius: 50,
                    text: 'Iniciar Sesión'))),
        SizedBox(
          height: 6 * SizeConfig.heightMultiplier,
        ),
        Container(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30 * SizeConfig.widthMultiplier,
                child: Divider(
                  color: colors.neutral100,
                  height: 1,
                ),
              ),
              MdP(
                  title: 'o bien',
                  color: colors.neutral500,
                  align: TextAlign.center,
                  fontWeight: FontWeight.w500),
              SizedBox(
                width: 30 * SizeConfig.widthMultiplier,
                child: Divider(
                  color: colors.neutral100,
                  height: 1,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 6 * SizeConfig.heightMultiplier,
        ),
        GestureDetector(
            onTap: () => widget.biometricLogin(),
            child: SizedBox(
                width: 30 * SizeConfig.widthMultiplier,
                child: CustomIconTextButton(
                    color: Colors.white,
                    border: colors.primary500,
                    colorText: colors.primary500,
                    text: 'Huella/Face ID',
                    radius: 4,
                    icon: PhosphorIcons.fingerprint())))
      ],
    );
  }
}
