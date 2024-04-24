import 'package:flutter/material.dart';
import 'package:prueba_binance_isaac_sanchez/core/services/whatsapp.dart';

import '../../../../core/ui/design/molecules/buttons/custom_button.dart';
import '../../../../core/ui/utils/paths/colors_utils.dart';
import '../../../core/ui/utils/routes/routes.dart';
import '../../../core/ui/utils/size/size_config.dart';

class ProfileButtonsWidget extends StatefulWidget {
  const ProfileButtonsWidget({super.key});
  @override
  State<ProfileButtonsWidget> createState() => _ProfileButtonsWidget();
}

class _ProfileButtonsWidget extends State<ProfileButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5 * SizeConfig.widthMultiplier),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => whatsappServices.whatsappRedirect(
                message:
                    'Hola he revisado tu prueba y quisiera hablar contigo'),
            child: CustomButton(
                color: colors.primary500,
                border: colors.primary500,
                colorText: Colors.white,
                text: 'Contactar',
                radius: 50),
          ),
          SizedBox(
            height: 2 * SizeConfig.heightMultiplier,
          ),
          GestureDetector(
              onTap: () => routes.signIn(context: context),
              child: CustomButton(
                  color: colors.error600,
                  border: colors.error600,
                  colorText: Colors.white,
                  text: 'Cerrar Sesión',
                  radius: 50)),
          SizedBox(
            height: 2 * SizeConfig.heightMultiplier,
          ),
        ],
      ),
    );
  }
}
