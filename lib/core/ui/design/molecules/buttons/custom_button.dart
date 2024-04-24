import 'package:flutter/cupertino.dart';

import '../../../utils/size/size_config.dart';
import '../../atoms/texts/buttons/button_bold.dart';

class CustomButton extends StatelessWidget {
  final dynamic color;
  final dynamic border;
  final dynamic text;
  final dynamic colorText;
  final double radius;
  const CustomButton(
      {super.key,
      required this.color,
      required this.border,
      required this.colorText,
      required this.text,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: 1.5 * SizeConfig.heightMultiplier,
            bottom: 1.5 * SizeConfig.heightMultiplier,
            left: 5 * SizeConfig.widthMultiplier,
            right: 5 * SizeConfig.widthMultiplier),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: border),
            borderRadius: BorderRadius.all(
                Radius.circular(radius * SizeConfig.widthMultiplier))),
        child: ButtonBold(
          title: text,
          color: colorText,
          align: TextAlign.center,
          fontWeight: FontWeight.bold,
        ));
  }
}
